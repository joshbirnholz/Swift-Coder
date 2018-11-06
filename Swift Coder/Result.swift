//
//  Result.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 8/27/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

enum Result<T> {
	typealias Handler = (Result<T>) -> ()
	
	case success(T)
	case failure(Error)
	
	init(wrapping block: (() throws -> T)) {
		do {
			self = .success(try block())
		} catch {
			self = .failure(error)
		}
	}
	
	init(_ result: T?, _ error: Error?) {
		if let error = error {
			self = .failure(error)
		} else if let result = result {
			self = .success(result)
		} else {
			self = .failure(NSError())
		}
	}
	
	init(_ result: Any?, _ error: Error?, as type: T.Type) {
		if let error = error {
			self = .failure(error)
		} else if let result = result as? T {
			self = .success(result)
		} else {
			self = .failure(NSError())
		}
	}
	
	func unwrap() throws -> T {
		switch self {
		case .success(let result):
			return result
		case .failure(let error):
			throw error
		}
	}
}
