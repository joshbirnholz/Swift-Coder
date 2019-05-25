//
//  CodingBatArray2Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatArray2Problems: [Problem] = [
	Problem(
		title: "countEvens",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return the number of even ints in the given array. Note: the `%` (remainder) operator computes the remainder, e.g. 5 % 2 is 1.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 3, arguments: [2, 1, 2, 3, 4]),
			Problem.TestCase(expectation: 3, arguments: [2, 2, 0]),
			Problem.TestCase(expectation: 0, arguments: [1, 3, 5]),
			Problem.TestCase(expectation: 0, arguments: [Int]()),
			Problem.TestCase(expectation: 1, arguments: [11, 9, 0, 1]),
			Problem.TestCase(expectation: 2, arguments: [2, 11, 9, 0]),
			Problem.TestCase(expectation: 1, arguments: [2]),
			Problem.TestCase(expectation: 2, arguments: [2, 5, 12])
		],
		eulerMode: false
	),
	Problem(
		title: "bigDiff",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array length 1 or more of ints, return the difference between the largest and smallest values in the array. Note: the built-in `min(v1, v2)` and `max(v1, v2)` methods return the smaller or larger of two values.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 7, arguments: [10, 3, 5, 6]),
			Problem.TestCase(expectation: 8, arguments: [7, 2, 10, 9]),
			Problem.TestCase(expectation: 8, arguments: [2, 10, 7, 2]),
			Problem.TestCase(expectation: 8, arguments: [2, 10]),
			Problem.TestCase(expectation: 8, arguments: [10, 2]),
			Problem.TestCase(expectation: 10, arguments: [10, 0]),
			Problem.TestCase(expectation: 1, arguments: [2, 3]),
			Problem.TestCase(expectation: 0, arguments: [2, 2]),
			Problem.TestCase(expectation: 0, arguments: [2]),
			Problem.TestCase(expectation: 8, arguments: [5, 1, 6, 1, 9, 9]),
			Problem.TestCase(expectation: 3, arguments: [7, 6, 8, 5]),
			Problem.TestCase(expectation: 3, arguments: [7, 7, 6, 8, 5, 5, 6])
		],
		eulerMode: false
	),
	Problem(
		title: "centeredAverage",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return the \"centered\" average of an array of ints, which we'll say is the mean average of the values, except ignoring the largest and smallest values in the array. If there are multiple copies of the smallest value, ignore just one copy, and likewise for the largest value. Use int division to produce the final average. You may assume that the array is length 3 or more.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 3, arguments: [1, 2, 3, 4, 100]),
			Problem.TestCase(expectation: 5, arguments: [1, 1, 5, 5, 10, 8, 7]),
			Problem.TestCase(expectation: -3, arguments: [-10, -4, -2, -4, -2, 0]),
			Problem.TestCase(expectation: 4, arguments: [5, 3, 4, 6, 2]),
			Problem.TestCase(expectation: 4, arguments: [5, 3, 4, 0, 100]),
			Problem.TestCase(expectation: 4, arguments: [100, 0, 5, 3, 4]),
			Problem.TestCase(expectation: 4, arguments: [4, 0, 100]),
			Problem.TestCase(expectation: 3, arguments: [0, 2, 3, 4, 100]),
			Problem.TestCase(expectation: 1, arguments: [1, 1, 100]),
			Problem.TestCase(expectation: 7, arguments: [7, 7, 7]),
			Problem.TestCase(expectation: 7, arguments: [1, 7, 8]),
			Problem.TestCase(expectation: 50, arguments: [1, 1, 99, 99]),
			Problem.TestCase(expectation: 50, arguments: [1000, 0, 1, 99]),
			Problem.TestCase(expectation: 4, arguments: [4, 4, 4, 4, 5]),
			Problem.TestCase(expectation: 4, arguments: [4, 4, 4, 1, 5]),
			Problem.TestCase(expectation: 6, arguments: [6, 4, 8, 12, 3])
		],
		eulerMode: false
	),
	Problem(
		title: "sum13",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return the sum of the numbers in the array, returning 0 for an empty array. Except the number 13 is very unlucky, so it does not count and numbers that come immediately after a 13 also do not count.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 6, arguments: [1, 2, 2, 1]),
			Problem.TestCase(expectation: 2, arguments: [1, 1]),
			Problem.TestCase(expectation: 6, arguments: [1, 2, 2, 1, 13]),
			Problem.TestCase(expectation: 4, arguments: [1, 2, 13, 2, 1, 13]),
			Problem.TestCase(expectation: 3, arguments: [13, 1, 2, 13, 2, 1, 13]),
			Problem.TestCase(expectation: 0, arguments: [Int]()),
			Problem.TestCase(expectation: 0, arguments: [13]),
			Problem.TestCase(expectation: 0, arguments: [13, 13]),
			Problem.TestCase(expectation: 0, arguments: [13, 0, 13]),
			Problem.TestCase(expectation: 0, arguments: [13, 1, 13]),
			Problem.TestCase(expectation: 14, arguments: [5, 7, 2]),
			Problem.TestCase(expectation: 5, arguments: [5, 13, 2]),
			Problem.TestCase(expectation: 0, arguments: [0]),
			Problem.TestCase(expectation: 0, arguments: [13, 0])
		],
		eulerMode: false
	),
	Problem(
		title: "sum67",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return the sum of the numbers in the array, except ignore sections of numbers starting with a 6 and extending to the next 7 (every 6 will be followed by at least one 7). Return 0 for no numbers.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 5, arguments: [1, 2, 2]),
			Problem.TestCase(expectation: 5, arguments: [1, 2, 2, 6, 99, 99, 7]),
			Problem.TestCase(expectation: 4, arguments: [1, 1, 6, 7, 2]),
			Problem.TestCase(expectation: 2, arguments: [1, 6, 2, 2, 7, 1, 6, 99, 99, 7]),
			Problem.TestCase(expectation: 2, arguments: [1, 6, 2, 6, 2, 7, 1, 6, 99, 99, 7]),
			Problem.TestCase(expectation: 18, arguments: [2, 7, 6, 2, 6, 7, 2, 7]),
			Problem.TestCase(expectation: 9, arguments: [2, 7, 6, 2, 6, 2, 7]),
			Problem.TestCase(expectation: 8, arguments: [1, 6, 7, 7]),
			Problem.TestCase(expectation: 8, arguments: [6, 7, 1, 6, 7, 7]),
			Problem.TestCase(expectation: 0, arguments: [6, 8, 1, 6, 7]),
			Problem.TestCase(expectation: 0, arguments: [Int]()),
			Problem.TestCase(expectation: 11, arguments: [6, 7, 11]),
			Problem.TestCase(expectation: 22, arguments: [11, 6, 7, 11]),
			Problem.TestCase(expectation: 11, arguments: [2, 2, 6, 7, 7])
		],
		eulerMode: false
	),
	Problem(
		title: "has22",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if the array contains a 2 next to a 2 somewhere.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 2, 2]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 1, 2]),
			Problem.TestCase(expectation: false, arguments: [2, 1, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 2, 1, 2]),
			Problem.TestCase(expectation: false, arguments: [1, 3, 2]),
			Problem.TestCase(expectation: true, arguments: [1, 3, 2, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 3, 2, 2]),
			Problem.TestCase(expectation: true, arguments: [4, 2, 4, 2, 2, 5]),
			Problem.TestCase(expectation: false, arguments: [1, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 2]),
			Problem.TestCase(expectation: false, arguments: [2]),
			Problem.TestCase(expectation: false, arguments: [Int]()),
			Problem.TestCase(expectation: true, arguments: [3, 3, 2, 2]),
			Problem.TestCase(expectation: false, arguments: [5, 2, 5, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "lucky13",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if the array contains no 1's and no 3's.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [0, 2, 4]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 4]),
			Problem.TestCase(expectation: true, arguments: [2, 7, 2, 8]),
			Problem.TestCase(expectation: false, arguments: [2, 7, 1, 8]),
			Problem.TestCase(expectation: false, arguments: [3, 7, 2, 8]),
			Problem.TestCase(expectation: false, arguments: [2, 7, 2, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 2]),
			Problem.TestCase(expectation: true, arguments: [2]),
			Problem.TestCase(expectation: false, arguments: [3]),
			Problem.TestCase(expectation: true, arguments: [Int]())
		],
		eulerMode: false
	),
	Problem(
		title: "sum28",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if the sum of all the 2's in the array is exactly 8.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [2, 3, 2, 2, 4, 2]),
			Problem.TestCase(expectation: false, arguments: [2, 3, 2, 2, 4, 2, 2]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4]),
			Problem.TestCase(expectation: true, arguments: [2, 2, 2, 2]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 2, 2, 2, 4]),
			Problem.TestCase(expectation: false, arguments: [Int]()),
			Problem.TestCase(expectation: false, arguments: [2]),
			Problem.TestCase(expectation: false, arguments: [8]),
			Problem.TestCase(expectation: false, arguments: [2, 2, 2]),
			Problem.TestCase(expectation: false, arguments: [2, 2, 2, 2, 2]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 2, 1, 2, 2]),
			Problem.TestCase(expectation: true, arguments: [5, 2, 2, 2, 4, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "more14",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if the number of 1's is greater than the number of 4's",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 4, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 4, 1, 4]),
			Problem.TestCase(expectation: true, arguments: [1, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 6, 6]),
			Problem.TestCase(expectation: true, arguments: [1]),
			Problem.TestCase(expectation: false, arguments: [1, 4]),
			Problem.TestCase(expectation: true, arguments: [6, 1, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 6, 4]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 4, 4, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 6, 4, 4, 1]),
			Problem.TestCase(expectation: false, arguments: [Int]()),
			Problem.TestCase(expectation: false, arguments: [4, 1, 4, 6]),
			Problem.TestCase(expectation: false, arguments: [4, 1, 4, 6, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 4, 1, 4, 1, 6])
		],
		eulerMode: false
	),
	Problem(
		title: "fizzArray",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a number `n`, create and return a new int array of length n, containing the numbers 0, 1, 2, ... n-1. The given n may be 0, in which case just return a length 0 array. You do not need a separate if-statement for the count-0 case; the for-loop should naturally execute 0 times in that case, so it just works.",
		solution: nil,
		hint: "https://codingbat.com/doc/practice/fizzbuzz-code.html",
		testCases: [
			Problem.TestCase(expectation: [0, 1, 2, 3], arguments: 4),
			Problem.TestCase(expectation: [0], arguments: 1),
			Problem.TestCase(expectation: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], arguments: 10),
			Problem.TestCase(expectation: [Int](), arguments: 0),
			Problem.TestCase(expectation: [0, 1], arguments: 2),
			Problem.TestCase(expectation: [0, 1, 2, 3, 4, 5, 6], arguments: 7)
		],
		eulerMode: false
	),
	Problem(
		title: "only14",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if every element is a 1 or a 4.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 4, 1, 4]),
			Problem.TestCase(expectation: false, arguments: [1, 4, 2, 4]),
			Problem.TestCase(expectation: true, arguments: [1, 1]),
			Problem.TestCase(expectation: true, arguments: [4, 1]),
			Problem.TestCase(expectation: false, arguments: [2]),
			Problem.TestCase(expectation: true, arguments: [Int]()),
			Problem.TestCase(expectation: false, arguments: [1, 4, 1, 3]),
			Problem.TestCase(expectation: false, arguments: [3, 1, 3]),
			Problem.TestCase(expectation: true, arguments: [1]),
			Problem.TestCase(expectation: true, arguments: [4]),
			Problem.TestCase(expectation: false, arguments: [3, 4]),
			Problem.TestCase(expectation: false, arguments: [1, 3, 4]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1, 5]),
			Problem.TestCase(expectation: true, arguments: [4, 1, 4, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "fizzArray2",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a number n, create and return a new string array of length n, containing the strings \"0\", \"1\" \"2\" .. through n-1. N may be 0, in which case just return a length 0 array. Note: `String(xxx)` will make the String form of an Int.",
		solution: nil,
		hint: "https://codingbat.com/doc/practice/fizzbuzz-code.html",
		testCases: [
			Problem.TestCase(expectation: ["0", "1", "2", "3"], arguments: 4),
			Problem.TestCase(expectation: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"], arguments: 10),
			Problem.TestCase(expectation: ["0", "1"], arguments: 2),
			Problem.TestCase(expectation: ["0"], arguments: 1),
			Problem.TestCase(expectation: [String](), arguments: 0),
			Problem.TestCase(expectation: ["0", "1", "2", "3", "4", "5", "6"], arguments: 7),
			Problem.TestCase(expectation: ["0", "1", "2", "3", "4", "5", "6", "7", "8"], arguments: 9),
			Problem.TestCase(expectation: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"], arguments: 11)
		],
		eulerMode: false
	),
	Problem(
		title: "no14",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if it contains no 1's or it contains no 4's.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4]),
			Problem.TestCase(expectation: true, arguments: [2, 3, 4]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 4, 4]),
			Problem.TestCase(expectation: true, arguments: [2, 2, 4, 4]),
			Problem.TestCase(expectation: false, arguments: [2, 3, 4, 1]),
			Problem.TestCase(expectation: true, arguments: [2, 1, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 4]),
			Problem.TestCase(expectation: true, arguments: [2]),
			Problem.TestCase(expectation: true, arguments: [2, 1]),
			Problem.TestCase(expectation: true, arguments: [1]),
			Problem.TestCase(expectation: true, arguments: [4]),
			Problem.TestCase(expectation: true, arguments: [Int]()),
			Problem.TestCase(expectation: true, arguments: [1, 1, 1, 1]),
			Problem.TestCase(expectation: false, arguments: [9, 4, 4, 1]),
			Problem.TestCase(expectation: false, arguments: [4, 2, 3, 1]),
			Problem.TestCase(expectation: true, arguments: [4, 2, 3, 5]),
			Problem.TestCase(expectation: true, arguments: [4, 4, 2]),
			Problem.TestCase(expectation: false, arguments: [1, 4, 4])
		],
		eulerMode: false
	),
	Problem(
		title: "matchUp2",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums1", type: [Int].self),
			Problem.Parameter(name: "nums2", type: [Int].self)
		],
		prompt: "Given arrays `nums1` and `nums2` of the same length, for every element in `nums1`, consider the corresponding element in `nums2` (at the same index). Return the count of the number of times that the two elements differ by 2 or less, but are not equal.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 2, arguments: [1, 2, 3], [2, 3, 10]),
			Problem.TestCase(expectation: 3, arguments: [1, 2, 3], [2, 3, 5]),
			Problem.TestCase(expectation: 2, arguments: [1, 2, 3], [2, 3, 3]),
			Problem.TestCase(expectation: 1, arguments: [5, 3], [5, 5]),
			Problem.TestCase(expectation: 2, arguments: [5, 3], [4, 4]),
			Problem.TestCase(expectation: 1, arguments: [5, 3], [3, 3]),
			Problem.TestCase(expectation: 1, arguments: [5, 3], [2, 2]),
			Problem.TestCase(expectation: 1, arguments: [5, 3], [1, 1]),
			Problem.TestCase(expectation: 0, arguments: [5, 3], [0, 0]),
			Problem.TestCase(expectation: 0, arguments: [4], [4]),
			Problem.TestCase(expectation: 1, arguments: [4], [5])
		],
		eulerMode: false
	),
	Problem(
		title: "has77",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if the array contains two 7's next to each other, or there are two 7's separated by one element, such as with `[7, 1, 7]`.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 7, 7]),
			Problem.TestCase(expectation: true, arguments: [1, 7, 1, 7]),
			Problem.TestCase(expectation: false, arguments: [1, 7, 1, 1, 7]),
			Problem.TestCase(expectation: true, arguments: [7, 7, 1, 1, 7]),
			Problem.TestCase(expectation: false, arguments: [2, 7, 2, 2, 7, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 7, 2, 2, 7, 7]),
			Problem.TestCase(expectation: true, arguments: [7, 2, 7, 2, 2, 7]),
			Problem.TestCase(expectation: false, arguments: [7, 2, 6, 2, 2, 7]),
			Problem.TestCase(expectation: true, arguments: [7, 7, 7]),
			Problem.TestCase(expectation: true, arguments: [7, 1, 7]),
			Problem.TestCase(expectation: false, arguments: [7, 1, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 2]),
			Problem.TestCase(expectation: false, arguments: [1, 7]),
			Problem.TestCase(expectation: false, arguments: [7])
		],
		eulerMode: false
	),
	Problem(
		title: "has12",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if there is a 1 in the array with a 2 somewhere later in the array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 3, 2]),
			Problem.TestCase(expectation: true, arguments: [3, 1, 2]),
			Problem.TestCase(expectation: true, arguments: [3, 1, 4, 5, 2]),
			Problem.TestCase(expectation: false, arguments: [3, 1, 4, 5, 6]),
			Problem.TestCase(expectation: true, arguments: [3, 1, 4, 1, 6, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 1, 4, 1, 6, 2]),
			Problem.TestCase(expectation: false, arguments: [2, 1, 4, 1, 6]),
			Problem.TestCase(expectation: false, arguments: [1]),
			Problem.TestCase(expectation: false, arguments: [2, 1, 3]),
			Problem.TestCase(expectation: true, arguments: [2, 1, 3, 2]),
			Problem.TestCase(expectation: false, arguments: [2]),
			Problem.TestCase(expectation: false, arguments: [3, 2]),
			Problem.TestCase(expectation: true, arguments: [3, 1, 3, 2]),
			Problem.TestCase(expectation: false, arguments: [3, 5, 9]),
			Problem.TestCase(expectation: false, arguments: [3, 5, 1]),
			Problem.TestCase(expectation: false, arguments: [3, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "modThree",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if the array contains either 3 even or 3 odd values all next to each other.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [2, 1, 3, 5]),
			Problem.TestCase(expectation: false, arguments: [2, 1, 2, 5]),
			Problem.TestCase(expectation: true, arguments: [2, 4, 2, 5]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 1, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [9, 9, 9]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 2]),
			Problem.TestCase(expectation: false, arguments: [1]),
			Problem.TestCase(expectation: false, arguments: [Int]()),
			Problem.TestCase(expectation: false, arguments: [9, 7, 2, 9]),
			Problem.TestCase(expectation: false, arguments: [9, 7, 2, 9, 2, 2]),
			Problem.TestCase(expectation: true, arguments: [9, 7, 2, 9, 2, 2, 6])
		],
		eulerMode: false
	),
	Problem(
		title: "haveThree",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if the value 3 appears in the array exactly 3 times, and no 3's are next to each other.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [3, 1, 3, 1, 3]),
			Problem.TestCase(expectation: false, arguments: [3, 1, 3, 3]),
			Problem.TestCase(expectation: false, arguments: [3, 4, 3, 3, 4]),
			Problem.TestCase(expectation: false, arguments: [1, 3, 1, 3, 1, 2]),
			Problem.TestCase(expectation: true, arguments: [1, 3, 1, 3, 1, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 3, 3, 1, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 3, 1, 3, 1, 3, 4, 3]),
			Problem.TestCase(expectation: true, arguments: [3, 4, 3, 4, 3, 4, 4]),
			Problem.TestCase(expectation: false, arguments: [3, 3, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 3]),
			Problem.TestCase(expectation: false, arguments: [3]),
			Problem.TestCase(expectation: false, arguments: [1])
		],
		eulerMode: false
	),
	Problem(
		title: "twoTwo",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if every 2 that appears in the array is next to another 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [4, 2, 2, 3]),
			Problem.TestCase(expectation: true, arguments: [2, 2, 4]),
			Problem.TestCase(expectation: false, arguments: [2, 2, 4, 2]),
			Problem.TestCase(expectation: true, arguments: [1, 3, 4]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 2, 3, 4]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4]),
			Problem.TestCase(expectation: true, arguments: [2, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 2, 7]),
			Problem.TestCase(expectation: false, arguments: [2, 2, 7, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [4, 2, 2, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 2, 2]),
			Problem.TestCase(expectation: false, arguments: [1, 2]),
			Problem.TestCase(expectation: false, arguments: [2]),
			Problem.TestCase(expectation: true, arguments: [1]),
			Problem.TestCase(expectation: true, arguments: [Int]()),
			Problem.TestCase(expectation: true, arguments: [5, 2, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [2, 2, 5, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "sameEnds",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "len", type: Int.self)
		],
		prompt: "Return true if the group of N numbers at the start and end of the array are the same. For example, with [5, 6, 45, 99, 13, 5, 6], the ends are the same for n=0 and n=2, and false for n=1 and n=3. You may assume that n is in the range 0...`nums.count`.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: false, arguments: [5, 6, 45, 99, 13, 5, 6], 1),
			Problem.TestCase(expectation: true, arguments: [5, 6, 45, 99, 13, 5, 6], 2),
			Problem.TestCase(expectation: false, arguments: [5, 6, 45, 99, 13, 5, 6], 3),
			Problem.TestCase(expectation: true, arguments: [1, 2, 5, 2, 1], 1),
			Problem.TestCase(expectation: false, arguments: [1, 2, 5, 2, 1], 2),
			Problem.TestCase(expectation: true, arguments: [1, 2, 5, 2, 1], 0),
			Problem.TestCase(expectation: true, arguments: [1, 2, 5, 2, 1], 5),
			Problem.TestCase(expectation: true, arguments: [1, 1, 1], 0),
			Problem.TestCase(expectation: true, arguments: [1, 1, 1], 1),
			Problem.TestCase(expectation: true, arguments: [1, 1, 1], 2),
			Problem.TestCase(expectation: true, arguments: [1, 1, 1], 3),
			Problem.TestCase(expectation: true, arguments: [1], 1),
			Problem.TestCase(expectation: true, arguments: [Int](), 0),
			Problem.TestCase(expectation: false, arguments: [4, 2, 4, 5], 1)
		],
		eulerMode: false
	),
	Problem(
		title: "tripleUp",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return true if the array contains, somewhere, three increasing adjacent numbers like .... 4, 5, 6, ... or 23, 24, 25.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 4, 5, 6, 2]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 4]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 4, 5, 7, 6, 5, 6, 7, 6]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 4, 5, 7, 6, 5, 7, 7, 6]),
			Problem.TestCase(expectation: false, arguments: [1, 2]),
			Problem.TestCase(expectation: false, arguments: [1]),
			Problem.TestCase(expectation: false, arguments: [Int]()),
			Problem.TestCase(expectation: true, arguments: [10, 9, 8, -100, -99, -98, 100]),
			Problem.TestCase(expectation: false, arguments: [10, 9, 8, -100, -99, 99, 100]),
			Problem.TestCase(expectation: true, arguments: [-100, -99, -99, 100, 101, 102]),
			Problem.TestCase(expectation: false, arguments: [2, 3, 5, 6, 8, 9, 2, 3])
		],
		eulerMode: false
	),
	Problem(
		title: "fizzArray3",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "start", type: Int.self),
			Problem.Parameter(name: "end", type: Int.self)
		],
		prompt: "Given start and end numbers, return a new array containing the sequence of integers from start up to but not including end, so start=5 and end=10 yields [5, 6, 7, 8, 9]. The end number will be greater or equal to the start number. Note that a length-0 array is valid.",
		solution: nil,
		hint: "https://codingbat.com/doc/practice/fizzbuzz-code.html",
		testCases: [
			Problem.TestCase(expectation: [5, 6, 7, 8, 9], arguments: 5, 10),
			Problem.TestCase(expectation: [11, 12, 13, 14, 15, 16, 17], arguments: 11, 18),
			Problem.TestCase(expectation: [1, 2], arguments: 1, 3),
			Problem.TestCase(expectation: [1], arguments: 1, 2),
			Problem.TestCase(expectation: [Int](), arguments: 1, 1),
			Problem.TestCase(expectation: [1000, 1001, 1002, 1003, 1004], arguments: 1000, 1005)
		],
		eulerMode: false
	),
	Problem(
		title: "shiftLeft",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return an array that is \"left shifted\" by one -- so [6, 2, 5, 3] returns [2, 5, 3, 6].",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [2, 5, 3, 6], arguments: [6, 2, 5, 3]),
			Problem.TestCase(expectation: [2, 1], arguments: [1, 2]),
			Problem.TestCase(expectation: [1], arguments: [1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [1, 2, 2, 4, 1], arguments: [1, 1, 2, 2, 4]),
			Problem.TestCase(expectation: [1, 1, 1], arguments: [1, 1, 1]),
			Problem.TestCase(expectation: [2, 3, 1], arguments: [1, 2, 3])
		],
		eulerMode: false
	),
	Problem(
		title: "tenRun",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "For each multiple of 10 in the given array, change all the values following it to be that multiple of 10, until encountering another multiple of 10. So `[2, 10, 3, 4, 20, 5]` yields `[2, 10, 10, 10, 20, 20]`.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [2, 10, 10, 10, 20, 20], arguments: [2, 10, 3, 4, 20, 5]),
			Problem.TestCase(expectation: [10, 10, 20, 20], arguments: [10, 1, 20, 2]),
			Problem.TestCase(expectation: [10, 10, 10, 20], arguments: [10, 1, 9, 20]),
			Problem.TestCase(expectation: [1, 2, 50, 50], arguments: [1, 2, 50, 1]),
			Problem.TestCase(expectation: [1, 20, 50, 50], arguments: [1, 20, 50, 1]),
			Problem.TestCase(expectation: [10, 10], arguments: [10, 10]),
			Problem.TestCase(expectation: [10, 10], arguments: [10, 2]),
			Problem.TestCase(expectation: [0, 0], arguments: [0, 2]),
			Problem.TestCase(expectation: [1, 2], arguments: [1, 2]),
			Problem.TestCase(expectation: [1], arguments: [1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]())
		],
		eulerMode: false
	),
	Problem(
		title: "pre4",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given a non-empty array of ints, return a new array containing the elements from the original array that come before the first 4 in the original array. The original array will contain at least one 4.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 2], arguments: [1, 2, 4, 1]),
			Problem.TestCase(expectation: [3, 1], arguments: [3, 1, 4]),
			Problem.TestCase(expectation: [1], arguments: [1, 4, 4]),
			Problem.TestCase(expectation: [1], arguments: [1, 4, 4, 2]),
			Problem.TestCase(expectation: [1, 3], arguments: [1, 3, 4, 2, 4]),
			Problem.TestCase(expectation: [Int](), arguments: [4, 4]),
			Problem.TestCase(expectation: [3, 3], arguments: [3, 3, 4]),
			Problem.TestCase(expectation: [1, 2, 1], arguments: [1, 2, 1, 4]),
			Problem.TestCase(expectation: [2, 1], arguments: [2, 1, 4, 2]),
			Problem.TestCase(expectation: [2, 1, 2, 1], arguments: [2, 1, 2, 1, 4, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "post4",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given a non-empty array of ints, return a new array containing the elements from the original array that come after the last 4 in the original array. The original array will contain at least one 4.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 2], arguments: [2, 4, 1, 2]),
			Problem.TestCase(expectation: [2], arguments: [4, 1, 4, 2]),
			Problem.TestCase(expectation: [1, 2, 3], arguments: [4, 4, 1, 2, 3]),
			Problem.TestCase(expectation: [2], arguments: [4, 2]),
			Problem.TestCase(expectation: [3], arguments: [4, 4, 3]),
			Problem.TestCase(expectation: [Int](), arguments: [4, 4]),
			Problem.TestCase(expectation: [Int](), arguments: [4]),
			Problem.TestCase(expectation: [3, 2], arguments: [2, 4, 1, 4, 3, 2]),
			Problem.TestCase(expectation: [2, 2, 2], arguments: [4, 1, 4, 2, 2, 2]),
			Problem.TestCase(expectation: [3, 2], arguments: [3, 4, 3, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "notAlone",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "val", type: Int.self)
		],
		prompt: "We'll say that an element in an array is \"alone\" if there are values before and after it, and those values are different from it. Return a version of the given array where every instance of the given value which is alone is replaced by whichever value to its left or right is larger.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 3, 3], arguments: [1, 2, 3], 2),
			Problem.TestCase(expectation: [1, 3, 3, 5, 5, 2], arguments: [1, 2, 3, 2, 5, 2], 2),
			Problem.TestCase(expectation: [3, 4], arguments: [3, 4], 3),
			Problem.TestCase(expectation: [3, 3], arguments: [3, 3], 3),
			Problem.TestCase(expectation: [1, 3, 3, 2], arguments: [1, 3, 1, 2], 1),
			Problem.TestCase(expectation: [3], arguments: [3], 3),
			Problem.TestCase(expectation: [Int](), arguments: [Int](), 3),
			Problem.TestCase(expectation: [7, 7, 6], arguments: [7, 1, 6], 1),
			Problem.TestCase(expectation: [1, 1, 1], arguments: [1, 1, 1], 1),
			Problem.TestCase(expectation: [1, 1, 1, 2], arguments: [1, 1, 1, 2], 1)
		],
		eulerMode: false
	),
	Problem(
		title: "zeroFront",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return an array that contains the exact same numbers as the given array, but rearranged so that all the zeros are grouped at the start of the array. The order of the non-zero numbers does not matter. So `[1, 0, 0, 1]` becomes `[0 ,0, 1, 1]`. You may modify and return the given array or make a new array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [0, 0, 1, 1], arguments: [1, 0, 0, 1]),
			Problem.TestCase(expectation: [0, 0, 1, 1, 1], arguments: [0, 1, 1, 0, 1]),
			Problem.TestCase(expectation: [0, 1], arguments: [1, 0]),
			Problem.TestCase(expectation: [0, 1], arguments: [0, 1]),
			Problem.TestCase(expectation: [0, 1, 1, 1], arguments: [1, 1, 1, 0]),
			Problem.TestCase(expectation: [2, 2, 2, 2], arguments: [2, 2, 2, 2]),
			Problem.TestCase(expectation: [0, 0, 0, 1], arguments: [0, 0, 1, 0]),
			Problem.TestCase(expectation: [0, 0, 0, -1, -1], arguments: [-1, 0, 0, -1, 0]),
			Problem.TestCase(expectation: [0, 0, -3, -3], arguments: [0, -3, 0, -3]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [0, 0, 9, 9, 9, 9], arguments: [9, 9, 0, 9, 0, 9])
		],
		eulerMode: false
	),
	Problem(
		title: "withoutTen",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return a version of the given array where all the 10's have been removed. The remaining elements should shift left towards the start of the array as needed, and the empty spaces a the end of the array should be 0. So `[1, 10, 10, 2]` yields `[1, 2, 0, 0]`.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 2, 0, 0], arguments: [1, 10, 10, 2]),
			Problem.TestCase(expectation: [2, 0, 0], arguments: [10, 2, 10]),
			Problem.TestCase(expectation: [1, 99, 0], arguments: [1, 99, 10]),
			Problem.TestCase(expectation: [13, 14, 0, 0], arguments: [10, 13, 10, 14]),
			Problem.TestCase(expectation: [13, 14, 0, 0, 0], arguments: [10, 13, 10, 14, 10]),
			Problem.TestCase(expectation: [3, 0, 0], arguments: [10, 10, 3]),
			Problem.TestCase(expectation: [1], arguments: [1]),
			Problem.TestCase(expectation: [13, 1], arguments: [13, 1]),
			Problem.TestCase(expectation: [0], arguments: [10]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]())
		],
		eulerMode: false
	),
	Problem(
		title: "zeroMax",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return a version of the given array where each zero value in the array is replaced by the largest odd value to the right of the zero in the array. If there is no odd value to the right of the zero, leave the zero as a zero.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [5, 5, 3, 3], arguments: [0, 5, 0, 3]),
			Problem.TestCase(expectation: [3, 4, 3, 3], arguments: [0, 4, 0, 3]),
			Problem.TestCase(expectation: [1, 1, 0], arguments: [0, 1, 0]),
			Problem.TestCase(expectation: [5, 1, 5], arguments: [0, 1, 5]),
			Problem.TestCase(expectation: [0, 2, 0], arguments: [0, 2, 0]),
			Problem.TestCase(expectation: [1], arguments: [1]),
			Problem.TestCase(expectation: [0], arguments: [0]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [7, 3, 4, 3, 0, 2], arguments: [7, 0, 4, 3, 0, 2]),
			Problem.TestCase(expectation: [7, 3, 4, 3, 1, 1], arguments: [7, 0, 4, 3, 0, 1]),
			Problem.TestCase(expectation: [7, 3, 4, 3, 0, 0], arguments: [7, 0, 4, 3, 0, 0]),
			Problem.TestCase(expectation: [7, 7, 1, 7, 7, 7], arguments: [7, 0, 1, 0, 0, 7])
		],
		eulerMode: false
	),
	Problem(
		title: "evenOdd",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return an array that contains the exact same numbers as the given array, but rearranged so that all the even numbers come before all the odd numbers. Other than that, the numbers can be in any order.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [0, 0, 0, 1, 1, 1, 1], arguments: [1, 0, 1, 0, 0, 1, 1]),
			Problem.TestCase(expectation: [2, 3, 3], arguments: [3, 3, 2]),
			Problem.TestCase(expectation: [2, 2, 2], arguments: [2, 2, 2]),
			Problem.TestCase(expectation: [2, 2, 3], arguments: [3, 2, 2]),
			Problem.TestCase(expectation: [0, 0, 1, 1, 1], arguments: [1, 1, 0, 1, 0]),
			Problem.TestCase(expectation: [1], arguments: [1]),
			Problem.TestCase(expectation: [2, 1], arguments: [1, 2]),
			Problem.TestCase(expectation: [2, 1], arguments: [2, 1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]())
		],
		eulerMode: false
	),
	Problem(
		title: "fizzBuzz",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "start", type: Int.self),
			Problem.Parameter(name: "end", type: Int.self)
		],
		prompt: "This is slightly more difficult version of the famous FizzBuzz problem which is sometimes given as a first problem for job interviews. Consider the series of numbers beginning at start and running up to but not including end, so for example start=1 and end=5 gives the series 1, 2, 3, 4. Return a new String array containing the string form of these numbers, except for multiples of 3, use \"Fizz\" instead of the number, for multiples of 5 use \"Buzz\", and for multiples of both 3 and 5 use \"FizzBuzz\". In Swift, String(xxx) will make the String form of an Int. This version is a little more complicated than the usual version since you have to allocate and index into an array instead of just printing, and we vary the start/end instead of just always doing 1...100.",
		solution: nil,
		hint: "https://codingbat.com/doc/practice/fizzbuzz-code.html",
		testCases: [
			Problem.TestCase(expectation: ["1", "2", "Fizz", "4", "Buzz"], arguments: 1, 6),
			Problem.TestCase(expectation: ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7"], arguments: 1, 8),
			Problem.TestCase(expectation: ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz"], arguments: 1, 11),
			Problem.TestCase(expectation: ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"], arguments: 1, 16),
			Problem.TestCase(expectation: ["1", "2", "Fizz"], arguments: 1, 4),
			Problem.TestCase(expectation: ["1"], arguments: 1, 2),
			Problem.TestCase(expectation: ["Buzz", "Fizz", "52", "53", "Fizz", "Buzz"], arguments: 50, 56),
			Problem.TestCase(expectation: ["FizzBuzz", "16"], arguments: 15, 17),
			Problem.TestCase(expectation: ["FizzBuzz", "31", "32", "Fizz", "34", "Buzz"], arguments: 30, 36),
			Problem.TestCase(expectation: ["Buzz", "1001", "Fizz", "1003", "1004", "FizzBuzz"], arguments: 1000, 1006),
			Problem.TestCase(expectation: ["Fizz", "Buzz", "101"], arguments: 99, 102),
			Problem.TestCase(expectation: ["14", "FizzBuzz", "16", "17", "Fizz", "19"], arguments: 14, 20)
		],
		eulerMode: false
	)
]
