
//
//  Problem.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 4/16/16.
//  Copyright © 2016 Josh Birnholz. All rights reserved.
//

import Foundation

extension Int32 {
	static let success: Int32 = 200
	static let exitCode: String = "extension Int32 { static let success: Int32 = \(Int32.success) }"
}

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
	var onRunTest: String?
	var testCases: [TestCase] = []
	
	/// This String should contain code that should print a `Bool` indicating whether the test passed.
	/// Exit the program with `exit(Int32.success)` to indicate that the test passed, and use `Swift.print()` to display custom output to the user. If you do not call `Swift.print()`, the result of the user's code is displayed.
	///
	/// You can use `"__param0"`, `"__param1"`, etc., to access the arguments, and `"__expectedResult` to get the test case's expected result.
	///
	/// If this is `nil`, the default tester will call the function and the test will pass if the value returned by the function is equal to the expected result.
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
	///   - returnType: The return type of the function as a `String
	///   - parameters: An array of `Parameter`s indicating the name and type of each parameter. **Note:** If the first value in the `parameters` array has the name "self", the problem will be presented as a method in an extension on the type of that parameter.
	///   - prompt: The prompt.
	///   - solution: The solution to the problem.
	///   - hint: A hint. A hint consiting entirely of a valid URL will open the URL.
	///   - testCases: An array of `TestCase`s of an array of Strings for the parameter values to be used and the expected return value for the call, all as `String`s
	///   - customTesterOutputCode: You can use `"__param0"`, `"__param1"`, etc., to access the arguments, and `"__expectedResult` to get the test case's expected result.
	///   - numberOfTimesToTest: The number of times the code should be tested per test case. The default value is one.
	///   - onRunTest: Code to run each time the code is tested.
	///   - eulerMode: If `true`, indicates that the answer should be hidden, and only one test case shown
	init(title: String, functionName: String? = nil, returnType: StringConvertible.Type, parameters: [Parameter], prompt: String, solution: String? = nil, hint: String? = nil, testCases: [TestCase], customTesterOutputCode: String? = nil, numberOfTimesToTest: Int = 1, onRunTest: String? = nil, eulerMode: Bool = false) {
		
		self.title = title
		self.functionName = functionName ?? title
		self.prompt = prompt
		self.parameters = parameters
		self.solution = solution
		self.hint = hint
		self.eulerMode = eulerMode
		self.numberOfTimesToTest = numberOfTimesToTest
		
		self.testCases = testCases
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
	init<T: StringConvertibleTuple>(title: String, functionName: String? = nil, returnType: T.Type, tupleReturnTypeLabels: [String?], parameters: [Parameter], prompt: String, solution: String? = nil, hint: String? = nil, testCases: [TestCase], numberOfTimesToTest: Int = 1,  onRunTest: String? = nil, eulerMode: Bool = false) {
		
		self.title = title
		self.functionName = functionName ?? title
		self.prompt = prompt
		self.parameters = parameters
		self.solution = solution
		self.hint = hint
		self.eulerMode = eulerMode
		
		self.testCases = testCases
		self.onRunTest = onRunTest
		
		self.actualReturnType = returnType
		self.returnType = T.typeSignature(labels: tupleReturnTypeLabels)
		
		self.numberOfTimesToTest = numberOfTimesToTest
		
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
		} else {
			resultString = testCase.expectedResult.displayDescription
		}
		
		return functionCall(with: testCase.arguments) + " → \(resultString)"
	}
	
}

fileprivate let types: [String: StringConvertible.Type] = ["(Int, Int)": StringConvertibleTwoElementTuple<Int, Int>.self, "ClosedRange<Int>?": Optional<ClosedRange<Int>>.self, "URL": URL.self, "[Int?]": Array<Optional<Int>>.self, "Set<String>": Set<String>.self, "(Int?, Int?)": StringConvertibleTwoElementTuple<Optional<Int>, Optional<Int>>.self, "UInt": UInt.self, "[String]": Array<String>.self, "Int": Int.self, "Character": Character.self, "[String : String]": Dictionary<String, String>.self, "[Int]": Array<Int>.self, "Double?": Optional<Double>.self, "[String : Int]": Dictionary<String, Int>.self, "Bool": Bool.self, "Void": StringConvertibleVoid.self, "Int?": Optional<Int>.self, "String?": Optional<String>.self, "[String : Bool]": Dictionary<String, Bool>.self, "String": String.self, "Double": Double.self, "ClosedRange<Int>": ClosedRange<Int>.self]

fileprivate struct CodableStringConvertibleType: Codable {
	var type: StringConvertible.Type
	
	init(_ type: StringConvertible.Type) {
		self.type = type
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(type.convertibleTypeName)
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let convertibleTypeName = try container.decode(String.self)
		
		guard let type = types[convertibleTypeName] else {
			throw DecodingError.dataCorruptedError(in: container, debugDescription: "Could not create a StringConvertible type for the convertible type name \(convertibleTypeName)")
		}
		
		self.type = type
	}
}

fileprivate struct CodableStringConvertible: Codable {
	
	var value: StringConvertible
	
	enum CodingKeys: String, CodingKey {
		case type
		case stringRepresentation
	}
	
	init(_ value: StringConvertible) {
		self.value = value
	}
	
	private static let bundlePathReplacement = "$BundlePath"
	private static let problemsPathReplacement = "$ApplicationSupport"
	private static var problemsPath: String {
		return LocalCodeController.shared.applicationSupportDirectory.appendingPathComponent("Problems", isDirectory: true).path
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		if let url = value as? URL {
			let path = url.path.replacingOccurrences(of: Bundle.main.bundlePath, with: CodableStringConvertible.bundlePathReplacement)
			try container.encode(path, forKey: .stringRepresentation)
		} else {
			try container.encode(value.stringRepresentation, forKey: .stringRepresentation)
		}
		
		try container.encode(CodableStringConvertibleType(type(of: value)), forKey: .type)
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		let type = try container.decode(CodableStringConvertibleType.self, forKey: .type).type
		
		let stringRepresentation = try container.decode(String.self, forKey: .stringRepresentation)
		
		if type == URL.self {
			let path = stringRepresentation.replacingOccurrences(of: CodableStringConvertible.bundlePathReplacement, with: Bundle.main.bundlePath).replacingOccurrences(of: CodableStringConvertible.problemsPathReplacement, with: CodableStringConvertible.problemsPath)
			self.value = URL(fileURLWithPath: path)
		} else {
			guard let value = type.init(stringRepresentation) else {
				throw DecodingError.dataCorruptedError(forKey: CodingKeys.stringRepresentation, in: container, debugDescription: "Could not initialize a value of type \(type.convertibleTypeName) with string representation \"\(stringRepresentation)\"")
			}
			
			self.value = value
		}
		
	}
}

extension AnyEquatableStringConvertible: Codable {
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(CodableStringConvertible(value))
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self.value = try container.decode(CodableStringConvertible.self).value
	}
}

extension Problem.TestCase: Codable {
	private enum CodingKeys: String, CodingKey {
		case isHidden
		case expectedResult
		case arguments
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encode(isHidden, forKey: .isHidden)
		try container.encode(self.expectedResult, forKey: .expectedResult)
		try container.encode(arguments.map(CodableStringConvertible.init), forKey: .arguments)
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.isHidden = try container.decodeIfPresent(Bool.self, forKey: .isHidden) ?? false
		self.expectedResult = try container.decode(AnyEquatableStringConvertible.self, forKey: .expectedResult)
		self.arguments = try container.decode([CodableStringConvertible].self, forKey: .arguments).map { $0.value }
	}
}

extension Problem.Parameter: Codable {
	enum CodingKeys: String, CodingKey {
		case name
		case label
		case type
		case isInout
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encode(name, forKey: .name)
		
		if label != name {
			try container.encode(label, forKey: .label)
		}
		
		try container.encode(CodableStringConvertibleType(actualType), forKey: .type)
		try container.encode(isInout, forKey: .isInout)
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		let name = try container.decode(String.self, forKey: .name)
		self.name = name
		self.label = try container.decodeIfPresent(String.self, forKey: .label) ?? name
		self.actualType = try container.decode(CodableStringConvertibleType.self, forKey: .type).type
		self.isInout = try container.decodeIfPresent(Bool.self, forKey: .isInout) ?? false
	}
}

extension Problem: Codable {
	enum CodingKeys: String, CodingKey {
		case title//: String
		case functionName//: String
		case returnType//: StringConvertible.Type
		case parameters// = [Parameter]()
		case prompt//: String
		case solution//: String?
		case hint//: String?
		case onRunTest//: String?
		case testCases//: [TestCase] = []
		case customTesterOutputCode//: String?
		case numberOfTimesToTest//: Int
		case eulerMode//: Bool
		case displayedReturnType//: String
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		
		try container.encode(title, forKey: .title)
		
		if functionName != title {
			try container.encode(functionName, forKey: .functionName)
		}
		
		try container.encode(CodableStringConvertibleType(actualReturnType), forKey: .returnType)
		try container.encode(parameters, forKey: .parameters)
		try container.encode(prompt, forKey: .prompt)
		
		if let hint = hint {
			try container.encode(hint, forKey: .hint)
		}
		
		if let onRunTest = onRunTest {
			try container.encode(onRunTest, forKey: .onRunTest)
		}
		
		try container.encode(testCases, forKey: .testCases)
		
		if let customTesterOutputCode = customTesterOutputCode {
			try container.encode(customTesterOutputCode, forKey: .customTesterOutputCode)
		}
		
		if let solution = solution {
			try container.encode(solution, forKey: .solution)
		}
		
		try container.encode(numberOfTimesToTest, forKey: .numberOfTimesToTest)
		try container.encode(eulerMode, forKey: .eulerMode)
		try container.encode(returnType, forKey: .displayedReturnType)
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		let title = try container.decode(String.self, forKey: .title)
		let returnType = try container.decode(CodableStringConvertibleType.self, forKey: .returnType).type
		self.title = title
		self.functionName = try container.decodeIfPresent(String.self, forKey: .functionName) ?? title
		self.actualReturnType = returnType
		self.parameters = try container.decode([Problem.Parameter].self, forKey: .parameters)
		self.prompt = try container.decode(String.self, forKey: .prompt)
		self.hint = try container.decodeIfPresent(String.self, forKey: .hint)
		self.onRunTest = try container.decodeIfPresent(String.self, forKey: .onRunTest)
		self.testCases = try container.decode([Problem.TestCase].self, forKey: .testCases)
		self.customTesterOutputCode = try container.decodeIfPresent(String.self, forKey: .customTesterOutputCode)
		self.numberOfTimesToTest = try container.decodeIfPresent(Int.self, forKey: .numberOfTimesToTest) ?? 1
		self.eulerMode = try container.decodeIfPresent(Bool.self, forKey: .eulerMode) ?? false
		self.returnType = try container.decodeIfPresent(String.self, forKey: .displayedReturnType) ?? returnType.convertibleTypeName
		
		self.onRunTest = nil
	}
}

extension Problem.TestCase: Equatable {
	static func == (lhs: Problem.TestCase, rhs: Problem.TestCase) -> Bool {
		return lhs.isHidden == rhs.isHidden
			&& lhs.arguments.map(AnyEquatableStringConvertible.init) == rhs.arguments.map(AnyEquatableStringConvertible.init)
			&& lhs.expectedResult == rhs.expectedResult
	}
}

fileprivate struct AnyEquatablePartialKeyPath<Root> {
	let keyPath: PartialKeyPath<Root>
	private let equals: (Root, Root) -> Bool
	
	init<Value: Equatable>(_ keyPath: KeyPath<Root, Value>) {
		self.keyPath = keyPath
		self.equals = { lhs, rhs -> Bool in
			return lhs[keyPath: keyPath] == rhs[keyPath: keyPath]
		}
	}
	
	func valuesAreEqual(_ lhs: Root, _ rhs: Root) -> Bool {
		return equals(lhs, rhs)
	}
	
}

extension Problem: Equatable {
	fileprivate static let importantKeyPaths: [AnyEquatablePartialKeyPath<Problem>] =
		[AnyEquatablePartialKeyPath(\Problem.title),
		 AnyEquatablePartialKeyPath(\Problem.functionName),
		 AnyEquatablePartialKeyPath(\Problem.parameters),
		 AnyEquatablePartialKeyPath(\Problem.prompt),
		 AnyEquatablePartialKeyPath(\Problem.hint),
		 AnyEquatablePartialKeyPath(\Problem.onRunTest),
		 AnyEquatablePartialKeyPath(\Problem.testCases),
		 AnyEquatablePartialKeyPath(\Problem.customTesterOutputCode),
		 AnyEquatablePartialKeyPath(\Problem.numberOfTimesToTest),
		 AnyEquatablePartialKeyPath(\Problem.eulerMode),
		 AnyEquatablePartialKeyPath(\Problem.returnType)
	]
	
	static func == (lhs: Problem, rhs: Problem) -> Bool {
		return importantKeyPaths.allSatisfy { $0.valuesAreEqual(lhs, rhs) }
	}
}
