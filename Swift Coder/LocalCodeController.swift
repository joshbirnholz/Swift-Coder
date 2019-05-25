//
//  CodeController.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 8/14/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Cocoa
import SourceKittenFramework

class LocalCodeController: CodeController {
	
	enum PathError: Error {
		case swift
		case swiftc
		case sdk
		case any(String)
		
		var name: String {
			switch self {
			case .swift, .swiftc: return "the Swift executable"
			case .sdk: return "the macOS SDK"
			case .any(let string): return string
			}
		}
		
		var localizedDescription: String {
			var message = "Couldn't reach \(name). "
			
			if LocalCodeController.shared.customToolchainURL == nil {
				message += "Xcode may not be installed. Download Xcode from the App Store."
			} else {
				message += "The selected toolchain may be invalid."
			}
			
			return message
		}
	}
	
	public var isLoggingEnabled: Bool = true
	
	public let applicationSupportDirectory: URL
	
	private var activeUsername: String?
	
	public func setActiveUsername(_ username: String?) {
		self.activeUsername = username
	}
	
	public func getActiveUserName() -> String? {
		return activeUsername
	}
	
	public var baseDirectory: URL {
		if let activeUsername = activeUsername {
			let url = applicationSupportDirectory.appendingPathComponent("users").appendingPathComponent(activeUsername, isDirectory: true)
			
			var isDirectory: ObjCBool = false
			if !FileManager.default.fileExists(atPath: url.path, isDirectory: &isDirectory) {
				try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
			}
			
			return url
		} else {
			return applicationSupportDirectory
		}
	}
	
	func validateUsername(_ username: String) -> Bool {
		return !username.isEmpty && !username.contains(":") && !username.contains("/")
	}
	
	public let tempDirectory: URL
	
	public var customToolchainURL: URL? {
		get {
			return UserDefaults.standard.url(forKey: "customToolchainPath")
		}
		set {
			UserDefaults.standard.set(newValue, forKey: "customToolchainPath")
			
			if newValue == nil {
				self.xcrunSwiftcPath = try? xcrunFind("swift")
				self.xcrunSwiftcPath = try? xcrunFind("swiftc")
			}
		}
	}
	
	public func setShouldIncludeStringSubscriptAPI(_ shouldInclude: Bool) {
		includeStringIntSubscriptAPI = shouldInclude
	}
	
	public func shouldIncludeStringSubscriptAPI() -> Bool {
		return includeStringIntSubscriptAPI
	}
	
	public var includeStringIntSubscriptAPI: Bool {
		get {
			return UserDefaults.standard.bool(forKey: #function)
		}
		set {
			UserDefaults.standard.set(newValue, forKey: #function)
		}
	}
	
	let isSandboxed = ProcessInfo.processInfo.environment["APP_SANDBOX_CONTAINER_ID"] != nil
	
	public static let shared = LocalCodeController()
	
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
		
		applicationSupportDirectory = dir
		
		do {
			tempDirectory = try FileManager.default.url(for: .itemReplacementDirectory, in: .userDomainMask, appropriateFor: dir, create: true)
		} catch {
			fatalError("Couldn't get temp directory")
		}
		
		print(baseDirectory.path)
		print(tempDirectory.path)
	}
	
	private let xcodeDefaultToolchainPath = NSSearchPathForDirectoriesInDomains(.applicationDirectory, .systemDomainMask, true).first?.appending("/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain")
	private let xcodeDefaultSDKPath = NSSearchPathForDirectoriesInDomains(.applicationDirectory, .systemDomainMask, true).first?.appending("/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk")
	
	func xcrunFind(_ utility: String, localizedDescription: String? = nil) throws -> String {
		if isSandboxed {
			guard let path = xcodeDefaultToolchainPath.flatMap({ "\($0)/usr/bin/\(utility)" }) else {
				throw PathError.any(localizedDescription ?? utility)
			}
			print(#function, path)
			return path
		} else {
			let path = try self.execute(arguments: ["xcrun", "-find", utility]).output
			
			guard FileManager.default.fileExists(atPath: path) else {
				throw PathError.any(localizedDescription ?? utility)
			}
			
			return path
		}
		
	}
	
	private lazy var xcrunSwiftPath: String? = {
		try? self.xcrunFind("swift")
	}()
	
	private lazy var xcrunSwiftcPath: String? = {
		try? self.xcrunFind("swiftc")
	}()
	
	private func swiftPath() throws -> String {
		var path: String?
		
		if let customToolchainPath = customToolchainURL {
			path = customToolchainPath
				.appendingPathComponent("usr", isDirectory: true)
				.appendingPathComponent("bin", isDirectory: true)
				.appendingPathComponent("swift", isDirectory: false)
				.path
		} else if let p = xcrunSwiftPath {
			path = p
		}
		
		guard let p = path, FileManager.default.fileExists(atPath: p) else {
			throw PathError.swift
		}
		
		return p
	}
	
	private func swiftcPath() throws -> String {
		var path: String?
		
		if let customToolchainPath = customToolchainURL {
			path = customToolchainPath
				.appendingPathComponent("usr", isDirectory: true)
				.appendingPathComponent("bin", isDirectory: true)
				.appendingPathComponent("swift", isDirectory: false)
				.path
		} else if let p = xcrunSwiftcPath {
			path = p
		}
		
		guard let p = path, FileManager.default.fileExists(atPath: p) else {
			throw PathError.swiftc
		}
		
		return p
	}
	
	public func sdkPath() throws -> String {
		if isSandboxed {
			guard let path = xcodeDefaultSDKPath, FileManager.default.fileExists(atPath: path) else {
				throw PathError.sdk
			}
			return path
		} else {
			return SourceKittenFramework.sdkPath()
		}
	}
	
	func swiftVersionString() -> String? {
		guard let swiftPath = try? swiftPath() else { return nil }
		if let fullVersionString = try? self.execute(launchPath: swiftPath, arguments: ["--version"], timeout: nil).output {
			return fullVersionString.matches(forRegex: ".+?(?= \\()").first?.fullMatch.value
		}
		
		return nil
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
		
		if isLoggingEnabled {
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
	/// The default output path is /dev/null, which will throw away the executable, but the compiler output will still be returned.
	@discardableResult private func swiftc(filePath: String, outputPath: String = "/dev/null", timeout: TimeInterval? = nil) throws -> (output: String, exitCode: Int32) {
		print("Compiling \(filePath)")
		return try execute(launchPath: swiftcPath(), arguments: ["-sdk", sdkPath(), filePath, "-o", outputPath], timeout: timeout)
	}
	
	fileprivate func runTest(testCase: Problem.TestCase, for problem: Problem) throws -> CompilationResult.TestResult {
//		print("Running \(problem.functionCall(with: testCase.arguments))")
		
		var command: [String] = testCase.arguments.map {
			let argString = $0.stringRepresentation
			return (argString == "" && $0 is String ? "String.empty" : argString).data(using: .utf8)!.base64EncodedString()
		}
		
		if let customTesterOutputCode = problem.customTesterOutputCode, customTesterOutputCode.contains("__expectedResult") {
			let expectedResultString = testCase.expectedResult.stringRepresentation
			
			if expectedResultString == "" {
				command.append("String.empty".data(using: .utf8)!.base64EncodedString())
			} else {
				command.append(expectedResultString.data(using: .utf8)!.base64EncodedString())
			}
			
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
			
			let success: Bool
			
			if problem.customTesterOutputCode != nil {
				return CompilationResult.TestResult(run: runResult.output, success: runResult.exitCode == Int32.success ? .ok : .failure, runTime: runTime)
			} else {
				guard let typedOutput = problem.actualReturnType.init(runResult.output) else {
					return CompilationResult.TestResult(run: runResult.output, success: .error, runTime: runTime)
				}
				success = AnyEquatableStringConvertible(typedOutput) == testCase.expectedResult
				
				return CompilationResult.TestResult(run: typedOutput.displayDescription, success: success ? .ok : .failure, runTime: runTime)
			}
			
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
				
				var results: [CompilationResult.TestResult] = Array.init(repeating: CompilationResult.TestResult(run: "", success: .error, runTime: 0), count: problem.testCases.count * problem.numberOfTimesToTest)
				let queue = OperationQueue()
				queue.qualityOfService = .userInteractive
				
				let operations = problem.testCases.duplicated(times: problem.numberOfTimesToTest).enumerated().map { i, testCase in
					BlockOperation {
						do {
							results[i] = try self.runTest(testCase: testCase, for: problem)
						} catch {
							// Runtime errors caused by user code
							results[i] = CompilationResult.TestResult(run: "error testing code: \(error.localizedDescription)", success: .error, runTime: 0)
						}
					}
				}
				
				queue.addOperations(operations, waitUntilFinished: true)
				
				if problem.numberOfTimesToTest > 1 {
					let chunks = results.chunked(by: problem.testCases.count)
					let chunk: [CompilationResult.TestResult] = chunks.first { r in
						r.contains(where: { $0.success != .ok })
						} ?? chunks[0]
					result = .success(chunk)
				} else {
					result = .success(results)
				}
				
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
		let fileURL = baseDirectory.appendingPathComponent(problem.functionName + ".swift")
		
		do {
			let code = try String(contentsOf: fileURL)
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
		var runnableCode = code + "\n\n"
		
		let printReplacement = """
		func print(_ items: Any..., separator: String = "", terminator: String = "") {
		
		}
		

		"""
		
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
		
		let types: [StringConvertible.Type] = {
			var dict = [String: StringConvertible.Type]()
			dict[problem.actualReturnType.convertibleTypeName] = problem.actualReturnType
			for param in problem.parameters {
				dict[param.actualType.convertibleTypeName] = param.actualType
			}
			return Array(dict.values)
		}()
		
		if types.contains(where: { $0.helperCodeNeedsCoders }) {
			runnableCode += """
			let decoder = JSONDecoder()
			let encoder = JSONEncoder()
			
			
			"""
		}
		
		for type in types {
			runnableCode += type.helperCode
		}
		
		for (index, parameter) in problem.parameters.enumerated() {
			
			if parameter.actualType == String.self {
				// Don't need to convert type, so no need for optional checking with a string.
				runnableCode += """
				guard let __param\(index): \(parameter.actualType.runnableTesterParameterTypeName) = Data(base64Encoded: CommandLine.arguments[\(index + 1)]).flatMap({ String(data: $0, encoding: .utf8) }).flatMap({ $0 == "String.empty" ? "" : $0 }) else {
					Swift.print("Incorrect argument type for \(parameter.name)")
					exit(-1)
				}
				
				
				"""
			} else {
				runnableCode += """
				guard let __param\(index): \(parameter.actualType.runnableTesterParameterTypeName) = Data(base64Encoded: CommandLine.arguments[\(index + 1)]).flatMap({ String(data: $0, encoding: .utf8) }).flatMap(\(parameter.actualType.runnableTesterParameterTypeName).init) else {
					Swift.print("Incorrect argument type for \(parameter.name)")
					exit(-1)
				}
				
				
				"""
				
			}
		}
		
		if let onRunTest = problem.onRunTest {
			runnableCode += "do {\n" + onRunTest + "}\n\n"
		}
		
		let needsStringRepresentationPrinted = problem.actualReturnType.needsCustomStringRepresentation
		
		let isTupleType = returnType.contains("Tuple")
		
		let paramsString = (problem.extensionType == nil ? problem.parameters : Array(problem.parameters.dropFirst())).enumerated().map { index, parameter in
			let index = problem.extensionType == nil ? index : index + 1
			return "\(parameter.label == "_" ? "" : "\(parameter.label): ")__param\(index)"
			}.joined(separator: ", ")
		
		if let customTesterOutputCode = problem.customTesterOutputCode {
			runnableCode += Int32.exitCode + "\n\n"
			
			if customTesterOutputCode.contains("__expectedResult") {
				runnableCode += """
				guard let __expectedResult: String = Data(base64Encoded: CommandLine.arguments[\(problem.parameters.count + 1)]).flatMap({ String(data: $0, encoding: .utf8) }).flatMap({ $0 == "String.empty" ? "" : $0 }) else {
				Swift.print("Incorrect argument type for expected result")
				exit(-1)
				}
				
				
				"""
			}
			
			runnableCode += customTesterOutputCode
			return runnableCode
		}
		
		runnableCode += """
		let __result: \(problem.actualReturnType.convertibleTypeName) = \(problem.extensionType == nil ? "" : "__param0.")\(problem.functionName)(\(paramsString))
		
		"""
		
		if isTupleType {
			runnableCode += """
			var __resultTuple = StringConvertibleTwoElementTuple(__result)
			
			func setResultTupleLabels() {
				let mirror = Mirror(reflecting: \(problem.functionName))
				let returnTypeString = String(describing: mirror.subjectType)
				let pattern = "-> \\\\(([a-zA-Z0-9_]+): ([a-zA-Z0-9_\\\\[\\\\] :<>,]+), ([a-zA-Z0-9_]+): ([a-zA-Z0-9_\\\\[\\\\] :<>,]+)\\\\)"
				guard let expression = try? NSRegularExpression(pattern: pattern, options: []),
					let match = expression.matches(in: returnTypeString, options: [], range: NSRange(returnTypeString.startIndex..., in: returnTypeString)).first else {
					return
				}
				let r: Range<Int> = (0 ..< match.numberOfRanges)
				let groups: [String] = r.compactMap {
					guard let range = Range(match.range(at: $0), in: returnTypeString) else { return nil }
					return String(returnTypeString[range])
				}
			
				guard groups.count >= 3 else { return }
			
				__resultTuple.label0 = groups[1]
				__resultTuple.label1 = groups[3]
			}
			setResultTupleLabels()
			
			"""
		}
		
		runnableCode += """
		Swift.print(\(isTupleType ? "__resultTuple" : "__result")\(needsStringRepresentationPrinted ? ".stringRepresentation" : ""))
		"""
		
		return runnableCode
	}
	
	func cleanupTemporaryFiles() {
		do {
			// Delete temporary files
			try FileManager.default.removeItem(at: tempDirectory)
		} catch {
			NSLog("Error: Could not delete contents of \(tempDirectory.path): \(error)")
		}
	}
	
	func getUsernames() -> [String] {
		do {
			return try FileManager.default.contentsOfDirectory(at: applicationSupportDirectory.appendingPathComponent("users"), includingPropertiesForKeys: [.isDirectoryKey], options: []).compactMap { $0.hasDirectoryPath ? $0.lastPathComponent : nil }
		} catch {
			return []
		}
	}
	
	func deleteUser(_ username: String) {
		do {
			try FileManager.default.trashItem(at: applicationSupportDirectory.appendingPathComponent("users").appendingPathComponent(username), resultingItemURL: nil)
			
			UserDefaults.standard.dictionaryRepresentation().keys.filter { $0.hasPrefix("user-\(username)-solved-") }.forEach { UserDefaults.standard.removeObject(forKey: $0) }
		} catch {
			
		}
	}
	
	fileprivate func solvedKey(forUser username: String?, problem: Problem) -> String {
		return "user-\(username ?? "")-solved-\(problem.title)"
	}
	
	func user(_ username: String?, didSolve problem: Problem) {
		let key = solvedKey(forUser: username, problem: problem)
		UserDefaults.standard.set(true, forKey: key)
	}
	
	func user(_ username: String?, hasSolved problem: Problem) -> Bool {
		let key = solvedKey(forUser: username, problem: problem)
		return UserDefaults.standard.bool(forKey: key)
	}
	
	func deleteUserRecords(forUser username: String?, problem: Problem) throws {
		
		try saveCode(problem.startingCode, for: problem)
		
		let key = solvedKey(forUser: username, problem: problem)
		UserDefaults.standard.removeObject(forKey: key)
	}
	
}
