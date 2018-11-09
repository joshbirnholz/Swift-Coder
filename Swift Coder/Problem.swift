
//
//  Problem.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 4/16/16.
//  Copyright © 2016 Josh Birnholz. All rights reserved.
//

import Foundation

fileprivate func stringDescription(of type: Any.Type) -> String {
	var paramType = String(describing: type)
	
	while let (_, groups) = paramType.matches(forRegex: "(Array<).*(>)").first {
		paramType.replaceSubrange(groups[1].range, with: "]")
		paramType.replaceSubrange(groups[0].range, with: "[")
	}
	
	while let (_, groups) = paramType.matches(forRegex: "(Dictionary<).*(, ).*(>)").first {
		paramType.replaceSubrange(groups[2].range, with: "]")
		paramType.replaceSubrange(groups[1].range, with: " : ")
		paramType.replaceSubrange(groups[0].range, with: "[")
	}
	
	return paramType
}

struct Problem: Equatable, Codable {
	
	struct TestCase: Equatable, Codable {
		var arguments: [String]
		var expectation: String
		
		init(arguments: [LosslessStringConvertible], expectation: LosslessStringConvertible) {
			self.arguments = arguments.map { String(describing: $0) }
			
			self.expectation = String(describing: expectation)
		}
		
		init(_ arguments: [LosslessStringConvertible], _ expectation: LosslessStringConvertible) {
			self.init(arguments: arguments, expectation: expectation)
		}
		
		init(expectation: LosslessStringConvertible, arguments: LosslessStringConvertible...) {
			self.init(arguments: arguments, expectation: expectation)
		}
		
		init(expectation: LosslessStringConvertible) {
			self.init(arguments: [], expectation: expectation)
		}
	}
	
	struct Parameter: Equatable, Codable {
		var name: String
		var type: String
		
		init(name: String, type: LosslessStringConvertible.Type) {
			self.name = name
			self.type = stringDescription(of: type)
		}
	}
	
	var title: String
	var functionName: String
	var returnType: String
	var parameters = [Parameter]()
	var prompt: String
	var solution: String?
	var hint: String?
	var testCases: [TestCase] = []
	
	/// If this is `true`, the expectation is hidden, and no test cases are shown.
	var eulerMode: Bool
	
	/**
	Returns a new `Problem`.
	- parameter title: The title of the problem
	- parameter functionName: The name of the function
	- parameter returnType: The return type of the function as a `String`
	- parameter parameters: An array of tuples of the name and type of each parameter, both as `String`s
	- parameter testCases: An array of tuples of an array of Strings for the parameter values to be used and the expected return value for the call, all as `String`s
	*/
	init(title: String, functionName: String = "", returnType: LosslessStringConvertible.Type, parameters: [Parameter], prompt: String, solution: String? = nil, hint: String? = nil, testCases: [TestCase], eulerMode: Bool = false) {
		
		self.title = title
		self.functionName = functionName == "" ? title : functionName
		self.prompt = prompt
		self.parameters = parameters
		self.solution = solution
		self.hint = hint
		self.eulerMode = eulerMode
		
		if returnType == String.self {
			for testCase in testCases {
				self.testCases.append(TestCase(testCase.arguments, "\"" + testCase.expectation + "\""))
			}
		} else {
			self.testCases = testCases
		}
		
		self.returnType = stringDescription(of: returnType)
		
	}
	
	var startingCode: String {
		
		var code = "func \(self.functionName)("
		
		code += parameters.map { "\($0.name): \($0.type)" }.joined(separator: ", ")
		
		code += ") -> \(self.returnType) {\n\t\n}"
		
		return code
		
	}
	
	func functionCall(with testParameters: [String]) -> String {
		var functionCall = "\(functionName)("
		
		for (index, parameter) in testParameters.enumerated() {
			functionCall += parameters[index].name + ": "
			
			if parameters[index].type == "String" {
				functionCall += "\""
			}
			
			functionCall += parameter
			
			if parameters[index].type == "String" {
				functionCall += "\""
			}
			
			if index < parameters.count - 1 {
				functionCall += ", "
			}
		}
		
		return functionCall + ")"
	}
	
	public func expectationString(testCaseIndex i: Int) -> String {
		let testCase = testCases[i]
		return functionCall(with: testCase.arguments) + " → \(eulerMode ? "?" : testCase.expectation)"
	}
	
}
