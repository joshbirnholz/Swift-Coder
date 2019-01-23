//
//  OptionalsProblems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/26/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let optionalsProblems: [Problem] = [
	Problem(title: "optionalChecking",
			returnType: Int.self,
			parameters: [
				Problem.Parameter(name: "n", type: Int?.self)
		],
			prompt: "Given an optional integer, return the optional's value if it has one, or 0 if it doesn't.",
			solution: """
// There are multiple ways to unwrap an optional. Here are a few ways to solve this problem:

func optionalChecking(n: Int?) -> Int {
	// Here, we check to see if n is not equal to nil.
	// If it isn't, then we can force-unwrap it to get its value.
	if n != nil {
		return n!
	} else {
		return 0
	}
}

func optionalChecking(n: Int?) -> Int {
	// Here, we use optional binding to unwrap n. If it has
	// a value, we can use it inside of the if statement.
	if let n = n {
		return n
	} else {
		return 0
	}
}

func optionalChecking(n: Int?) -> Int {
	// Here, we use a guard statement to ensure that n has a value
	// before proceeding with the rest of the code.
	// The else block of a guard statement must exit the scope,
	// using a keyword like return, break, continue, or throw.
	guard let n = n else {
		return 0
	}
	return n
}

func optionalChecking(n: Int?) -> Int {
	// Here, we use the nil-coalescing operator (??).
	// If the optional on the left has a value, it is used.
	// Otherwise, the value on the right is used.
	return n ?? 0
}
""",
			hint: nil,
			testCases: [
				Problem.TestCase(expectation: 70, arguments: Int?.some(70)),
				Problem.TestCase(expectation: 0, arguments: Int?.none),
				Problem.TestCase(expectation: 9, arguments: Int?.some(9)),
				Problem.TestCase(expectation: 15, arguments: Int?.some(15)),
				Problem.TestCase(expectation: 0, arguments: Int?.some(0)),
				Problem.TestCase(expectation: 40, arguments: Int?.some(40)),
				
		]),
	Problem(title: "stringToInt",
			returnType: Int?.self,
			parameters: [
				Problem.Parameter(name: "str", type: String.self)
		],
			prompt: "Given a String, return that string as an Int if the String is a number, and otherwise return nil.",
			solution: """
				func stringToInt(str: String) -> Int? {
					return Int(str)
				}
				""",
			hint: nil,
			testCases: [
				Problem.TestCase(expectation: 123, arguments: "123"),
				Problem.TestCase(expectation: Int?.none, arguments: "hello"),
				Problem.TestCase(expectation: 19, arguments: "19"),
				Problem.TestCase(expectation: 99999, arguments: "99999"),
				Problem.TestCase(expectation: Int?.none, arguments: "twelve")
		]),
	Problem(title: "optionalGreater",
			returnType: Int?.self,
			parameters: [
				Problem.Parameter(name: "a", type: Int?.self),
				Problem.Parameter(name: "b", type: Int?.self)
		],
			prompt: "Given two optional integers, a and b, return whichever one is greater. If they are both nil, return nil.",
			solution: nil,
			hint: nil,
			testCases: [
				Problem.TestCase(expectation: 19, arguments: Int?.some(19), Int?.some(10)),
				Problem.TestCase(expectation: 5, arguments: Int?.none, Int?.some(5)),
				Problem.TestCase(expectation: Int?.none, arguments: Int?.none, Int?.none)
		]),
	Problem(title: "fullName",
			returnType: String.self,
			parameters: [
				Problem.Parameter(name: "first", type: String.self),
				Problem.Parameter(name: "middle", type: String?.self),
				Problem.Parameter(name: "last", type: String.self)
		],
			prompt: "Given a person's first name, last name, and middle initial, return a String of that person's full name, like \"Lee M. Anderson\". However, some people didn't give their middle initial, so for them leave it off.",
			solution: nil,
			hint: nil,
			testCases: [
				Problem.TestCase(expectation: "Keith A. Hayes", arguments: String?.some("Keith"), String?.some("A"), String?.some("Hayes")),
				Problem.TestCase(expectation: "Greg Kellner", arguments: String?.some("Greg"), String?.none, String?.some("Kellner")),
				Problem.TestCase(expectation: "Kristi E. Taylor", arguments: String?.some("Kristi"), String?.some("E"), String?.some("Taylor")),
				Problem.TestCase(expectation: "Tiffany Heaton", arguments: String?.some("Tiffany"), String?.none, String?.some("Heaton")),
				Problem.TestCase(expectation: "Cloud Strife", arguments: String?.some("Cloud"), String?.none, String?.some("Strife")),
				Problem.TestCase(expectation: "Trevor C. Belmont", arguments: String?.some("Trevor"), String?.some("C"), String?.some("Belmont"))
		]),
	Problem(title: "optionalSum",
			returnType: Int.self,
			parameters: [
				Problem.Parameter(name: "nums", type: [Int?].self)
		],
			prompt: "Given an array of optional integers, return the sum of all of the elements that actually have values.",
			solution: nil,
			hint: nil,
			testCases: [
				Problem.TestCase(isHidden: false, expectation: 106, arguments: [Int?.some(17), Int?.some(19), Int?.some(70)]),
				Problem.TestCase(isHidden: false, expectation: 306, arguments: [Int?.some(37), Int?.some(7), Int?.some(8), Int?.some(86), Int?.some(78), Int?.some(90)]),
				Problem.TestCase(isHidden: false, expectation: 164, arguments: [Int?.none, Int?.some(64), Int?.some(83), Int?.none, Int?.none, Int?.some(13), Int?.some(4)]),
				Problem.TestCase(isHidden: false, expectation: 71, arguments: [Int?.some(39), Int?.some(20), Int?.some(12)]),
				Problem.TestCase(isHidden: false, expectation: 0, arguments: [Int?]()),
				Problem.TestCase(isHidden: false, expectation: 160, arguments: [Int?.none, Int?.some(4), Int?.none, Int?.none, Int?.some(32), Int?.none, Int?.some(92), Int?.some(32), Int?.none]),
				Problem.TestCase(isHidden: false, expectation: 25, arguments: [Int?.some(19), Int?.some(6)]),
				Problem.TestCase(isHidden: false, expectation: 348, arguments: [Int?.some(40), Int?.some(93), Int?.some(36), Int?.some(91), Int?.none, Int?.some(16), Int?.none, Int?.some(72), Int?.none]),
				Problem.TestCase(isHidden: true, expectation: 69, arguments: [Int?.some(69)]),
				Problem.TestCase(isHidden: true, expectation: 42, arguments: [Int?.none, Int?.none, Int?.some(11), Int?.some(31)]),
				Problem.TestCase(isHidden: true, expectation: 88, arguments: [Int?.some(88)]),
				Problem.TestCase(isHidden: true, expectation: 7, arguments: [Int?.some(7)]),
				Problem.TestCase(isHidden: true, expectation: 86, arguments: [Int?.some(72), Int?.some(14)]),
				Problem.TestCase(isHidden: true, expectation: 2, arguments: [Int?.none, Int?.some(2)]),
				Problem.TestCase(isHidden: true, expectation: 31, arguments: [Int?.none, Int?.some(31), Int?.none]),
		])
]
