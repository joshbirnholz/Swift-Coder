//
//  CodeController.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 8/14/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Cocoa

class LocalCodeController {
	
	enum PathError: Error {
		case swift
		case swiftc
		case sdk
		case xcode
		
		var name: String {
			switch self {
			case .swift, .swiftc: return "the Swift executable"
			case .sdk: return "the macOS SDK"
			case .xcode: return "Xcode"
			}
		}
		
		var localizedDescription: String {
			return "Couldn't reach \(name). Make sure Xcode is installed and the path is set correctly.\n\nDownload Xcode:\nhttps://developer.apple.com/xcode/\nhttps://itunes.apple.com/us/app/xcode/id497799835?mt=12"
		}
	}
	
	public var logCommands: Bool = false
	
	public let baseDirectory: URL
	public let tempDirectory: URL
	public var xcodeURL: URL {
		get {
			return UserDefaults.standard.url(forKey: "xcodeURL") ?? URL(fileURLWithPath: "/Applications/Xcode.app")
		}
		set {
			UserDefaults.standard.set(newValue, forKey: "xcodeURL")
		}
	}
	
	public var includeStringIntSubscriptAPI: Bool {
		get {
			return UserDefaults.standard.bool(forKey: #function)
		}
		set {
			UserDefaults.standard.set(newValue, forKey: #function)
		}
	}
	
	public var stringIntSubscriptAPIShouldUseStringReturnType: Bool {
		get {
			return UserDefaults.standard.bool(forKey: #function)
		}
		set {
			UserDefaults.standard.set(newValue, forKey: #function)
		}
	}
	
	public static let shared = LocalCodeController()
	
	private let isSandboxed = ProcessInfo.processInfo.environment["APP_SANDBOX_CONTAINER_ID"] != nil
	
	private init() {
		print("Sandboxed:", isSandboxed)
		guard let dir = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first?.appendingPathComponent("Swift Coder", isDirectory: true) else {
			fatalError("Couldn't get application support directory")
		}
		
		if !FileManager.default.fileExists(atPath: dir.path) {
			do {
				try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true, attributes: nil)
			} catch {
				fatalError("Couldn't get application support directory")
			}
		}
		
		baseDirectory = dir
		
		do {
			tempDirectory = try FileManager.default.url(for: .itemReplacementDirectory, in: .userDomainMask, appropriateFor: dir, create: true)
		} catch {
			fatalError("Couldn't get temp directory")
		}
		
		print(xcodeURL.path)
		print(baseDirectory.path)
		print(tempDirectory.path)
	}
	
	private func swiftPath() throws -> String {
		guard FileManager.default.fileExists(atPath: xcodeURL.path) else {
			throw PathError.xcode
		}
		
		let path = xcodeURL.appendingPathComponent("Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift").path
		guard FileManager.default.fileExists(atPath: path) else {
			throw PathError.swift
		}
		return path
	}
	
	private func swiftcPath() throws -> String {
		guard FileManager.default.fileExists(atPath: xcodeURL.path) else {
			throw PathError.xcode
		}
		
		let path = xcodeURL.appendingPathComponent("Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc").path
		guard FileManager.default.fileExists(atPath: path) else {
			throw PathError.swiftc
		}
		return path
	}
	
	private func sdkPath() throws -> String {
		guard FileManager.default.fileExists(atPath: xcodeURL.path) else {
			throw PathError.xcode
		}
		
		let path = xcodeURL.appendingPathComponent("Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk").path
		guard FileManager.default.fileExists(atPath: path) else {
			throw PathError.sdk
		}
		return path
	}
	
	private func execute(launchPath: String = "/usr/bin/env", arguments: [String], timeout: TimeInterval? = nil) throws -> (output: String, exitCode: Int32) {
		
		let task = Process()
		task.launchPath = launchPath
		task.arguments = arguments
		
		let outpipe = Pipe()
		task.standardOutput = outpipe
		let errpipe = Pipe()
		task.standardError = errpipe
		
		if logCommands {
			print("$ \(launchPath) \(arguments.map { $0.contains(" ") ? "\"\($0)\"" : $0 }.joined(separator: " "))")
		}
		task.launch()
		
		var output: String?
		var error: String?
		
		if let timeout = timeout {
			DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + timeout) {
				print("async after -- task running: \(task.isRunning)")
				if task.isRunning {
					task.terminate()
					error = "timeout"
				}
			}
		}
		
		output = String(data: outpipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
		
		if error != "timeout" {
			error = String(data: errpipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
		}
		
		if let e = error, e.isEmpty {
			error = nil
		}
		
		task.waitUntilExit()
		
		if let error = error {
			if error.lowercased().contains("error") {
				var actualErrorText = error.replacingOccurrences(of: baseDirectory.path + "/", with: "").replacingOccurrences(of: tempDirectory.path + "/", with: "")
				var lines = actualErrorText.split(separator: "\n")
				
				for (index, line) in lines.enumerated() {
					if let range = line.range(of: ".swift:") {
						lines[index] = "line " + line[range.upperBound...]
					}
				}
				
				actualErrorText = lines.joined(separator: "\n")
				throw CompilationError.error(actualErrorText)
			} else if error == "timeout" {
				throw CompilationError.timeout
			}
		}
		
		if let output = output {
			return (output, task.terminationStatus)
		} else {
			return ("", task.terminationStatus)
		}
	}
	
	/// Executes a Swift source code file, throwing any compilation errors, and returning the output.
	@discardableResult private func swift(filePath: String, arguments: [String] = [], timeout: TimeInterval? = nil) throws -> (output: String, exitCode: Int32) {
		print("Running \(filePath)")
		//		return try execute(arguments: ["xcrun", "-sdk", "macosx", "swiftc", filePath, "-o", outputPath])
		return try execute(launchPath: swiftPath(), arguments: ["-sdk", sdkPath(), filePath] + arguments, timeout: timeout)
	}
	
	/// Compiles a Swift source code file to the given output path, throwing any compilation errors.
	/// The default output path is /dev/null, which will disregard away the executable.
	@discardableResult private func swiftc(filePath: String, outputPath: String = "/dev/null", timeout: TimeInterval? = nil) throws -> (output: String, exitCode: Int32) {
		print("Compiling \(filePath)")
		//		return try execute(arguments: ["xcrun", "-sdk", "macosx", "swiftc", filePath, "-o", outputPath])
		return try execute(launchPath: swiftcPath(), arguments: ["-sdk", sdkPath(), filePath, "-o", outputPath], timeout: timeout)
	}
	
	fileprivate func runTest(testCase: Problem.TestCase, for problem: Problem) throws -> CompilationResult.TestResult {
		var success = false
		
		precondition(problem.testCases.contains(testCase), "Trying to test a case from a different problem")
		
//		print("Running \(problem.functionCall(with: testCase.arguments))")
		
		let command = testCase.arguments.map {
			($0 == "" ? "String.empty" : $0).data(using: .utf8)!.base64EncodedString()
		}
		
		let startTime = Date()
		
		do {
			
			let runResult: (output: String, exitCode: Int32)

			if self.isSandboxed {
				let path = tempDirectory.appendingPathComponent("runnable_\(problem.functionName).swift", isDirectory: false).path
				runResult = try swift(filePath: path, arguments: command, timeout: 10)
			} else {
				let path = tempDirectory.appendingPathComponent("runnable_\(problem.functionName)").path
				runResult = try execute(launchPath: path, arguments: command, timeout: 10)
			}
			
			let runTime = Date().timeIntervalSince(startTime)
			
			print("Finished Running \(problem.functionCall(with: testCase.arguments))")
			
			let output = problem.returnType == "String" ? "\"" + runResult.output + "\"" : runResult.output
			
			if output == testCase.expectation {
				success = true
			}
			
			return CompilationResult.TestResult(run: output, success: success ? .ok : .failure, runTime: runTime)
		} catch let error as CompilationError {
			let runTime = Date().timeIntervalSince(startTime)
			
			switch error {
			case .error(let errorOutput):
				return CompilationResult.TestResult(run: errorOutput.components(separatedBy: "\n").filter { !$0.contains("runnable_") }.joined(separator: "\n"), success: .error, runTime: runTime)
			case .timeout:
				return CompilationResult.TestResult(run: "error: timeout", success: .error, runTime: runTime)
			}
			
		} catch {
			throw error
		}
		
	}
	
	/// Be sure to save the code first before calling test!
	func saveAndTest(_ code: String, for problem: Problem, completion: @escaping (CompilationResult) -> ()) throws {
		
		try self.saveCode(code, for: problem)
		
		DispatchQueue.global(qos: .userInteractive).async {
			let result: CompilationResult
			
			defer {
				DispatchQueue.main.async {
					completion(result)
				}
			}
			
			do {
				// Try compiling code on its own. If there are compile errors, they will be thrown
				let filePath = self.tempDirectory.appendingPathComponent(problem.functionName + ".swift").path
				let code: String = try {
					var c = "import Foundation\n\n"
					
					if self.includeStringIntSubscriptAPI {
						let resourceName = self.stringIntSubscriptAPIShouldUseStringReturnType ? "StringAPI StringReturn" : "StringAPI"
						let apiPath = Bundle.main.url(forResource: resourceName, withExtension: "txt")!.path
						let stringAPI = try String(contentsOfFile: apiPath)
						
						c += stringAPI
					}
					
					return c + code
				}()
				
				try code.write(toFile: filePath, atomically: true, encoding: .utf8)
				
				try self.swift(filePath: filePath)
				
				// If successful, compile runnable tester
				let runnableProgramSourcePath = self.tempDirectory.appendingPathComponent("runnable_" + problem.functionName + ".swift").path
				let runnableProgramExecutablePath = self.tempDirectory.appendingPathComponent("runnable_" + problem.functionName).path
				let runnableProgram = self.runnableProblemCode(for: problem, code: code)
				
				do {
					// Write runnable tester
					try runnableProgram.write(toFile: runnableProgramSourcePath, atomically: true, encoding: .utf8)
					
					// Check for compile errors in the runnable testers, throw an error if any are found
					try self.swiftc(filePath: runnableProgramSourcePath, outputPath: self.isSandboxed ? "/dev/null" : runnableProgramExecutablePath)
					
					var results: [CompilationResult.TestResult] = Array.init(repeating: CompilationResult.TestResult(run: "", success: .error, runTime: 0), count: problem.testCases.count)
					let queue = OperationQueue()
					queue.qualityOfService = .userInteractive
					
					let operations = (0 ..< problem.testCases.count).map { i in
						BlockOperation {
							do {
								results[i] = try self.runTest(testCase: problem.testCases[i], for: problem)
							} catch {
								results[i] = CompilationResult.TestResult(run: "error testing code: \(error.localizedDescription)", success: CompilationResult.TestResult.Successful.error, runTime: 0)
							}
						}
					}
					
					queue.addOperations(operations, waitUntilFinished: true)
					
					result = .success(results)
					
				} catch {
					result = .internalError(error)
				}
			} catch let error as CompilationError {
				result = CompilationResult.failure(error)
			} catch {
				result = .internalError(error)
			}
		}
	}
	
	func saveCode(_ code: String, for problem: Problem) throws {
		let programFilePath = baseDirectory.appendingPathComponent(problem.functionName + ".swift").path
		try code.write(toFile: programFilePath, atomically: true, encoding: String.Encoding.utf8)
	}
	
	func loadCode(for problem: Problem) -> String {
		let file = baseDirectory.appendingPathComponent(problem.functionName + ".swift").path
		
		//reading
		do {
			let code = try String(contentsOfFile: file)
			if code.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
				return problem.startingCode
			} else {
				return code
			}
		}
		catch {
			return problem.startingCode
		}
	}
	
	private func runnableProblemCode(for problem: Problem, code: String) -> String {
		let printReplacement = """
		func print(_ items: Any..., separator: String = "", terminator: String = "") {
		
		}
		

		"""
		
		var runnableCode = code + "\n\n"
		
		runnableCode += printReplacement
		
		if problem.parameters.contains(where: { $0.type == "String" }) {
			runnableCode += """
			extension String {
				static var empty: String {
					return ""
				}
			}
			
			
			"""
		}
		
		if problem.parameters.contains(where: { ($0.type.first == "[" && $0.type.last == "]") || $0.type.last == ">" }) {
			runnableCode += """
			typealias RegexMatch = (range: Range<String.Index>, value: String)
			
			extension String {
				
				func matches(forRegex regex: String) -> [(fullMatch: RegexMatch, groups: [RegexMatch])] {
					do {
						let regex = try NSRegularExpression(pattern: regex)
						let results = regex.matches(in: self, range: NSRange(startIndex..., in: self))
						return results.map { result in
							let fullMatchRange = Range(result.range, in: self)!
							let groups: [RegexMatch]
							
							if result.numberOfRanges > 1 {
								groups = (1 ..< result.numberOfRanges).compactMap { i in
									guard let range = Range(result.range(at: i), in: self) else {
										return nil
									}
									let value = String(self[range])
									return (range: range, value: value)
								}
							} else {
								groups = []
							}
							
							let fullMatch = (range: fullMatchRange, value: String(self[fullMatchRange]))
							
							return (fullMatch, groups)
						}
					} catch {
						return []
					}
				}
				
			}
			
			extension Array: LosslessStringConvertible where Element: LosslessStringConvertible {
				public init?(_ description: String) {
					if let arr = description.matches(forRegex: "\\\\[(.*)]").first?.groups.first?.value.split(separator: ",").compactMap({
						Element($0.trimmingCharacters(in: .whitespacesAndNewlines))}) {
						if Element.self == String.self {
							self = (arr as! [String]).map {
								String($0[$0.index(after: $0.startIndex)..<$0.index(before: $0.endIndex)])
								} as! [Element]
						} else {
							self = arr
						}
					} else {
						return nil
					}
				}
			}
			
			"""
			
		}
		
		for (index, parameter) in problem.parameters.enumerated() {
			
			switch parameter.type {
			case "String":
				// Don't need to convert type, so no need for optional checking with a string.
				runnableCode += """
				guard let __param\(index): \(parameter.type) = Data(base64Encoded: CommandLine.arguments[\(index + 1)]).flatMap({ String(data: $0, encoding: .utf8) }).flatMap({ $0 == "String.empty" ? "" : $0 }) else {
					Swift.print("Incorrect argument type")
					exit(-1)
				}
				
				
				"""
			default:
				runnableCode += """
				guard let __param\(index): \(parameter.type) = Data(base64Encoded: CommandLine.arguments[\(index + 1)]).flatMap({ String(data: $0, encoding: .utf8) }).flatMap(\(parameter.type).init) else {
				Swift.print("Incorrect argument type")
					exit(-1)
				}
				
				
				"""
				
			}
		}
		
		runnableCode += """
		let __result: \(problem.returnType) = \(problem.functionName)(\(problem.parameters.enumerated().map { index, parameter in "\(parameter.name): __param\(index)" }.joined(separator: ", ")))
		
		Swift.print(__result)
		"""
		
		return runnableCode
	}
	
}
