//
//  CodingBatFunctional2Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatFunctional2Problems: [Problem] = [
	Problem(
		title: "noNeg",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of integers, return an array of the integers, omitting any that are less than 0.",
		solution: """
		func noNeg(nums: [Int]) -> [Int] {
			return nums.filter { n in n >= 0 }
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1], arguments: [1, -2]),
			Problem.TestCase(expectation: [3, 3], arguments: [-3, -3, 3, 3]),
			Problem.TestCase(expectation: [Int](), arguments: [-1, -1, -1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [0, 1, 2], arguments: [0, 1, 2]),
			Problem.TestCase(expectation: [3, 1, 4], arguments: [3, -10, 1, -1, 4, -400]),
			Problem.TestCase(expectation: [3, 1, 5], arguments: [-1, 3, 1, -1, -10, -100, -111, 5])
		],
		eulerMode: false
	),
	Problem(
		title: "no9",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of non-negative integers, return an array of those numbers except omitting any that end with 9. (Note: % by 10)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 2], arguments: [1, 2, 19]),
			Problem.TestCase(expectation: [3], arguments: [9, 19, 29, 3]),
			Problem.TestCase(expectation: [1, 2, 3], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [45, 90, 28, 13, 0], arguments: [45, 99, 90, 28, 13, 999, 0]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [Int](), arguments: [9]),
			Problem.TestCase(expectation: [0, 0], arguments: [0, 9, 0])
		],
		eulerMode: false
	),
	Problem(
		title: "noTeen",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of integers, return an array of those numbers, omitting any that are between 13 and 19 inclusive.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [12, 20], arguments: [12, 13, 19, 20]),
			Problem.TestCase(expectation: [1, 1], arguments: [1, 14, 1]),
			Problem.TestCase(expectation: [Int](), arguments: [15]),
			Problem.TestCase(expectation: [-15], arguments: [-15]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [0, 1, 2, -3], arguments: [0, 1, 2, -3]),
			Problem.TestCase(expectation: [21], arguments: [15, 17, 19, 21, 19]),
			Problem.TestCase(expectation: [-16, 2, 3, 25], arguments: [-16, 2, 15, 3, 16, 25])
		],
		eulerMode: false
	),
	Problem(
		title: "noZ",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array of the strings, omitting any string that contains a \"z\". (Note: the str.contains(x) method returns a boolean)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["aaa", "bbb"], arguments: ["aaa", "bbb", "aza"]),
			Problem.TestCase(expectation: ["hi"], arguments: ["hziz", "hzello", "hi"]),
			Problem.TestCase(expectation: ["hello", "are"], arguments: ["hello", "howz", "are", "youz"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: [""], arguments: [""]),
			Problem.TestCase(expectation: ["x", "y"], arguments: ["x", "y", "z"])
		],
		eulerMode: false
	),
	Problem(
		title: "noLong",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array of the strings, omitting any string length 4 or more.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["not", "too"], arguments: ["this", "not", "too", "long"]),
			Problem.TestCase(expectation: ["a", "bbb"], arguments: ["a", "bbb", "cccc"]),
			Problem.TestCase(expectation: [String](), arguments: ["cccc", "cccc", "cccc"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: [""], arguments: [""]),
			Problem.TestCase(expectation: [""], arguments: ["empty", "", "empty"]),
			Problem.TestCase(expectation: ["a"], arguments: ["a"]),
			Problem.TestCase(expectation: ["bbb", "***", "333"], arguments: ["aaaa", "bbb", "***", "333"])
		],
		eulerMode: false
	),
	Problem(
		title: "no34",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array of the strings, omitting any string length 3 or 4.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a", "bb"], arguments: ["a", "bb", "ccc"]),
			Problem.TestCase(expectation: ["a", "bb"], arguments: ["a", "bb", "ccc", "dddd"]),
			Problem.TestCase(expectation: ["apple"], arguments: ["ccc", "dddd", "apple"]),
			Problem.TestCase(expectation: [String](), arguments: ["this", "not", "too", "long"]),
			Problem.TestCase(expectation: ["a", "xx"], arguments: ["a", "bbb", "cccc", "xx"]),
			Problem.TestCase(expectation: ["xxxxxxx"], arguments: ["dddd", "ddd", "xxxxxxx"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: [""], arguments: [""]),
			Problem.TestCase(expectation: ["empty", "", "empty"], arguments: ["empty", "", "empty"]),
			Problem.TestCase(expectation: ["a"], arguments: ["a"]),
			Problem.TestCase(expectation: ["*****"], arguments: ["aaaa", "bbb", "*****", "333"])
		],
		eulerMode: false
	),
	Problem(
		title: "noYY",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string has \"y\" added at its end, omitting any resulting strings that contain \"yy\" as a substring anywhere.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["ay", "by", "cy"], arguments: ["a", "b", "c"]),
			Problem.TestCase(expectation: ["ay", "by"], arguments: ["a", "b", "cy"]),
			Problem.TestCase(expectation: ["xxy", "yay", "zzy"], arguments: ["xx", "ya", "zz"]),
			Problem.TestCase(expectation: ["xxy", "zzy"], arguments: ["xx", "yay", "zz"]),
			Problem.TestCase(expectation: ["zzzy"], arguments: ["yyx", "y", "zzz"]),
			Problem.TestCase(expectation: ["helloy", "therey"], arguments: ["hello", "there"]),
			Problem.TestCase(expectation: ["yay"], arguments: ["ya"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["y"], arguments: [""]),
			Problem.TestCase(expectation: ["xxy", "zzy"], arguments: ["xx", "yy", "zz"])
		],
		eulerMode: false
	),
	Problem(
		title: "two2",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of non-negative integers, return an array of those numbers multiplied by 2, omitting any of the resulting numbers that end in 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [4, 6], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [4], arguments: [2, 6, 11]),
			Problem.TestCase(expectation: [0], arguments: [0]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [Int](), arguments: [1, 11, 111, 16]),
			Problem.TestCase(expectation: [4, 6, 10, 14], arguments: [2, 3, 5, 7, 11]),
			Problem.TestCase(expectation: [6, 8, 198, 0], arguments: [3, 1, 4, 1, 6, 99, 0])
		],
		eulerMode: false
	),
	Problem(
		title: "square56",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of integers, return an array of those numbers squared and the product added to 10, omitting any of the resulting numbers that end in 5 or 6.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [19, 11], arguments: [3, 1, 4]),
			Problem.TestCase(expectation: [11], arguments: [1]),
			Problem.TestCase(expectation: [14], arguments: [2]),
			Problem.TestCase(expectation: [19], arguments: [3]),
			Problem.TestCase(expectation: [Int](), arguments: [4]),
			Problem.TestCase(expectation: [Int](), arguments: [5]),
			Problem.TestCase(expectation: [Int](), arguments: [6]),
			Problem.TestCase(expectation: [59], arguments: [7]),
			Problem.TestCase(expectation: [11, 14, 19, 59], arguments: [1, 2, 3, 4, 5, 6, 7]),
			Problem.TestCase(expectation: [19, 11, 11, 91], arguments: [3, -1, -4, 1, 5, 9])
		],
		eulerMode: false
	)
	
]
