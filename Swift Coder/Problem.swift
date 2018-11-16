
//
//  Problem.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 4/16/16.
//  Copyright © 2016 Josh Birnholz. All rights reserved.
//

import Foundation
struct Problem {
	
	struct TestCase {
		
		var arguments: [String] {
			return actualArguments.map { $0.stringRepresentation }
		}
		var expectation: String {
			return String(describing: actualExpectation)
		}
		var actualArguments: [StringConvertible]
		var actualExpectation: AnyEquatableStringConvertible
		
		init(arguments: [StringConvertible], expectation: StringConvertible) {
			self.actualArguments = arguments

			self.actualExpectation = AnyEquatableStringConvertible(expectation)
		}

		init(_ arguments: [StringConvertible], _ expectation: StringConvertible) {
			self.init(arguments: arguments, expectation: expectation)
		}

		init(expectation: StringConvertible, arguments: StringConvertible...) {
			self.init(arguments: arguments, expectation: expectation)
		}

		init(expectation: StringConvertible) {
			self.init(arguments: [], expectation: expectation)
		}
	}
	
	struct Parameter {
		static func == (lhs: Problem.Parameter, rhs: Problem.Parameter) -> Bool {
			return lhs.name == rhs.name && lhs.type == rhs.type
		}
		
		var name: String
		var type: String {
			return stringDescription(of: actualType)
		}
		var actualType: StringConvertible.Type
		
		init(name: String, type: StringConvertible.Type) {
			self.name = name
			self.actualType = type
		}
	}
	
	var title: String
	var functionName: String
	var actualReturnType: StringConvertible.Type
	var parameters = [Parameter]()
	var prompt: String
	var solution: String?
	var hint: String?
	var testCases: [TestCase] = []
	
	/// If this is `true`, the expectation is hidden, and no test cases are shown.
	var eulerMode: Bool
	
	var returnType: String {
		return stringDescription(of: actualReturnType)
	}
	
	/**
	Returns a new `Problem`.
	- parameter title: The title of the problem
	- parameter functionName: The name of the function
	- parameter returnType: The return type of the function as a `String`
	- parameter parameters: An array of tuples of the name and type of each parameter, both as `String`s
	- parameter testCases: An array of tuples of an array of Strings for the parameter values to be used and the expected return value for the call, all as `String`s
	*/
	init(title: String, functionName: String = "", returnType: StringConvertible.Type, parameters: [Parameter], prompt: String, solution: String? = nil, hint: String? = nil, testCases: [TestCase], eulerMode: Bool = false) {

		self.title = title
		self.functionName = functionName == "" ? title : functionName
		self.prompt = prompt
		self.parameters = parameters
		self.solution = solution
		self.hint = hint
		self.eulerMode = eulerMode

		self.testCases = testCases
		
		self.actualReturnType = returnType

	}
	
	var startingCode: String {
		
		var code = "func \(self.functionName)("
		
		code += parameters.map { "\($0.name): \($0.type)" }.joined(separator: ", ")
		
		code += ") -> \(self.returnType) {\n\t\n}"
		
		return code
		
	}
	
	func functionCall(with testParameters: [StringConvertible]) -> String {
		var functionCall = "\(functionName)("
		
		for (index, parameter) in testParameters.enumerated() {
			functionCall += parameters[index].name + ": "
			
			if parameters[index].type == "String" {
				functionCall += "\""
			}
			
			functionCall += String(describing: parameter)
			
			if parameters[index].type == "String" {
				functionCall += "\""
			}
			
			if index < parameters.count - 1 {
				functionCall += ", "
			}
		}
		
		return functionCall + ")"
	}
	
	public func expectationString(testCase: Problem.TestCase) -> String {
		return functionCall(with: testCase.actualArguments) + " → \(eulerMode ? "?" : returnTypeNeedsSurroundingQuotesForDisplay(actualReturnType) ? "\"\(testCase.expectation)\"" : testCase.expectation)"
	}
	
}

func returnTypeNeedsSurroundingQuotesForDisplay(_ type: StringConvertible.Type) -> Bool {
	return type == String.self || type == Substring.self || type == Character.self
}

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
