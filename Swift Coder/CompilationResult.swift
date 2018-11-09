//
//  CompilationResult.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/9/18.
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
