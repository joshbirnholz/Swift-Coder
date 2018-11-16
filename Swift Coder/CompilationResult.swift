//
//  CompilationResult.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/9/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

enum CompilationError: Error {
	
	enum ErrorContents {
		case compilerMessages([CompilerMessage])
		case text(String)
	}
	
	case error(ErrorContents)
	case timeout
	
	var localizedDescription: String {
		switch self {
		case .error(let contents):
			switch contents {
			case .compilerMessages(let messages):
				return messages.map { $0.description }.joined(separator: "\n")
			case .text(let string):
				return string
			}
		case .timeout:
			return "error: timeout"
		}
	}
	
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
