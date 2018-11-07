//
//  CodeController.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 8/14/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

class LocalCodeController: CodeController {

	public let baseDirectory: URL
	public let tempDirectory: URL
	
	private init() {
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
	}
	
	public static let shared = LocalCodeController()
	
	private func execute(launchPath: String = "/usr/bin/env", command: String, timeout: TimeInterval? = nil) throws -> (output: String, exitCode: Int32) {
		let arguments = command.split(separator: " ").map(String.init)
		return try execute(launchPath: launchPath, arguments: arguments, timeout: timeout)
	}
	
	private func execute(launchPath: String = "/usr/bin/env", arguments: [String], timeout: TimeInterval? = nil) throws -> (output: String, exitCode: Int32) {
		
		let task = Process()
		task.launchPath = launchPath
		task.arguments = arguments
		
		let outpipe = Pipe()
		task.standardOutput = outpipe
		let errpipe = Pipe()
		task.standardError = errpipe
		
		print("Launching \(launchPath) \(arguments.joined(separator: " "))")
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
	
	@discardableResult private func swiftc(filePath: String, outputPath: String) throws -> (output: String, exitCode: Int32) {
		print("Compiling \(filePath)")
		return try execute(arguments: ["xcrun", "-sdk", "macosx", "swiftc", filePath, "-o", outputPath])
//		return try execute(command: "xcrun -sdk macosx swiftc \(filePath) -o \(outputPath)")
	}
	
	fileprivate func runTest(index: Int, for problem: Problem) throws -> CompilationResult.TestResult {
		var success = false
		let testCase = problem.testCases[index]
		
		print("Running \(problem.functionCall(with: testCase.arguments))")
		
		let command = testCase.arguments.map {
			($0 == "" ? "String.empty" : $0).data(using: .utf8)!.base64EncodedString()
		}.joined(separator: " ")
		
		let startTime = Date()
		
		do {
			let path = tempDirectory.appendingPathComponent("runnable_\(problem.functionName)", isDirectory: false).path
			let runResult = try execute(launchPath: path, command: command, timeout: 10)
			
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
	
	/// Compiles and runs code with specific given parameters.
	///
	/// - Parameters:
	///   - code: The code to compile and run
	///   - problem: The problem to run code for
	///   - parameters: The parameters to use when calling the function
	///   - completion: A completion handler with a `Result<String>` containing either the output of the program, a `CompilationError`, or an `Error`.
	func run(_ code: String, for problem: Problem, with parameters: [LosslessStringConvertible], completion: @escaping Result<String>.Handler) {
		print("Running custom test case")
		
		let parameters = parameters.map { String(describing: $0) }
		
		print("Running \(problem.functionCall(with: parameters))")
		
		let command = parameters.map {
			($0 == "" ? "String.empty" : $0).data(using: .utf8)!.base64EncodedString()
		}.joined(separator: " ")
		
		DispatchQueue.global(qos: .userInteractive).async {
			completion(Result {
				// Try compiling code on its own. If there are compile errors, they will be thrown
				let filePath = self.baseDirectory.appendingPathComponent(problem.functionName + ".swift").path
				let outputPath = self.tempDirectory.appendingPathComponent(problem.functionName).path
				try self.swiftc(filePath: filePath, outputPath: outputPath)
				
				// If successful, compile runnable tester
				let runnableProgramFilePath = self.tempDirectory.appendingPathComponent("runnable_" + problem.functionName + ".swift").path
				let runnableProgramOutputPath = self.tempDirectory.appendingPathComponent("runnable_" + problem.functionName).path
				let runnableProgram = problem.runnableVersionForCode(code: code)
				
				// Write runnable tester
//				try FileManager.default.removeItem(atPath: runnableProgramFile)
				try runnableProgram.write(toFile: runnableProgramFilePath, atomically: true, encoding: .utf8)
				
				try self.swiftc(filePath: runnableProgramFilePath, outputPath: runnableProgramOutputPath)
				
				// Run it
				let runResult = try self.execute(launchPath: "runnable_\(problem.functionName)", command: command, timeout: 10)
				
				return runResult.output
			})
		}
		
	}
	
	/// Be sure to save the code first before calling test!
	func test(_ code: String, for problem: Problem, completion: @escaping (CompilationResult) -> ()) {
		
		DispatchQueue.global(qos: .userInteractive).async {
			let result: CompilationResult
			
			defer {
				DispatchQueue.main.async {
					completion(result)
				}
			}
			
			do {
				// Try compiling code on its own. If there are compile errors, they will be thrown
				let filePath = self.baseDirectory.appendingPathComponent(problem.functionName + ".swift").path
				let outputPath = self.tempDirectory.appendingPathComponent(problem.functionName).path
				try self.swiftc(filePath: filePath, outputPath: outputPath)
				
				// If successful, compile runnable tester
				let runnableProgramFilePath = self.tempDirectory.appendingPathComponent("runnable_" + problem.functionName + ".swift").path
				let runnableProgramOutputPath = self.tempDirectory.appendingPathComponent("runnable_" + problem.functionName).path
				let runnableProgram = problem.runnableVersionForCode(code: code)
				
				do {
					// Write runnable tester
//					try? FileManager.default.removeItem(atPath: runnableProgramFile)
					try runnableProgram.write(toFile: runnableProgramFilePath, atomically: true, encoding: .utf8)
					
					try self.swiftc(filePath: runnableProgramFilePath, outputPath: runnableProgramOutputPath)
					
					var results: [CompilationResult.TestResult] = Array.init(repeating: CompilationResult.TestResult(run: "", success: .error, runTime: 0), count: problem.testCases.count)
					let queue = OperationQueue()
					queue.qualityOfService = .userInteractive
					
					let operations = (0 ..< problem.testCases.count).map { i in
						BlockOperation {
							do {
								results[i] = try self.runTest(index: i, for: problem)
							} catch {
								
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
			return try String(contentsOfFile: file)
		}
		catch {
			return problem.startingCode
		}
	}
	
}
