//
//  CodingBatFunctional1Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatFunctional1Problems: [Problem] = [
	Problem(
		title: "doubling",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of integers, return an array where each integer is multiplied by 2.",
		solution: """
		func doubling(nums: [Int]) -> [Int] {
			return nums.map { n in n * 2 }
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [2, 4, 6], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [12, 16, 12, 16, -2], arguments: [6, 8, 6, 8, -1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [10], arguments: [5]),
			Problem.TestCase(expectation: [10, 20], arguments: [5, 10]),
			Problem.TestCase(expectation: [16, -10, 14, 6, 218], arguments: [8, -5, 7, 3, 109]),
			Problem.TestCase(expectation: [12, -6, 24, 46, 8, 2, 38, 22, 4, 6, 4], arguments: [6, -3, 12, 23, 4, 1, 19, 11, 2, 3, 2]),
			Problem.TestCase(expectation: [6, 2, 8, 2, 10, 18], arguments: [3, 1, 4, 1, 5, 9])
		],
		eulerMode: false
	),
	Problem(
		title: "square",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of integers, return an array where each integer is multiplied with itself.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 4, 9], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [36, 64, 36, 64, 1], arguments: [6, 8, -6, -8, 1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [144], arguments: [12]),
			Problem.TestCase(expectation: [25, 100], arguments: [5, 10]),
			Problem.TestCase(expectation: [36, 9, 144, 529, 16, 1, 361, 121, 4, 9, 4], arguments: [6, -3, 12, 23, 4, 1, 19, 11, 2, 3, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "addStar",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string has \"*\" added at its end.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a*", "bb*", "ccc*"], arguments: ["a", "bb", "ccc"]),
			Problem.TestCase(expectation: ["hello*", "there*"], arguments: ["hello", "there"]),
			Problem.TestCase(expectation: ["**"], arguments: ["*"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["kittens*", "and*", "chocolate*", "and*"], arguments: ["kittens", "and", "chocolate", "and"]),
			Problem.TestCase(expectation: ["empty*", "string*", "*"], arguments: ["empty", "string", ""])
		],
		eulerMode: false
	),
	Problem(
		title: "copies3",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string is replaced by 3 copies of the string concatenated together.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["aaa", "bbbbbb", "ccccccccc"], arguments: ["a", "bb", "ccc"]),
			Problem.TestCase(expectation: ["242424", "aaa", ""], arguments: ["24", "a", ""]),
			Problem.TestCase(expectation: ["hellohellohello", "theretherethere"], arguments: ["hello", "there"]),
			Problem.TestCase(expectation: ["nonono"], arguments: ["no"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["thisthisthis", "andandand", "thatthatthat", "andandand"], arguments: ["this", "and", "that", "and"])
		],
		eulerMode: false
	),
	Problem(
		title: "moreY",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string has \"y\" added at its start and end.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["yay", "yby", "ycy"], arguments: ["a", "b", "c"]),
			Problem.TestCase(expectation: ["yhelloy", "ytherey"], arguments: ["hello", "there"]),
			Problem.TestCase(expectation: ["yyayy"], arguments: ["yay"]),
			Problem.TestCase(expectation: ["yy", "yay", "yxxy"], arguments: ["", "a", "xx"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["yxxy", "yyyy", "yzzy"], arguments: ["xx", "yy", "zz"])
		],
		eulerMode: false
	),
	Problem(
		title: "math1",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of integers, return an array where each integer is added to 1 and the result is multiplied by 10.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [20, 30, 40], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [70, 90, 70, 90, 20], arguments: [6, 8, 6, 8, 1]),
			Problem.TestCase(expectation: [110], arguments: [10]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [60, 110], arguments: [5, 10]),
			Problem.TestCase(expectation: [0, -10, -20, -10, 0], arguments: [-1, -2, -3, -2, -1]),
			Problem.TestCase(expectation: [70, -20, 130, 240, 50, 20, 200, 120, 30, 40, 30], arguments: [6, -3, 12, 23, 4, 1, 19, 11, 2, 3, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "rightDigit",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of non-negative integers, return an integer array of the rightmost digits. (Note: use %)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 2, 3], arguments: [1, 22, 93]),
			Problem.TestCase(expectation: [6, 8, 6, 8, 1], arguments: [16, 8, 886, 8, 1]),
			Problem.TestCase(expectation: [0, 0], arguments: [10, 0]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [5, 0], arguments: [5, 10]),
			Problem.TestCase(expectation: [5, 0, 0, 0, 0], arguments: [5, 50, 500, 5000, 5000]),
			Problem.TestCase(expectation: [6, 3, 2, 3, 4, 1, 9, 9, 2, 3, 2], arguments: [6, 23, 12, 23, 4, 1, 19, 1119, 2, 3, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "lower",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string is converted to lower case (Note: String lowercased() method).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["hello", "hi"], arguments: ["Hello", "Hi"]),
			Problem.TestCase(expectation: ["aaa", "bbb", "ccc"], arguments: ["AAA", "BBB", "ccc"]),
			Problem.TestCase(expectation: ["kitten", "chocolate"], arguments: ["KitteN", "ChocolaTE"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["empty", ""], arguments: ["EMPTY", ""]),
			Problem.TestCase(expectation: ["aax", "byb", "ycc", "zzz"], arguments: ["aaX", "bYb", "Ycc", "ZZZ"])
		],
		eulerMode: false
	),
	Problem(
		title: "noX2",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string has all its \"x\" removed.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a", "bb", "c"], arguments: ["ax", "bb", "cx"]),
			Problem.TestCase(expectation: ["a", "bb", "c"], arguments: ["xxax", "xbxbx", "xxcx"]),
			Problem.TestCase(expectation: [""], arguments: ["x"]),
			Problem.TestCase(expectation: [""], arguments: [""]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["the", "tai"], arguments: ["the", "taxi"]),
			Problem.TestCase(expectation: ["the", "tai"], arguments: ["the", "xxtxaxixxx"]),
			Problem.TestCase(expectation: ["this", "is", "the", ""], arguments: ["this", "is", "the", "x"])
		],
		eulerMode: false
	)
]
