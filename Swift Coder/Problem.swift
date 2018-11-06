
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

struct Problem: Codable {
	
	struct TestCase: Codable {
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
	
	struct Parameter: Codable {
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
	
	private static let boolInitFuncString = """
	func Bool(_ value: String) -> Bool? {
		switch value.lowercased() {
			case "true": return true
			case "false": return false
			default: return nil
		}
	}
	"""
	
	private static let printReplacement = """
	func print(_ items: Any..., separator: String = "", terminator: String = "") {
	
	}
	"""
	
	func runnableVersionForCode(code: String) -> String {
		var runnableCode = "import Foundation" + "\n\n"
		
		runnableCode += Problem.printReplacement + "\n\n"
		
		let containsBoolParameters = parameters.contains(where: { $0.type == "Bool" })
		
		if containsBoolParameters {
			runnableCode += Problem.boolInitFuncString + "\n\n"
		}
		
		if parameters.contains(where: { $0.type == "String" }) {
			runnableCode += """
			extension String {
				static var empty: String {
					return ""
				}
			}
			
			
			"""
		}
		
		if parameters.contains(where: { ($0.type.first == "[" && $0.type.last == "]") || $0.type.last == ">" }) {
			runnableCode += """
			typealias RegexMatch = (range: Range<String.Index>, value: String)
			
			extension String {
				
				func matches(forRegex regex: String) -> [(fullMatch: RegexMatch, groups: [RegexMatch])] {
					do {
						let regex = try NSRegularExpression(pattern: regex)
						let results = regex.matches(in: self, range: NSRange(startIndex..., in: self))
						return results.map { result in
							let fullMatchRange = Range(result.range, in: self)!
							let groups: [RegexMatch]
							
							if result.numberOfRanges > 1 {
								groups = (1 ..< result.numberOfRanges).compactMap { i in
									guard let range = Range(result.range(at: i), in: self) else {
										return nil
									}
									let value = String(self[range])
									return (range: range, value: value)
								}
							} else {
								groups = []
							}
							
							let fullMatch = (range: fullMatchRange, value: String(self[fullMatchRange]))
							
							return (fullMatch, groups)
						}
					} catch {
						return []
					}
				}
				
			}
			
			extension Array: LosslessStringConvertible where Element: LosslessStringConvertible {
				public init?(_ description: String) {
					if let arr = description.matches(forRegex: "\\\\[(.*)]").first?.groups.first?.value.split(separator: ",").compactMap({
						Element($0.trimmingCharacters(in: .whitespacesAndNewlines))}) {
						if Element.self == String.self {
							self = (arr as! [String]).map {
								String($0[$0.index(after: $0.startIndex)..<$0.index(before: $0.endIndex)])
								} as! [Element]
						} else {
							self = arr
						}
					} else {
						return nil
					}
				}
			}
			
			
			"""
		}
		
		runnableCode += code + "\n\n"
		
		for (index, parameter) in parameters.enumerated() {
			
			switch parameter.type {
			case "String":
				// Don't need to convert type, so no need for optional checking with a string.
				runnableCode += """
				let __param\(index)String = String(data: Data(base64Encoded: CommandLine.arguments[\(index + 1)])!, encoding: .utf8)!
				let __param\(index): String = __param\(index)String == "String.empty" ? "" : __param\(index)String
				
				
				"""
			default:
				runnableCode += """
				guard let __param\(index): \(parameter.type) = \(parameter.type)(String(data: Data(base64Encoded: CommandLine.arguments[\(index + 1)])!, encoding: .utf8)!) else {
					Swift.print("Incorrect argument type")
					exit(-1)
				}
				

				"""

			}
		}
		
		runnableCode += """
		let __result: \(returnType) = \(functionName)(\(parameters.enumerated().map { index, parameter in "\(parameter.name): __param\(index)" }.joined(separator: ", ")))
		
		Swift.print(__result)
		"""
		
		return runnableCode
	}
	
	public func expectationString(testCaseIndex i: Int) -> String {
		let testCase = testCases[i]
		return functionCall(with: testCase.arguments) + " → \(eulerMode ? "?" : testCase.expectation)"
	}
	
}
