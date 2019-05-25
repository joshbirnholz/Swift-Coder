//
//  CodingBatWarmup2Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatWarmup2Problems: [Problem] = [
	Problem(
		title: "stringTimes",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a string and a non-negative int n, return a larger string that is `n` copies of the original string.",
		solution: """
		func stringTimes(str: String, n: Int) -> String {
			var result = ""
			
			for _ in 0 ..< n {
				result = result + str // could use += here
			}
			
			return result
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "HiHi", arguments: "Hi", 2),
			Problem.TestCase(expectation: "HiHiHi", arguments: "Hi", 3),
			Problem.TestCase(expectation: "Hi", arguments: "Hi", 1),
			Problem.TestCase(expectation: "", arguments: "Hi", 0),
			Problem.TestCase(expectation: "HiHiHiHiHi", arguments: "Hi", 5),
			Problem.TestCase(expectation: "Oh Boy!Oh Boy!", arguments: "Oh Boy!", 2),
			Problem.TestCase(expectation: "xxxx", arguments: "x", 4),
			Problem.TestCase(expectation: "", arguments: "", 4),
			Problem.TestCase(expectation: "codecode", arguments: "code", 2),
			Problem.TestCase(expectation: "codecodecode", arguments: "code", 3)
		],
		eulerMode: false
	),
	Problem(
		title: "frontTimes",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a string and a non-negative int `n`, we'll say that the front of the string is the first 3 characters, or whatever is there if the string is less than length 3. Return `n` copies of the front;",
		solution: """
		func frontTimes(str: String, n: Int) -> String {
			let front = String(str.prefix(3))
			
			var result = ""
			
			for _ in 0 ..< n {
				result = result + front
			}
			return result
		}
""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ChoCho", arguments: "Chocolate", 2),
			Problem.TestCase(expectation: "ChoChoCho", arguments: "Chocolate", 3),
			Problem.TestCase(expectation: "AbcAbcAbc", arguments: "Abc", 3),
			Problem.TestCase(expectation: "AbAbAbAb", arguments: "Ab", 4),
			Problem.TestCase(expectation: "AAAA", arguments: "A", 4),
			Problem.TestCase(expectation: "", arguments: "", 4),
			Problem.TestCase(expectation: "", arguments: "Abc", 0)
		],
		eulerMode: false
	),
	Problem(
		title: "arrayCount9",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return the number of 9's in the array.",
		solution: """
		func arrayCount9(nums: [Int]) -> Int {
			return nums.filter { $0 == 9 }.count
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: [1, 2, 9]),
			Problem.TestCase(expectation: 2, arguments: [1, 9, 9]),
			Problem.TestCase(expectation: 3, arguments: [1, 9, 9, 3, 9]),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: 0, arguments: [Int]()),
			Problem.TestCase(expectation: 0, arguments: [4, 2, 4, 3, 1]),
			Problem.TestCase(expectation: 1, arguments: [9, 2, 4, 3, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "arrayFront9",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if one of the first 4 elements in the array is a 9. The array length may be less than 4.",
		solution: """
		func arrayFront9(nums: [Int]) -> Bool {
			return nums.prefix(4).contains(9)
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 2, 9, 3, 4]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4, 9]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4, 5]),
			Problem.TestCase(expectation: true, arguments: [9, 2, 3]),
			Problem.TestCase(expectation: true, arguments: [1, 9, 9]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: true, arguments: [1, 9]),
			Problem.TestCase(expectation: false, arguments: [5, 5]),
			Problem.TestCase(expectation: false, arguments: [2]),
			Problem.TestCase(expectation: true, arguments: [9]),
			Problem.TestCase(expectation: false, arguments: [Int]()),
			Problem.TestCase(expectation: true, arguments: [3, 9, 2, 3, 3])
		],
		eulerMode: false
	),
	Problem(
		title: "array123",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if the sequence of numbers 1, 2, 3 appears in the array somewhere.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 1, 2, 3, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 2, 4, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 2, 1, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 2, 1, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3, 1, 2, 3]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 2]),
			Problem.TestCase(expectation: false, arguments: [1]),
			Problem.TestCase(expectation: false, arguments: [Int]())
		],
		eulerMode: false
	),
	Problem(
		title: "array667",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return the number of times that two 6's are next to each other in the array. Also count instances where the second \"6\" is actually a 7.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: [6, 6, 2]),
			Problem.TestCase(expectation: 1, arguments: [6, 6, 2, 6]),
			Problem.TestCase(expectation: 1, arguments: [6, 7, 2, 6]),
			Problem.TestCase(expectation: 2, arguments: [6, 6, 2, 6, 7]),
			Problem.TestCase(expectation: 0, arguments: [1, 6, 3]),
			Problem.TestCase(expectation: 0, arguments: [6, 1]),
			Problem.TestCase(expectation: 0, arguments: [Int]()),
			Problem.TestCase(expectation: 1, arguments: [3, 6, 7, 6]),
			Problem.TestCase(expectation: 2, arguments: [3, 6, 6, 7]),
			Problem.TestCase(expectation: 1, arguments: [6, 3, 6, 6]),
			Problem.TestCase(expectation: 2, arguments: [6, 7, 6, 6]),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3, 5, 6]),
			Problem.TestCase(expectation: 1, arguments: [1, 2, 3, 6, 6])
		],
		eulerMode: false
	),
	Problem(
		title: "noTriples",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, we'll say that a triple is a value appearing 3 times in a row in the array. Return true if the array does not contain any triples.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 1, 2, 2, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 2, 2, 2, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1, 2, 2, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 2, 2, 1, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 1]),
			Problem.TestCase(expectation: true, arguments: [1]),
			Problem.TestCase(expectation: true, arguments: [Int]())
		],
		eulerMode: false
	),
	Problem(
		title: "has271",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if it contains a 2, 7, 1 pattern: a value, followed by the value plus 5, followed by the value minus 1. Additionally the 271 counts even if the \"1\" differs by 2 or less from the correct value.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 2, 7, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 8, 1]),
			Problem.TestCase(expectation: true, arguments: [2, 7, 1]),
			Problem.TestCase(expectation: true, arguments: [3, 8, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 7, 3]),
			Problem.TestCase(expectation: false, arguments: [2, 7, 4]),
			Problem.TestCase(expectation: true, arguments: [2, 7, -1]),
			Problem.TestCase(expectation: false, arguments: [2, 7, -2]),
			Problem.TestCase(expectation: true, arguments: [4, 5, 3, 8, 0]),
			Problem.TestCase(expectation: true, arguments: [2, 7, 5, 10, 4]),
			Problem.TestCase(expectation: true, arguments: [2, 7, -2, 4, 9, 3]),
			Problem.TestCase(expectation: false, arguments: [2, 7, 5, 10, 1]),
			Problem.TestCase(expectation: false, arguments: [2, 7, -2, 4, 10, 2]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 4, 9, 0]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 4, 9, 4, 9, 2])
		],
		eulerMode: false
	)
	
	
]
