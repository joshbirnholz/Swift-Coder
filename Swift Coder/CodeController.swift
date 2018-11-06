//
//  CodeController.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 8/14/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

enum CompilationError: Error {
	
	case error(String)
	case timeout
	
	var localizedDescription: String {
		switch self {
		case .error(let errorOutput):
			return errorOutput
		case .timeout:
			return "error: timeout"
		}
	}
	
}

struct TimeoutError: Error {
	init() { }
}

protocol CodeController {
	func test(_ code: String, for problem: Problem, completion: @escaping (CompilationResult) -> ())
	func saveCode(_ code: String, for problem: Problem) throws
	func loadCode(for problem: Problem) -> String
	func run(_ code: String, for problem: Problem, with parameters: [LosslessStringConvertible], completion: @escaping Result<String>.Handler)
}

enum CompilationResult {

	struct TestResult {
		enum Successful: String {
			case ok = "OK"
			case failure = "X"
			case error = "⚠️"
		}
		
		var run: String
		var success: Successful
		var runTime: TimeInterval
	}
	
	case success([TestResult])
	case failure(CompilationError)
	case internalError(Error)
}
