//
//  CodingBatArray3Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatArray3Problems: [Problem] = [
	Problem(
		title: "maxSpan",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Consider the leftmost and righmost appearances of some value in an array. We'll say that the \"span\" is the number of elements between the two inclusive. A single value has a span of 1. Returns the largest span found in the given array. (Efficiency is not a priority.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 4, arguments: [1, 2, 1, 1, 3]),
			Problem.TestCase(expectation: 6, arguments: [1, 4, 2, 1, 4, 1, 4]),
			Problem.TestCase(expectation: 6, arguments: [1, 4, 2, 1, 4, 4, 4]),
			Problem.TestCase(expectation: 3, arguments: [3, 3, 3]),
			Problem.TestCase(expectation: 3, arguments: [3, 9, 3]),
			Problem.TestCase(expectation: 2, arguments: [3, 9, 9]),
			Problem.TestCase(expectation: 1, arguments: [3, 9]),
			Problem.TestCase(expectation: 2, arguments: [3, 3]),
			Problem.TestCase(expectation: 0, arguments: [Int]()),
			Problem.TestCase(expectation: 1, arguments: [1])
		],
		eulerMode: false
	),
	Problem(
		title: "fix34",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return an array that contains exactly the same numbers as the given array, but rearranged so that every 3 is immediately followed by a 4. Do not move the 3's, but every other number may move. The array contains the same number of 3's and 4's, every 3 has a number after it that is not a 3, and a 3 appears in the array before any 4.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 3, 4, 1], arguments: [1, 3, 1, 4]),
			Problem.TestCase(expectation: [1, 3, 4, 1, 1, 3, 4], arguments: [1, 3, 1, 4, 4, 3, 1]),
			Problem.TestCase(expectation: [3, 4, 2, 2], arguments: [3, 2, 2, 4]),
			Problem.TestCase(expectation: [3, 4, 3, 4, 2, 2], arguments: [3, 2, 3, 2, 4, 4]),
			Problem.TestCase(expectation: [2, 3, 4, 3, 4, 2, 2], arguments: [2, 3, 2, 3, 2, 4, 4]),
			Problem.TestCase(expectation: [5, 3, 4, 5, 5, 5, 5, 5, 3, 4, 3, 4], arguments: [5, 3, 5, 4, 5, 4, 5, 4, 3, 5, 3, 5]),
			Problem.TestCase(expectation: [3, 4, 1], arguments: [3, 1, 4]),
			Problem.TestCase(expectation: [3, 4, 1], arguments: [3, 4, 1]),
			Problem.TestCase(expectation: [1, 1, 1], arguments: [1, 1, 1]),
			Problem.TestCase(expectation: [1], arguments: [1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [7, 3, 4, 7, 7], arguments: [7, 3, 7, 7, 4]),
			Problem.TestCase(expectation: [3, 4, 1, 3, 4, 1], arguments: [3, 1, 4, 3, 1, 4]),
			Problem.TestCase(expectation: [3, 4, 1, 3, 4, 1], arguments: [3, 1, 1, 3, 4, 4])
		],
		eulerMode: false
	),
	Problem(
		title: "fix45",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "(This is a slightly harder version of the fix34 problem.) Return an array that contains exactly the same numbers as the given array, but rearranged so that every 4 is immediately followed by a 5. Do not move the 4's, but every other number may move. The array contains the same number of 4's and 5's, and every 4 has a number after it that is not a 4. In this version, 5's may appear anywhere in the original array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [9, 4, 5, 4, 5, 9], arguments: [5, 4, 9, 4, 9, 5]),
			Problem.TestCase(expectation: [1, 4, 5, 1], arguments: [1, 4, 1, 5]),
			Problem.TestCase(expectation: [1, 4, 5, 1, 1, 4, 5], arguments: [1, 4, 1, 5, 5, 4, 1]),
			Problem.TestCase(expectation: [4, 5, 4, 5, 9, 9, 4, 5, 9], arguments: [4, 9, 4, 9, 5, 5, 4, 9, 5]),
			Problem.TestCase(expectation: [1, 1, 4, 5, 4, 5], arguments: [5, 5, 4, 1, 4, 1]),
			Problem.TestCase(expectation: [4, 5, 2, 2], arguments: [4, 2, 2, 5]),
			Problem.TestCase(expectation: [4, 5, 4, 5, 2, 2], arguments: [4, 2, 4, 2, 5, 5]),
			Problem.TestCase(expectation: [4, 5, 4, 5, 2], arguments: [4, 2, 4, 5, 5]),
			Problem.TestCase(expectation: [1, 1, 1], arguments: [1, 1, 1]),
			Problem.TestCase(expectation: [4, 5], arguments: [4, 5]),
			Problem.TestCase(expectation: [1, 4, 5], arguments: [5, 4, 1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [1, 4, 5, 4, 5], arguments: [5, 4, 5, 4, 1]),
			Problem.TestCase(expectation: [4, 5, 4, 5, 1], arguments: [4, 5, 4, 1, 5]),
			Problem.TestCase(expectation: [3, 4, 5], arguments: [3, 4, 5]),
			Problem.TestCase(expectation: [4, 5, 1], arguments: [4, 1, 5]),
			Problem.TestCase(expectation: [1, 4, 5], arguments: [5, 4, 1]),
			Problem.TestCase(expectation: [2, 4, 5, 2], arguments: [2, 4, 2, 5])
		],
		eulerMode: false
	),
	Problem(
		title: "canBalance",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given a non-empty array, return true if there is a place to split the array so that the sum of the numbers on one side is equal to the sum of the numbers on the other side.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 1, 1, 2, 1]),
			Problem.TestCase(expectation: false, arguments: [2, 1, 1, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [10, 10]),
			Problem.TestCase(expectation: true, arguments: [10, 0, 1, -1, 10]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 1, 1, 4]),
			Problem.TestCase(expectation: false, arguments: [2, 1, 1, 1, 4]),
			Problem.TestCase(expectation: false, arguments: [2, 3, 4, 1, 2]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3, 1, 0, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 1, 0, 1, 3]),
			Problem.TestCase(expectation: false, arguments: [1]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 1, 2, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "squareUp",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given n>=0, create an array length n*n with the following pattern, shown here for n=3 :\n[0, 0, 1,    0, 2, 1,    3, 2, 1] (spaces added to show the 3 groups).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [0, 0, 1, 0, 2, 1, 3, 2, 1], arguments: 3),
			Problem.TestCase(expectation: [0, 1, 2, 1], arguments: 2),
			Problem.TestCase(expectation: [0, 0, 0, 1, 0, 0, 2, 1, 0, 3, 2, 1, 4, 3, 2, 1], arguments: 4),
			Problem.TestCase(expectation: [1], arguments: 1),
			Problem.TestCase(expectation: [Int](), arguments: 0),
			Problem.TestCase(expectation: [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 2, 1, 0, 0, 0, 3, 2, 1, 0, 0, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 6, 5, 4, 3, 2, 1], arguments: 6)
		],
		eulerMode: false
	),
	Problem(
		title: "seriesUp",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given n>=0, create an array with the pattern [1,    1, 2,    1, 2, 3,   ... 1, 2, 3 .. n] (spaces added to show the grouping). Note that the length of the array will be 1 + 2 + 3 ... + n, which is known to sum to exactly n*(n + 1)/2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 1, 2, 1, 2, 3], arguments: 3),
			Problem.TestCase(expectation: [1, 1, 2, 1, 2, 3, 1, 2, 3, 4], arguments: 4),
			Problem.TestCase(expectation: [1, 1, 2], arguments: 2),
			Problem.TestCase(expectation: [1], arguments: 1),
			Problem.TestCase(expectation: [Int](), arguments: 0),
			Problem.TestCase(expectation: [1, 1, 2, 1, 2, 3, 1, 2, 3, 4, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6], arguments: 6)
		],
		eulerMode: false
	),
	Problem(
		title: "maxMirror",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "We'll say that a \"mirror\" section in an array is a group of contiguous elements such that somewhere in the array, the same group appears in reverse order. For example, the largest mirror section in [1, 2, 3, 8, 9, 3, 2, 1] is length 3 (the [1, 2, 3] part). Return the size of the largest mirror section found in the given array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 3, arguments: [1, 2, 3, 8, 9, 3, 2, 1]),
			Problem.TestCase(expectation: 3, arguments: [1, 2, 1, 4]),
			Problem.TestCase(expectation: 2, arguments: [7, 1, 2, 9, 7, 2, 1]),
			Problem.TestCase(expectation: 4, arguments: [21, 22, 9, 8, 7, 6, 23, 24, 6, 7, 8, 9, 25, 7, 8, 9]),
			Problem.TestCase(expectation: 4, arguments: [1, 2, 1, 20, 21, 1, 2, 1, 2, 23, 24, 2, 1, 2, 1, 25]),
			Problem.TestCase(expectation: 5, arguments: [1, 2, 3, 2, 1]),
			Problem.TestCase(expectation: 2, arguments: [1, 2, 3, 3, 8]),
			Problem.TestCase(expectation: 2, arguments: [1, 2, 7, 8, 1, 7, 2]),
			Problem.TestCase(expectation: 3, arguments: [1, 1, 1]),
			Problem.TestCase(expectation: 1, arguments: [1]),
			Problem.TestCase(expectation: 0, arguments: [Int]()),
			Problem.TestCase(expectation: 3, arguments: [9, 1, 1, 4, 2, 1, 1, 1]),
			Problem.TestCase(expectation: 7, arguments: [5, 9, 9, 4, 5, 4, 9, 9, 2]),
			Problem.TestCase(expectation: 2, arguments: [5, 9, 9, 6, 5, 4, 9, 9, 2]),
			Problem.TestCase(expectation: 3, arguments: [5, 9, 1, 6, 5, 4, 1, 9, 5])
		],
		eulerMode: false
	),
	Problem(
		title: "countClumps",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Say that a \"clump\" in an array is a series of 2 or more adjacent elements of the same value. Return the number of clumps in the given array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 2, arguments: [1, 2, 2, 3, 4, 4]),
			Problem.TestCase(expectation: 2, arguments: [1, 1, 2, 1, 1]),
			Problem.TestCase(expectation: 1, arguments: [1, 1, 1, 1, 1]),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: 4, arguments: [2, 2, 1, 1, 1, 2, 1, 1, 2, 2]),
			Problem.TestCase(expectation: 4, arguments: [0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]),
			Problem.TestCase(expectation: 5, arguments: [0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]),
			Problem.TestCase(expectation: 5, arguments: [0, 0, 0, 2, 2, 1, 1, 1, 2, 1, 1, 2, 2]),
			Problem.TestCase(expectation: 0, arguments: [Int]())
		],
		eulerMode: false
	)
]
