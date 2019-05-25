//
//  CodingBatRecursion2Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatRecursion2Problems: [Problem] = [
	Problem(
		title: "groupSum",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "start", type: Int.self),
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "target", type: Int.self)
		],
		prompt: "Given an array of ints, is it possible to choose a group of some of the ints, such that the group sums to the given target? This is a classic backtracking recursion problem. Once you understand the recursive backtracking strategy in this problem, you can use the same pattern for many problems to search a space of choices. Rather than looking at the whole array, our convention is to consider the part of the array starting at index start and continuing to the end of the array. The caller can specify the whole array simply by passing start as 0. No loops are needed -- the recursive calls progress down the array.",
		solution: """
			func groupSum(start: Int, nums: [Int], target: Int) -> Bool {
				// Base case: if there are no numbers left, then there is a
				// solution only if target is 0.
				if start >= nums.count {
					return target == 0
				}
				
				// Key idea: nums[start] is chosen or it is not.
				// Deal with nums[start], letting recursion
				// deal with all the rest of the array.
				
				// Recursive call trying the case that nums[start]
				// is chosen -- subtract it from target in the call.
				if groupSum(start: start + 1, nums: nums, target: target - nums[start]) {
					return true
				}
				
				// Recursive call trying the case that nums[start]
				// is not chosen.
				if groupSum(start: start + 1, nums: nums, target: target) {
					return true
				}
				
				// If neither of the above worked, it's not possible.
				return false
			}
			""",
		hint: "The base case is when `start>=nums.count`. In that case, return true if `target==0`. Otherwise, consider the element at `nums[start]`. The key idea is that there are only 2 possibilities -- `nums[start]` is chosen or it is not. Make one recursive call to see if a solution is possible if `nums[start]` is chosen (subtract `nums[start]` from target in that call). Make another recursive call to see if a solution is possible if `nums[start]` is not chosen. Return true if either of the two recursive calls returns true.",
		testCases: [
			Problem.TestCase(expectation: true, arguments: 0, [2, 4, 8], 10),
			Problem.TestCase(expectation: true, arguments: 0, [2, 4, 8], 14),
			Problem.TestCase(expectation: false, arguments: 0, [2, 4, 8], 9),
			Problem.TestCase(expectation: true, arguments: 0, [2, 4, 8], 8),
			Problem.TestCase(expectation: true, arguments: 1, [2, 4, 8], 8),
			Problem.TestCase(expectation: false, arguments: 1, [2, 4, 8], 2),
			Problem.TestCase(expectation: true, arguments: 0, [1], 1),
			Problem.TestCase(expectation: false, arguments: 0, [9], 1),
			Problem.TestCase(expectation: true, arguments: 1, [9], 0),
			Problem.TestCase(expectation: true, arguments: 0, [Int](), 0),
			Problem.TestCase(expectation: true, arguments: 0, [10, 2, 2, 5], 17),
			Problem.TestCase(expectation: true, arguments: 0, [10, 2, 2, 5], 15),
			Problem.TestCase(expectation: true, arguments: 0, [10, 2, 2, 5], 9)
		],
		eulerMode: false
	),
	Problem(
		title: "groupSum6",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "start", type: Int.self),
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "target", type: Int.self)
		],
		prompt: "Given an array of ints, is it possible to choose a group of some of the ints, beginning at the start index, such that the group sums to the given target? However, with the additional constraint that all 6's must be chosen. (No loops needed.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 0, [5, 6, 2], 8),
			Problem.TestCase(expectation: false, arguments: 0, [5, 6, 2], 9),
			Problem.TestCase(expectation: false, arguments: 0, [5, 6, 2], 7),
			Problem.TestCase(expectation: true, arguments: 0, [1], 1),
			Problem.TestCase(expectation: false, arguments: 0, [9], 1),
			Problem.TestCase(expectation: true, arguments: 0, [Int](), 0),
			Problem.TestCase(expectation: true, arguments: 0, [3, 2, 4, 6], 8),
			Problem.TestCase(expectation: true, arguments: 0, [6, 2, 4, 3], 8),
			Problem.TestCase(expectation: false, arguments: 0, [5, 2, 4, 6], 9),
			Problem.TestCase(expectation: false, arguments: 0, [6, 2, 4, 5], 9),
			Problem.TestCase(expectation: false, arguments: 0, [3, 2, 4, 6], 3),
			Problem.TestCase(expectation: true, arguments: 0, [1, 6, 2, 6, 4], 12),
			Problem.TestCase(expectation: true, arguments: 0, [1, 6, 2, 6, 4], 13),
			Problem.TestCase(expectation: false, arguments: 0, [1, 6, 2, 6, 4], 4),
			Problem.TestCase(expectation: false, arguments: 0, [1, 6, 2, 6, 4], 9),
			Problem.TestCase(expectation: true, arguments: 0, [1, 6, 2, 6, 5], 14),
			Problem.TestCase(expectation: true, arguments: 0, [1, 6, 2, 6, 5], 15),
			Problem.TestCase(expectation: false, arguments: 0, [1, 6, 2, 6, 5], 16)
		],
		eulerMode: false
	),
	Problem(
		title: "groupNoAdj",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "start", type: Int.self),
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "target", type: Int.self)
		],
		prompt: "Given an array of ints, is it possible to choose a group of some of the ints, such that the group sums to the given target with this additional constraint: If a value in the array is chosen to be in the group, the value immediately following it in the array must not be chosen. (No loops needed.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 0, [2, 5, 10, 4], 12),
			Problem.TestCase(expectation: false, arguments: 0, [2, 5, 10, 4], 14),
			Problem.TestCase(expectation: false, arguments: 0, [2, 5, 10, 4], 7),
			Problem.TestCase(expectation: true, arguments: 0, [2, 5, 10, 4, 2], 7),
			Problem.TestCase(expectation: true, arguments: 0, [2, 5, 10, 4], 9),
			Problem.TestCase(expectation: true, arguments: 0, [10, 2, 2, 3, 3], 15),
			Problem.TestCase(expectation: false, arguments: 0, [10, 2, 2, 3, 3], 7),
			Problem.TestCase(expectation: true, arguments: 0, [Int](), 0),
			Problem.TestCase(expectation: true, arguments: 0, [1], 1),
			Problem.TestCase(expectation: false, arguments: 0, [9], 1),
			Problem.TestCase(expectation: true, arguments: 0, [9], 0),
			Problem.TestCase(expectation: true, arguments: 0, [5, 10, 4, 1], 11)
		],
		eulerMode: false
	),
	Problem(
		title: "groupSum5",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "start", type: Int.self),
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "target", type: Int.self)
		],
		prompt: "Given an array of ints, is it possible to choose a group of some of the ints, such that the group sums to the given target with these additional constraints: all multiples of 5 in the array must be included in the group. If the value immediately following a multiple of 5 is 1, it must not be chosen. (No loops needed.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 0, [2, 5, 10, 4], 19),
			Problem.TestCase(expectation: true, arguments: 0, [2, 5, 10, 4], 17),
			Problem.TestCase(expectation: false, arguments: 0, [2, 5, 10, 4], 12),
			Problem.TestCase(expectation: false, arguments: 0, [2, 5, 4, 10], 12),
			Problem.TestCase(expectation: false, arguments: 0, [3, 5, 1], 4),
			Problem.TestCase(expectation: true, arguments: 0, [3, 5, 1], 5),
			Problem.TestCase(expectation: true, arguments: 0, [1, 3, 5], 5),
			Problem.TestCase(expectation: false, arguments: 0, [3, 5, 1], 9),
			Problem.TestCase(expectation: false, arguments: 0, [2, 5, 10, 4], 7),
			Problem.TestCase(expectation: true, arguments: 0, [2, 5, 10, 4], 15),
			Problem.TestCase(expectation: false, arguments: 0, [2, 5, 10, 4], 11),
			Problem.TestCase(expectation: true, arguments: 0, [1], 1),
			Problem.TestCase(expectation: false, arguments: 0, [9], 1),
			Problem.TestCase(expectation: true, arguments: 0, [9], 0),
			Problem.TestCase(expectation: true, arguments: 0, [Int](), 0)
		],
		eulerMode: false
	),
	Problem(
		title: "groupSumClump",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "start", type: Int.self),
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "target", type: Int.self)
		],
		prompt: "Given an array of ints, is it possible to choose a group of some of the ints, such that the group sums to the given target, with this additional constraint: if there are numbers in the array that are adjacent and the identical value, they must either all be chosen, or none of them chosen. For example, with the array [1, 2, 2, 2, 5, 2], either all three 2's in the middle must be chosen or not, all as a group. (one loop can be used to find the extent of the identical values).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 0, [2, 4, 8], 10),
			Problem.TestCase(expectation: true, arguments: 0, [1, 2, 4, 8, 1], 14),
			Problem.TestCase(expectation: false, arguments: 0, [2, 4, 4, 8], 14),
			Problem.TestCase(expectation: true, arguments: 0, [8, 2, 2, 1], 9),
			Problem.TestCase(expectation: false, arguments: 0, [8, 2, 2, 1], 11),
			Problem.TestCase(expectation: true, arguments: 0, [1], 1),
			Problem.TestCase(expectation: false, arguments: 0, [9], 1)
		],
		eulerMode: false
	),
	Problem(
		title: "splitArray",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, is it possible to divide the ints into two groups, so that the sums of the two groups are the same. Every int must be in one group or the other. Write a recursive helper method that takes whatever arguments you like, and make the initial call to your recursive helper from splitArray(nums:). (No loops needed.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [2, 2]),
			Problem.TestCase(expectation: false, arguments: [2, 3]),
			Problem.TestCase(expectation: true, arguments: [5, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [5, 2, 2]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 1, 1, 1, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1, 1, 1]),
			Problem.TestCase(expectation: true, arguments: [Int]()),
			Problem.TestCase(expectation: false, arguments: [1]),
			Problem.TestCase(expectation: false, arguments: [3, 5]),
			Problem.TestCase(expectation: true, arguments: [5, 3, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 2, 10, 10, 1, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 2, 10, 10, 1, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3, 10, 10, 1, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "splitOdd10",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, is it possible to divide the ints into two groups, so that the sum of one group is a multiple of 10, and the sum of the other group is odd. Every int must be in one group or the other. Write a recursive helper method that takes whatever arguments you like, and make the initial call to your recursive helper from splitOdd10(nums:). (No loops needed.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [5, 5, 5]),
			Problem.TestCase(expectation: false, arguments: [5, 5, 6]),
			Problem.TestCase(expectation: true, arguments: [5, 5, 6, 1]),
			Problem.TestCase(expectation: true, arguments: [6, 5, 5, 1]),
			Problem.TestCase(expectation: true, arguments: [6, 5, 5, 1, 10]),
			Problem.TestCase(expectation: false, arguments: [6, 5, 5, 5, 1]),
			Problem.TestCase(expectation: true, arguments: [1]),
			Problem.TestCase(expectation: false, arguments: [Int]()),
			Problem.TestCase(expectation: true, arguments: [10, 7, 5, 5]),
			Problem.TestCase(expectation: false, arguments: [10, 0, 5, 5]),
			Problem.TestCase(expectation: true, arguments: [10, 7, 5, 5, 2]),
			Problem.TestCase(expectation: false, arguments: [10, 7, 5, 5, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "split53",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, is it possible to divide the ints into two groups, so that the sum of the two groups is the same, with these constraints: all the values that are multiple of 5 must be in one group, and all the values that are a multiple of 3 (and not a multiple of 5) must be in the other. (No loops needed.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1]),
			Problem.TestCase(expectation: true, arguments: [2, 4, 2]),
			Problem.TestCase(expectation: false, arguments: [2, 2, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [3, 3, 5, 1]),
			Problem.TestCase(expectation: false, arguments: [3, 5, 8]),
			Problem.TestCase(expectation: true, arguments: [2, 4, 6]),
			Problem.TestCase(expectation: true, arguments: [3, 5, 6, 10, 3, 3])
		],
		eulerMode: false
	)
]
