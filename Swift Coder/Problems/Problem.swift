
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
		
		var isHidden: Bool
		var expectedResult: AnyEquatableStringConvertible
		var arguments: [StringConvertible]
		
		init(isHidden: Bool = false, expectation: StringConvertible, arguments: StringConvertible...) {
			self.isHidden = isHidden
			self.expectedResult = AnyEquatableStringConvertible(expectation)
			self.arguments = arguments
		}
	}
	
	struct Parameter: Equatable {
		static func == (lhs: Problem.Parameter, rhs: Problem.Parameter) -> Bool {
			return lhs.name == rhs.name && lhs.actualType == rhs.actualType && lhs.label == rhs.label && lhs.isInout == rhs.isInout
		}
		
		var name: String
		var label: String
		var actualType: StringConvertible.Type
		var isInout: Bool
		
		init(name: String, type: StringConvertible.Type, isInout: Bool = false) {
			self.name = name
			self.actualType = type
			self.label = name
			self.isInout = isInout
		}
		
		init(label: String?, name: String, type: StringConvertible.Type, isInout: Bool = false) {
			self.name = name
			self.actualType = type
			self.label = label ?? "_"
			self.isInout = isInout
		}
	}
	
	var title: String
	var functionName: String
	var actualReturnType: StringConvertible.Type
	var parameters = [Parameter]()
	var prompt: String
	var solution: String?
	var hint: String?
	var usesPrintedOutput: Bool
	var onRunTest: (() -> ())?
	var testCases: [TestCase] = []
	
	/// A closure that takes:
	///
	/// - `Problem.TestCase` - the test case being tested
	/// - `String` - the direct run output of the user's code with the given arguments
	typealias TestResultHandler = ((Problem.TestCase, String) -> Bool)
	
	/// A closure that takes the test case and the result of running the user's code with the test case, and which returns whether the result passes or fails a test with those arguments.
	///
	/// If this is not `nil`, this closure will be used to determine whether the test case passes or fails.
	var customTestResultHandler: TestResultHandler?
	
	/// This String should contain code that provides a custom output, to be handled by the `customTestResultHandler`.
	/// Call `Swift.print()` in this code to provide output.
	///
	/// If this is `nil`, the default tester will call the function with the parameters and print a String representation of the output.
	var customTesterOutputCode: String?
	
	var numberOfTimesToTest: Int
	
	/// If this is `true`, the expectation is hidden, and no test cases are shown.
	var eulerMode: Bool
	
	let returnType: String
	
	var extensionType: StringConvertible.Type? {
		if let index = parameters.firstIndex(where: { $0.name == "self" }), index == 0 {
			return parameters[index].actualType
		} else {
			return nil
		}
	}
	
	/// Initializes a new `Problem`.
	///
	/// - Parameters:
	///   - title: The title of the problem
	///   - functionName: The name of the function. By default, this is the same as `title`.
	///   - returnType: The return type of the function as a `String`
	///   - parameters: An array of `Parameter`s indicating the name and type of each parameter. **Note:** If the first value in the `parameters` array has the name "self", the problem will be presented as a method in an extension on the type of that parameter.
	///   - prompt: The prompt.
	///   - solution: The solution to the problem.
	///   - hint: A hint. A hint consiting entirely of a valid URL will open the URL.
	///   - testCases: An array of `TestCase`s of an array of Strings for the parameter values to be used and the expected return value for the call, all as `String`s
	///   - eulerMode: If `true`, indicates that the answer should be hidden, and only one test case shown
	init(title: String, functionName: String = "", returnType: StringConvertible.Type, parameters: [Parameter], prompt: String, solution: String? = nil, hint: String? = nil, testCases: [TestCase], customTesterOutputCode: String? = nil, customTestResultHandler: TestResultHandler? = nil, numberOfTimesToTest: Int = 1, usesPrintedOutput: Bool = false, onRunTest: (() -> ())? = nil, eulerMode: Bool = false) {

		self.title = title
		self.functionName = functionName == "" ? title : functionName
		self.prompt = prompt
		self.parameters = parameters
		self.solution = solution
		self.hint = hint
		self.eulerMode = eulerMode
		self.customTestResultHandler = customTestResultHandler
		self.numberOfTimesToTest = numberOfTimesToTest

		self.testCases = testCases
		self.usesPrintedOutput = usesPrintedOutput
		self.onRunTest = onRunTest
		
		self.actualReturnType = returnType
		self.returnType = returnType.convertibleTypeName
		self.customTesterOutputCode = customTesterOutputCode

	}
	
	/// Initializes a new `Problem` with a Tuple return type.
	///
	/// - Parameters:
	///   - title: The title of the problem
	///   - functionName: The name of the function. By default, this is the same as `title`.
	///   - returnType: The return type of the function as a `String`
	///   - tupleReturnTypeLabels: An array of Strings to be used for the default labels for a tuple return type
	///   - parameters: An array of `Parameter`s indicating the name and type of each parameter. **Note:** If the first value in the `parameters` array has the name "self", the problem will be presented as a method in an extension on the type of that parameter.
	///   - prompt: The prompt.
	///   - solution: The solution to the problem.
	///   - hint: A hint. A hint consiting entirely of a valid URL will open the URL.
	///   - testCases: An array of `TestCase`s of an array of Strings for the parameter values to be used and the expected return value for the call, all as `String`s
	///   - eulerMode: If `true`, indicates that the answer should be hidden, and only one test case shown
	init<T: StringConvertibleTuple>(title: String, functionName: String = "", returnType: T.Type, tupleReturnTypeLabels: [String?], parameters: [Parameter], prompt: String, solution: String? = nil, hint: String? = nil, testCases: [TestCase], customTestResultHandler: TestResultHandler? = nil, numberOfTimesToTest: Int = 1, usesPrintedOutput: Bool = false,  onRunTest: (() -> ())? = nil, eulerMode: Bool = false) {
		
		self.title = title
		self.functionName = functionName == "" ? title : functionName
		self.prompt = prompt
		self.parameters = parameters
		self.solution = solution
		self.hint = hint
		self.eulerMode = eulerMode
		
		self.testCases = testCases
		self.usesPrintedOutput = usesPrintedOutput
		self.onRunTest = onRunTest
		
		self.actualReturnType = returnType
		self.returnType = T.typeSignature(labels: tupleReturnTypeLabels)
		
		self.numberOfTimesToTest = numberOfTimesToTest
		self.customTestResultHandler = customTestResultHandler
		
	}
	
	var startingCode: String {
		
		let parameters = extensionType == nil ? self.parameters : Array(self.parameters.dropFirst())
		
		var function = "func \(self.functionName)("
		
		function += parameters.map { "\($0.label)\($0.label == $0.name ? "" : " \($0.name)"): \($0.isInout ? "inout " : "")\($0.actualType.convertibleTypeName)" }.joined(separator: ", ")
		
		if self.actualReturnType.convertibleTypeName == StringConvertibleVoid.convertibleTypeName {
			function += ")"
		} else {
			function += ") -> \(self.returnType)"			
		}
		
		function += " {\n\t\n}"
		
		if let extensionType = extensionType {
			return "extension \(extensionType.convertibleExtensionTypeName) {\n\(function.split(separator: "\n").map { "\t" + $0 }.joined(separator: "\n"))\n}"
		} else {
			return function
		}
		
	}
	
	func functionCall(with testParameters: [StringConvertible]) -> String {
		
		var functionCall = ""
		
		if extensionType != nil {
			functionCall += testParameters[0].displayDescription
			functionCall += "."
		}
		
		functionCall += "\(functionName)("
		
		let testParameters = extensionType == nil ? testParameters : Array(testParameters.dropFirst())
		
		for (index, parameter) in testParameters.enumerated()  {
			let index = extensionType == nil ? index : index + 1
			
			if parameters[index].label != "_" {
				functionCall += parameters[index].label + ": "
			}
			
			functionCall += parameter.displayDescription
			
			if index < parameters.count - 1 {
				functionCall += ", "
			}
		}
		
		return functionCall + ")"
	}
	
	public func expectationString(testCase: Problem.TestCase) -> String {
		let resultString: String
		
		if eulerMode {
			resultString = "?"
		} else if customTestResultHandler != nil {
			resultString = String(describing: testCase.expectedResult)
		} else {
			resultString = testCase.expectedResult.displayDescription
		}
		
		return functionCall(with: testCase.arguments) + " → \(resultString)"
	}
	
}
