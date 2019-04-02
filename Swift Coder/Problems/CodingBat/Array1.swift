//
//  CodingBatArray1Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatArray1Problems: [Problem] = [
	Problem(
		title: "firstLast6",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if 6 appears as either the first or last element in the array. The array will be length 1 or more.",
		solution: nil,
		hint: "The first element is nums[0] and the last element is nums[nums.count - 1]. Check if either of those is == 6.",
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 2, 6]),
			Problem.TestCase(expectation: true, arguments: [6, 1, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [13, 6, 1, 2, 3]),
			Problem.TestCase(expectation: true, arguments: [13, 6, 1, 2, 6]),
			Problem.TestCase(expectation: false, arguments: [3, 2, 1]),
			Problem.TestCase(expectation: false, arguments: [3, 6, 1]),
			Problem.TestCase(expectation: true, arguments: [3, 6]),
			Problem.TestCase(expectation: true, arguments: [6]),
			Problem.TestCase(expectation: false, arguments: [3]),
			Problem.TestCase(expectation: true, arguments: [5, 6]),
			Problem.TestCase(expectation: false, arguments: [5, 5]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3, 4, 6]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4])
		],
		eulerMode: false
	),
	Problem(title: "sameFirstLast",
			returnType: Bool.self,
			parameters: [
				Problem.Parameter(name: "nums", type: [Int].self)],
			prompt: "Given an array of Ints, return true if the array is length 1 or more, and the first element and the last element are equal.",
			hint: "The length is nums.count, the first element is nums[0] and the last element is nums[nums.count - 1]",
			testCases: [
				Problem.TestCase(expectation: false, arguments: [1, 2, 3]),
				Problem.TestCase(expectation: true, arguments: [1, 2, 3, 1]),
				Problem.TestCase(expectation: true, arguments: [1, 2, 1]),
				
				]),
	Problem(title: "makePi",
			returnType: [Int].self,
			parameters: [Problem.Parameter](),
			prompt: "Return an Int array length 3 containing the first 3 digits of pi, [3, 1, 4].",
			testCases: [
				Problem.TestCase(expectation: [3, 1, 4])
		]),
	Problem(
		title: "commonEnd",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: [Int].self),
			Problem.Parameter(name: "b", type: [Int].self)
		],
		prompt: "Given 2 arrays of ints, a and b, return true if they have the same first element or they have the same last element. Both arrays will be length 1 or more.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 2, 3], [7, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3], [7, 3, 2]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3], [1, 3]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3], [1]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3], [2])
		],
		eulerMode: false
	),
	Problem(
		title: "sum3",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints length 3, return the sum of all the elements.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 6, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: 18, arguments: [5, 11, 2]),
			Problem.TestCase(expectation: 7, arguments: [7, 0, 0]),
			Problem.TestCase(expectation: 4, arguments: [1, 2, 1]),
			Problem.TestCase(expectation: 3, arguments: [1, 1, 1]),
			Problem.TestCase(expectation: 11, arguments: [2, 7, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "rotateLeft3",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints length 3, return an array with the elements \"rotated left\" so [1, 2, 3] yields [2, 3, 1].",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [2, 3, 1], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [11, 9, 5], arguments: [5, 11, 9]),
			Problem.TestCase(expectation: [0, 0, 7], arguments: [7, 0, 0]),
			Problem.TestCase(expectation: [2, 1, 1], arguments: [1, 2, 1]),
			Problem.TestCase(expectation: [0, 1, 0], arguments: [0, 0, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "reverse3",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints length 3, return a new array with the elements in reverse order, so [1, 2, 3] becomes [3, 2, 1].",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [3, 2, 1], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [9, 11, 5], arguments: [5, 11, 9]),
			Problem.TestCase(expectation: [0, 0, 7], arguments: [7, 0, 0]),
			Problem.TestCase(expectation: [2, 1, 2], arguments: [2, 1, 2]),
			Problem.TestCase(expectation: [1, 2, 1], arguments: [1, 2, 1]),
			Problem.TestCase(expectation: [3, 11, 2], arguments: [2, 11, 3]),
			Problem.TestCase(expectation: [5, 6, 0], arguments: [0, 6, 5]),
			Problem.TestCase(expectation: [3, 2, 7], arguments: [7, 2, 3])
		],
		eulerMode: false
	),
	Problem(
		title: "maxEnd3",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints length 3, figure out which is larger, the first or last element in the array, and set all the other elements to be that value. Return the changed array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [3, 3, 3], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [11, 11, 11], arguments: [11, 5, 9]),
			Problem.TestCase(expectation: [3, 3, 3], arguments: [2, 11, 3]),
			Problem.TestCase(expectation: [11, 11, 11], arguments: [11, 3, 3]),
			Problem.TestCase(expectation: [11, 11, 11], arguments: [3, 11, 11]),
			Problem.TestCase(expectation: [2, 2, 2], arguments: [2, 2, 2]),
			Problem.TestCase(expectation: [2, 2, 2], arguments: [2, 11, 2]),
			Problem.TestCase(expectation: [1, 1, 1], arguments: [0, 0, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "sum2",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return the sum of the first 2 elements in the array. If the array length is less than 2, just sum up the elements that exist, returning 0 if the array is length 0.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 3, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: 2, arguments: [1, 1]),
			Problem.TestCase(expectation: 2, arguments: [1, 1, 1, 1]),
			Problem.TestCase(expectation: 3, arguments: [1, 2]),
			Problem.TestCase(expectation: 1, arguments: [1]),
			Problem.TestCase(expectation: 0, arguments: [Int]()),
			Problem.TestCase(expectation: 9, arguments: [4, 5, 6]),
			Problem.TestCase(expectation: 4, arguments: [4])
		],
		eulerMode: false
	),
	Problem(
		title: "middleWay",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "a", type: [Int].self),
			Problem.Parameter(name: "b", type: [Int].self)
		],
		prompt: "Given 2 int arrays, a and b, each length 3, return a new array length 2 containing their middle elements.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [2, 5], arguments: [1, 2, 3], [4, 5, 6]),
			Problem.TestCase(expectation: [7, 8], arguments: [7, 7, 7], [3, 8, 0]),
			Problem.TestCase(expectation: [2, 4], arguments: [5, 2, 9], [1, 4, 5]),
			Problem.TestCase(expectation: [9, 8], arguments: [1, 9, 7], [4, 8, 8]),
			Problem.TestCase(expectation: [2, 1], arguments: [1, 2, 3], [3, 1, 4]),
			Problem.TestCase(expectation: [2, 1], arguments: [1, 2, 3], [4, 1, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "makeEnds",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return a new array length 2 containing the first and last elements from the original array. The original array will be length 1 or more.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 3], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [1, 4], arguments: [1, 2, 3, 4]),
			Problem.TestCase(expectation: [7, 2], arguments: [7, 4, 6, 2]),
			Problem.TestCase(expectation: [1, 3], arguments: [1, 2, 2, 2, 2, 2, 2, 3]),
			Problem.TestCase(expectation: [7, 4], arguments: [7, 4]),
			Problem.TestCase(expectation: [7, 7], arguments: [7]),
			Problem.TestCase(expectation: [5, 9], arguments: [5, 2, 9]),
			Problem.TestCase(expectation: [2, 1], arguments: [2, 3, 4, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "has23",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an int array length 2, return true if it contains a 2 or a 3.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [2, 5]),
			Problem.TestCase(expectation: true, arguments: [4, 3]),
			Problem.TestCase(expectation: false, arguments: [4, 5]),
			Problem.TestCase(expectation: true, arguments: [2, 2]),
			Problem.TestCase(expectation: true, arguments: [3, 2]),
			Problem.TestCase(expectation: true, arguments: [3, 3]),
			Problem.TestCase(expectation: false, arguments: [7, 7]),
			Problem.TestCase(expectation: true, arguments: [3, 9]),
			Problem.TestCase(expectation: false, arguments: [9, 5])
		],
		eulerMode: false
	),
	Problem(
		title: "no23",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an int array length 2, return true if it does not contain a 2 or 3.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [4, 5]),
			Problem.TestCase(expectation: false, arguments: [4, 2]),
			Problem.TestCase(expectation: false, arguments: [3, 5]),
			Problem.TestCase(expectation: true, arguments: [1, 9]),
			Problem.TestCase(expectation: false, arguments: [2, 9]),
			Problem.TestCase(expectation: false, arguments: [1, 3]),
			Problem.TestCase(expectation: true, arguments: [1, 1]),
			Problem.TestCase(expectation: false, arguments: [2, 2]),
			Problem.TestCase(expectation: false, arguments: [3, 3]),
			Problem.TestCase(expectation: true, arguments: [7, 8]),
			Problem.TestCase(expectation: true, arguments: [8, 7])
		],
		eulerMode: false
	),
	Problem(
		title: "makeLast",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an int array, return a new array with double the length where its last element is the same as the original array, and all the other elements are 0. The original array will be length 1 or more.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [0, 0, 0, 0, 0, 6], arguments: [4, 5, 6]),
			Problem.TestCase(expectation: [0, 0, 0, 2], arguments: [1, 2]),
			Problem.TestCase(expectation: [0, 3], arguments: [3]),
			Problem.TestCase(expectation: [0, 0], arguments: [0]),
			Problem.TestCase(expectation: [0, 0, 0, 0, 0, 7], arguments: [7, 7, 7]),
			Problem.TestCase(expectation: [0, 0, 0, 0, 0, 4], arguments: [3, 1, 4]),
			Problem.TestCase(expectation: [0, 0, 0, 0, 0, 0, 0, 4], arguments: [1, 2, 3, 4]),
			Problem.TestCase(expectation: [0, 0, 0, 0, 0, 0, 0, 0], arguments: [1, 2, 3, 0]),
			Problem.TestCase(expectation: [0, 0, 0, 4], arguments: [2, 4])
		],
		eulerMode: false
	),
	Problem(
		title: "double23",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an int array, return true if the array contains 2 twice, or 3 twice. The array will be length 0, 1, or 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [2, 2]),
			Problem.TestCase(expectation: true, arguments: [3, 3]),
			Problem.TestCase(expectation: false, arguments: [2, 3]),
			Problem.TestCase(expectation: false, arguments: [3, 2]),
			Problem.TestCase(expectation: false, arguments: [4, 5]),
			Problem.TestCase(expectation: false, arguments: [2]),
			Problem.TestCase(expectation: false, arguments: [3]),
			Problem.TestCase(expectation: false, arguments: [Int]()),
			Problem.TestCase(expectation: false, arguments: [3, 4])
		],
		eulerMode: false
	),
	Problem(
		title: "fix23",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an int array length 3, if there is a 2 in the array immediately followed by a 3, set the 3 element to 0. Return the changed array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 2, 0], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [2, 0, 5], arguments: [2, 3, 5]),
			Problem.TestCase(expectation: [1, 2, 1], arguments: [1, 2, 1]),
			Problem.TestCase(expectation: [3, 2, 1], arguments: [3, 2, 1]),
			Problem.TestCase(expectation: [2, 2, 0], arguments: [2, 2, 3]),
			Problem.TestCase(expectation: [2, 0, 3], arguments: [2, 3, 3])
		],
		eulerMode: false
	),
	Problem(
		title: "start1",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: [Int].self),
			Problem.Parameter(name: "b", type: [Int].self)
		],
		prompt: "Start with 2 int arrays, a and b, of any length. Return how many of the arrays have 1 as their first element.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 2, arguments: [1, 2, 3], [1, 3]),
			Problem.TestCase(expectation: 1, arguments: [7, 2, 3], [1]),
			Problem.TestCase(expectation: 1, arguments: [1, 2], [Int]()),
			Problem.TestCase(expectation: 1, arguments: [Int](), [1, 2]),
			Problem.TestCase(expectation: 0, arguments: [7], [Int]()),
			Problem.TestCase(expectation: 1, arguments: [7], [1]),
			Problem.TestCase(expectation: 2, arguments: [1], [1]),
			Problem.TestCase(expectation: 0, arguments: [7], [8]),
			Problem.TestCase(expectation: 0, arguments: [Int](), [Int]()),
			Problem.TestCase(expectation: 2, arguments: [1, 3], [1])
		],
		eulerMode: false
	),
	Problem(
		title: "biggerTwo",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "a", type: [Int].self),
			Problem.Parameter(name: "b", type: [Int].self)
		],
		prompt: "Start with 2 int arrays, a and b, each length 2. Consider the sum of the values in each array. Return the array which has the largest sum. In event of a tie, return a.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [3, 4], arguments: [1, 2], [3, 4]),
			Problem.TestCase(expectation: [3, 4], arguments: [3, 4], [1, 2]),
			Problem.TestCase(expectation: [1, 2], arguments: [1, 1], [1, 2]),
			Problem.TestCase(expectation: [2, 1], arguments: [2, 1], [1, 1]),
			Problem.TestCase(expectation: [2, 2], arguments: [2, 2], [1, 3]),
			Problem.TestCase(expectation: [1, 3], arguments: [1, 3], [2, 2]),
			Problem.TestCase(expectation: [6, 7], arguments: [6, 7], [3, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "makeMiddle",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints of even length, return a new array length 2 containing the middle two elements from the original array. The original array will be length 2 or more.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [2, 3], arguments: [1, 2, 3, 4]),
			Problem.TestCase(expectation: [2, 3], arguments: [7, 1, 2, 3, 4, 9]),
			Problem.TestCase(expectation: [1, 2], arguments: [1, 2]),
			Problem.TestCase(expectation: [2, 4], arguments: [5, 2, 4, 7]),
			Problem.TestCase(expectation: [4, 3], arguments: [9, 0, 4, 3, 9, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "plusTwo",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "a", type: [Int].self),
			Problem.Parameter(name: "b", type: [Int].self)
		],
		prompt: "Given 2 int arrays, each length 2, return a new array length 4 containing all their elements.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 2, 3, 4], arguments: [1, 2], [3, 4]),
			Problem.TestCase(expectation: [4, 4, 2, 2], arguments: [4, 4], [2, 2]),
			Problem.TestCase(expectation: [9, 2, 3, 4], arguments: [9, 2], [3, 4])
		],
		eulerMode: false
	),
	Problem(
		title: "swapEnds",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, swap the first and last elements in the array. Return the modified array. The array length will be at least 1.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [4, 2, 3, 1], arguments: [1, 2, 3, 4]),
			Problem.TestCase(expectation: [3, 2, 1], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [5, 6, 7, 9, 8], arguments: [8, 6, 7, 9, 5]),
			Problem.TestCase(expectation: [9, 1, 4, 1, 5, 3], arguments: [3, 1, 4, 1, 5, 9]),
			Problem.TestCase(expectation: [2, 1], arguments: [1, 2]),
			Problem.TestCase(expectation: [1], arguments: [1])
		],
		eulerMode: false
	),
	Problem(
		title: "midThree",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints of odd length, return a new array length 3 containing the elements from the middle of the array. The array length will be at least 3.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [2, 3, 4], arguments: [1, 2, 3, 4, 5]),
			Problem.TestCase(expectation: [7, 5, 3], arguments: [8, 6, 7, 5, 3, 0, 9]),
			Problem.TestCase(expectation: [1, 2, 3], arguments: [1, 2, 3])
		],
		eulerMode: false
	),
	Problem(
		title: "maxTriple",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints of odd length, look at the first, last, and middle values in the array and return the largest. The array length will be a least 1.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 3, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: 5, arguments: [1, 5, 3]),
			Problem.TestCase(expectation: 5, arguments: [5, 2, 3]),
			Problem.TestCase(expectation: 3, arguments: [1, 2, 3, 1, 1]),
			Problem.TestCase(expectation: 5, arguments: [1, 7, 3, 1, 5]),
			Problem.TestCase(expectation: 5, arguments: [5, 1, 3, 7, 1]),
			Problem.TestCase(expectation: 5, arguments: [5, 1, 7, 3, 7, 8, 1]),
			Problem.TestCase(expectation: 9, arguments: [5, 1, 7, 9, 7, 8, 1]),
			Problem.TestCase(expectation: 9, arguments: [5, 1, 7, 3, 7, 8, 9]),
			Problem.TestCase(expectation: 5, arguments: [2, 2, 5, 1, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "frontPiece",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an int array of any length, return a new array of its first 2 elements. If the array is smaller than length 2, use whatever elements are present.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 2], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [1, 2], arguments: [1, 2]),
			Problem.TestCase(expectation: [1], arguments: [1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [6, 5], arguments: [6, 5, 0]),
			Problem.TestCase(expectation: [6, 5], arguments: [6, 5]),
			Problem.TestCase(expectation: [3, 1], arguments: [3, 1, 4, 1, 5]),
			Problem.TestCase(expectation: [6], arguments: [6])
		],
		eulerMode: false
	),
	Problem(
		title: "unlucky1",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "We'll say that a 1 immediately followed by a 3 in an array is an \"unlucky\" 1. Return true if the given array contains an unlucky 1 in the first 2 or last 2 positions in the array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 3, 4, 5]),
			Problem.TestCase(expectation: true, arguments: [2, 1, 3, 4, 5]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 3, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [3, 3, 3]),
			Problem.TestCase(expectation: true, arguments: [1, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 4]),
			Problem.TestCase(expectation: false, arguments: [1]),
			Problem.TestCase(expectation: false, arguments: [Int]()),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1, 3, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 3, 1, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 1, 1, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 4, 1, 5]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [2, 3, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [2, 3, 1, 3]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3, 4, 1, 3])
		],
		eulerMode: false
	),
	Problem(
		title: "make2",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "a", type: [Int].self),
			Problem.Parameter(name: "b", type: [Int].self)
		],
		prompt: "Given 2 int arrays, a and b, return a new array length 2 containing, as much as will fit, the elements from a followed by the elements from b. The arrays may be any length, including 0, but there will be 2 or more elements available between the 2 arrays.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [4, 5], arguments: [4, 5], [1, 2, 3]),
			Problem.TestCase(expectation: [4, 1], arguments: [4], [1, 2, 3]),
			Problem.TestCase(expectation: [1, 2], arguments: [Int](), [1, 2]),
			Problem.TestCase(expectation: [1, 2], arguments: [1, 2], [Int]()),
			Problem.TestCase(expectation: [3, 1], arguments: [3], [1, 2, 3]),
			Problem.TestCase(expectation: [3, 1], arguments: [3], [1]),
			Problem.TestCase(expectation: [3, 1], arguments: [3, 1, 4], [Int]()),
			Problem.TestCase(expectation: [1, 1], arguments: [1], [1]),
			Problem.TestCase(expectation: [1, 2], arguments: [1, 2, 3], [7, 8]),
			Problem.TestCase(expectation: [7, 8], arguments: [7, 8], [1, 2, 3]),
			Problem.TestCase(expectation: [7, 1], arguments: [7], [1, 2, 3]),
			Problem.TestCase(expectation: [5, 4], arguments: [5, 4], [2, 3, 7])
		],
		eulerMode: false
	),
	Problem(
		title: "front11",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "a", type: [Int].self),
			Problem.Parameter(name: "b", type: [Int].self)
		],
		prompt: "Given 2 int arrays, a and b, of any length, return a new array with the first element of each array. If either array is length 0, ignore that array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 7], arguments: [1, 2, 3], [7, 9, 8]),
			Problem.TestCase(expectation: [1, 2], arguments: [1], [2]),
			Problem.TestCase(expectation: [1], arguments: [1, 7], [Int]()),
			Problem.TestCase(expectation: [2], arguments: [Int](), [2, 8]),
			Problem.TestCase(expectation: [Int](), arguments: [Int](), [Int]()),
			Problem.TestCase(expectation: [3, 1], arguments: [3], [1, 4, 1, 9]),
			Problem.TestCase(expectation: [1], arguments: [1, 4, 1, 9], [Int]())
		],
		eulerMode: false
	)
	
]
