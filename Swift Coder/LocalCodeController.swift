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
	
	private let stringAPI: String = {
		let apiPath = Bundle.main.url(forResource: "StringAPI", withExtension: "txt")!.path
		let stringAPI = try? String(contentsOfFile: apiPath)
		return stringAPI ?? ""
	}()
	
	private let codePrefix = "import Foundation\n\n"
	
	private lazy var codePrefixLineCount: Int = {
		var lineCount = 0
		(codePrefix as NSString).enumerateLines { _, _ in
			lineCount += 1
		}
		return lineCount
	}()
	
	private lazy var stringAPILineCount: Int = {
		var lineCount = 0
		(stringAPI as NSString).enumerateLines { _, _ in
			lineCount += 1
		}
		return lineCount
	}()
	
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
		
		// call dropLast() on the resulting string to get rid of the trailing newline (but don't get rid of ALL trailing whitespace because it may be intentional
		output = String(data: outpipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8).map { String($0.dropLast()) }
		
		if error != "timeout" {
			error = String(data: errpipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
		}
		
		if let e = error, e.isEmpty {
			error = nil
		}
		
		task.waitUntilExit()
		
		if let error = error {
			if error.lowercased().contains("error") {
				let messages = self.messages(from: error)
				
				if messages.isEmpty {
					throw CompilationError.error(.text(error))
				} else {
					throw CompilationError.error(.compilerMessages(messages))
				}
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
	
	func messages(from compilerError: String) -> [CompilerMessage] {
		let compilerError = compilerError.replacingOccurrences(of: baseDirectory.path + "/", with: "").replacingOccurrences(of: tempDirectory.path + "/", with: "")
		
		return compilerError.matches(forRegex: "(^[a-zA-Z0-9_]+\\.[a-zA-Z]+):(\\d+):(\\d+): ([a-zA-Z]+): (\\V+)\\n(.+?(?=^[a-zA-Z0-9_]+\\.[a-zA-Z]+|\\z))", options: [.anchorsMatchLines, .dotMatchesLineSeparators]).compactMap { match in
			let file = match.groups[0]
			let line = match.groups[1]
			let char = match.groups[2]
			let type = match.groups[3]
			let info = match.groups[4]
			let help = match.groups[5]
			guard let lineNumber = Int(line.value), let charNumber = Int(char.value), let messageType = CompilerMessage.MessageType(rawValue: type.value) else { return nil }
			
			// The user doesn't see the "import Foundation" lines or the added String API that are prepended to their code, so subtract the lines from the displayed line number so that what they see matches up with the code they wrote.
			let lineNumberModifier = file.value.hasPrefix("runnable") ? 0 : codePrefixLineCount + (includeStringIntSubscriptAPI ? stringAPILineCount : 0)
			
			return CompilerMessage(file: file.value, line: lineNumber - lineNumberModifier, character: charNumber, messageType: messageType, message: info.value, helpText: help.value)
		}
	}
	
	/// Executes a Swift source code file, throwing any compilation errors, and returning the output.
	@discardableResult private func swift(filePath: String, arguments: [String] = [], timeout: TimeInterval? = nil) throws -> (output: String, exitCode: Int32) {
		print("Running \(filePath)")
		return try execute(launchPath: swiftPath(), arguments: ["-sdk", sdkPath(), filePath] + arguments, timeout: timeout)
	}
	
	/// Compiles a Swift source code file to the given output path, throwing any compilation errors.
	/// The default output path is /dev/null, which will disregard away the executable.
	@discardableResult private func swiftc(filePath: String, outputPath: String = "/dev/null", timeout: TimeInterval? = nil) throws -> (output: String, exitCode: Int32) {
		print("Compiling \(filePath)")
		return try execute(launchPath: swiftcPath(), arguments: ["-sdk", sdkPath(), filePath, "-o", outputPath], timeout: timeout)
	}
	
	fileprivate func runTest(testCase: Problem.TestCase, for problem: Problem) throws -> CompilationResult.TestResult {
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
			
			guard let typedOutput = problem.actualReturnType.init(runResult.output)?.asEquatable() else {
					return CompilationResult.TestResult(run: runResult.output, success: .error, runTime: runTime)
			}
			
			let success = typedOutput == testCase.actualExpectation
			
			return CompilationResult.TestResult(run: String(describing: typedOutput), success: success ? .ok : .failure, runTime: runTime)
		} catch let error as CompilationError {
			let runTime = Date().timeIntervalSince(startTime)
			
			switch error {
			case .error(let contents):
				switch contents {
				case .compilerMessages(let messages):
					return CompilationResult.TestResult(run: messages.map { $0.description }.joined(separator: "\n"), success: .error, runTime: runTime)
				case .text(let string):
					return CompilationResult.TestResult(run: string.components(separatedBy: "\n").filter { !$0.contains("runnable_") }.joined(separator: "\n"), success: .error, runTime: runTime)
				}
//				return CompilationResult.TestResult(run: "\(messages.count)", success: .error, runTime: runTime)
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
				let code: String = {
					var c = self.codePrefix
					
					if self.includeStringIntSubscriptAPI {
						c += self.stringAPI
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
				} catch {
					// Problem compiling runnable tester
					result = .internalError(error)
					return
				}
				
				var results: [CompilationResult.TestResult] = Array.init(repeating: CompilationResult.TestResult(run: "", success: .error, runTime: 0), count: problem.testCases.count)
				let queue = OperationQueue()
				queue.qualityOfService = .userInteractive
				
				let operations = (0 ..< problem.testCases.count).map { i in
					BlockOperation {
						do {
							results[i] = try self.runTest(testCase: problem.testCases[i], for: problem)
						} catch {
							// Runtime errors caused by user code
							results[i] = CompilationResult.TestResult(run: "error testing code: \(error.localizedDescription)", success: .error, runTime: 0)
						}
					}
				}
				
				queue.addOperations(operations, waitUntilFinished: true)
				
				result = .success(results)
				
			} catch let error as CompilationError {
				// Compile-time errors caused by user code
				result = CompilationResult.failure(error)
			} catch {
				// Unknown error
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
		
		if problem.parameters.contains(where: { $0.actualType == String.self }) {
			runnableCode += """
			extension String {
				static var empty: String {
					return ""
				}
			}
			
			
			"""
		}
		
		let returnType = String(describing: problem.actualReturnType)
		var addedCoders = false
		
		if returnType.contains("Array") || problem.parameters.contains(where: { String(describing: $0.actualType).contains("Array") }) {
			runnableCode += """
			let decoder = JSONDecoder()
			let encoder = JSONEncoder()
			
			extension Array: LosslessStringConvertible where Element: Codable {
				public init?(_ description: String) {
					guard let data = description.data(using: .utf8) else { return nil }
					guard let arr = try? decoder.decode([Element].self, from: data) else { return nil }
			
					self = arr
				}
				var stringRepresentation: String {
					return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
				}
			}
			
			"""
			addedCoders = true
		}
		
		if returnType.contains("Dictionary") || problem.parameters.contains(where: { String(describing: $0.actualType).contains("Dictionary") }) {
			if !addedCoders {
				runnableCode += """
				let decoder = JSONDecoder()
				let encoder = JSONEncoder()
				
				
				"""
			}
			
			runnableCode += """
			extension Dictionary: LosslessStringConvertible where Key: Codable, Value: Codable & Equatable {
				public init?(_ description: String) {
					guard let data = description.data(using: .utf8) else { return nil }
					guard let arr = try? decoder.decode([Key: Value].self, from: data) else { return nil }
			
					self = arr
				}
				var stringRepresentation: String {
					return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[:]"
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
		
		let needsStringRepresentationPrinted = returnType.contains("Array") || returnType.contains("Dictionary")
		
		runnableCode += """
		let __result: \(problem.returnType) = \(problem.functionName)(\(problem.parameters.enumerated().map { index, parameter in "\(parameter.name): __param\(index)" }.joined(separator: ", ")))
		
		Swift.print(__result\(needsStringRepresentationPrinted ? ".stringRepresentation" : ""))
		"""
		
		return runnableCode
	}
	
}
