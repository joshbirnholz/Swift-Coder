//
//  CodingBatLogic2Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatLogic2Problems: [Problem] = [
	Problem(title: "makeBricks",
			returnType: Bool.self,
			parameters: [
				Problem.Parameter(name: "small", type: Int.self),
				Problem.Parameter(name: "big", type: Int.self),
				Problem.Parameter(name: "goal", type: Int.self)
		],
			prompt: "We want to make a row of bricks that is `goal` inches long. We have a number of small bricks (1 inch each) and big bricks (5 inches each). Return true if it is possible to make the goal by choosing from the given bricks. This is a little harder than it looks and can be done without any loops.",
			hint: "https://www.youtube.com/watch?v=86PSF-n43-g",
			testCases: [
				Problem.TestCase(expectation: true, arguments: 3, 1, 8),
				Problem.TestCase(expectation: false, arguments: 3, 1, 9),
				Problem.TestCase(expectation: true, arguments: 3, 2, 10),
				Problem.TestCase(expectation: true, arguments: 3, 2, 8),
				Problem.TestCase(expectation: false, arguments: 3, 2, 9),
				Problem.TestCase(expectation: true, arguments: 6, 1, 11),
				Problem.TestCase(expectation: false, arguments: 6, 0, 11),
				Problem.TestCase(expectation: true, arguments: 1, 4, 11),
				Problem.TestCase(expectation: true, arguments: 0, 3, 10),
				Problem.TestCase(expectation: false, arguments: 1, 4, 12),
				Problem.TestCase(expectation: true, arguments: 3, 1, 7),
				Problem.TestCase(expectation: false, arguments: 1, 1, 7),
				Problem.TestCase(expectation: true, arguments: 2, 1, 7),
				Problem.TestCase(expectation: true, arguments: 7, 1, 11),
				Problem.TestCase(expectation: true, arguments: 7, 1, 8),
				Problem.TestCase(expectation: false, arguments: 7, 1, 13),
				Problem.TestCase(expectation: true, arguments: 43, 1, 46),
				Problem.TestCase(expectation: false, arguments: 40, 1, 46),
				Problem.TestCase(expectation: true, arguments: 40, 2, 47),
				Problem.TestCase(expectation: true, arguments: 40, 2, 50),
				Problem.TestCase(expectation: false, arguments: 40, 2, 52),
				Problem.TestCase(expectation: false, arguments: 22, 2, 33),
				Problem.TestCase(expectation: true, arguments: 0, 2, 10),
				Problem.TestCase(expectation: true, arguments: 1000000, 1000, 1000100),
				Problem.TestCase(expectation: false, arguments: 2, 1000000, 100003),
				Problem.TestCase(expectation: true, arguments: 20, 0, 19),
				Problem.TestCase(expectation: false, arguments: 20, 0, 21),
				Problem.TestCase(expectation: false, arguments: 20, 4, 51),
				Problem.TestCase(expectation: true, arguments: 20, 4, 39),
				]),
	Problem(
		title: "loneSum",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "Given 3 int values, `a` `b` `c`, return their sum. However, if one of the values is the same as another of the values, it does not count towards the sum.",
		solution: """
func loneSum(a: Int, b: Int, c: Int) -> Int {
	var sum = 0;
	if a != b && a != c {
		sum += a
	}
	if b != a && b != c {
		sum += b
	}
	if c != a && c != b {
		sum += c
	}
	return sum
	
	// Solution notes: this code is a pretty direct translation
	// of the problem statement.
	// For each of a/b/c, check that it is different from
	// the other two before adding it to the sum variable
}
""",
		hidesSolutionUntilSolved: true,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 6, arguments: 1, 2, 3),
			Problem.TestCase(expectation: 2, arguments: 3, 2, 3),
			Problem.TestCase(expectation: 0, arguments: 3, 3, 3),
			Problem.TestCase(expectation: 9, arguments: 9, 2, 2),
			Problem.TestCase(expectation: 9, arguments: 2, 2, 9),
			Problem.TestCase(expectation: 9, arguments: 2, 9, 2),
			Problem.TestCase(expectation: 14, arguments: 2, 9, 3),
			Problem.TestCase(expectation: 9, arguments: 4, 2, 3),
			Problem.TestCase(expectation: 3, arguments: 1, 3, 1)
		],
		eulerMode: false
	),
	Problem(
		title: "luckySum",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "Given 3 int values, `a` `b` `c`, return their sum. However, if one of the values is 13 then it does not count towards the sum and values to its right do not count. So for example, if `b` is 13, then both `b` and `c` do not count.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 6, arguments: 1, 2, 3),
			Problem.TestCase(expectation: 3, arguments: 1, 2, 13),
			Problem.TestCase(expectation: 1, arguments: 1, 13, 3),
			Problem.TestCase(expectation: 1, arguments: 1, 13, 13),
			Problem.TestCase(expectation: 13, arguments: 6, 5, 2),
			Problem.TestCase(expectation: 0, arguments: 13, 2, 3),
			Problem.TestCase(expectation: 0, arguments: 13, 2, 13),
			Problem.TestCase(expectation: 0, arguments: 13, 13, 2),
			Problem.TestCase(expectation: 13, arguments: 9, 4, 13),
			Problem.TestCase(expectation: 8, arguments: 8, 13, 2),
			Problem.TestCase(expectation: 10, arguments: 7, 2, 1),
			Problem.TestCase(expectation: 6, arguments: 3, 3, 13)
		],
		eulerMode: false
	),
	Problem(
		title: "noTeenSum",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "Given 3 int values, `a` `b` `c`, return their sum. However, if any of the values is a teen -- in the range 13...19 -- then that value counts as 0, except 15 and 16 do not count as a teens. Write a separate helper \"`func fixTeen(n: Int) -> Int {`\" that takes in an int value and returns that value fixed for the teen rule. In this way, you avoid repeating the teen code 3 times (i.e. \"decomposition\"). Define the helper below and at the same indent level as the main `noTeenSum` function.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 6, arguments: 1, 2, 3),
			Problem.TestCase(expectation: 3, arguments: 2, 13, 1),
			Problem.TestCase(expectation: 3, arguments: 2, 1, 14),
			Problem.TestCase(expectation: 18, arguments: 2, 1, 15),
			Problem.TestCase(expectation: 19, arguments: 2, 1, 16),
			Problem.TestCase(expectation: 3, arguments: 2, 1, 17),
			Problem.TestCase(expectation: 3, arguments: 17, 1, 2),
			Problem.TestCase(expectation: 19, arguments: 2, 15, 2),
			Problem.TestCase(expectation: 16, arguments: 16, 17, 18),
			Problem.TestCase(expectation: 0, arguments: 17, 18, 19),
			Problem.TestCase(expectation: 32, arguments: 15, 16, 1),
			Problem.TestCase(expectation: 30, arguments: 15, 15, 19),
			Problem.TestCase(expectation: 31, arguments: 15, 19, 16),
			Problem.TestCase(expectation: 5, arguments: 5, 17, 18),
			Problem.TestCase(expectation: 16, arguments: 17, 18, 16),
			Problem.TestCase(expectation: 0, arguments: 17, 19, 18)
		],
		eulerMode: false
	),
	Problem(
		title: "roundSum",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "For this problem, we'll round an int value up to the next multiple of 10 if its rightmost digit is 5 or more, so 15 rounds up to 20. Alternately, round down to the previous multiple of 10 if its rightmost digit is less than 5, so 12 rounds down to 10. Given 3 ints, `a` `b` `c`, return the sum of their rounded values. To avoid code repetition, write a separate helper \"`func round10(num: Int) -> Int {`\" and call it 3 times. Write the helper entirely below and at the same indent level as the `roundSum` function.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 60, arguments: 16, 17, 18),
			Problem.TestCase(expectation: 30, arguments: 12, 13, 14),
			Problem.TestCase(expectation: 10, arguments: 6, 4, 4),
			Problem.TestCase(expectation: 20, arguments: 4, 6, 5),
			Problem.TestCase(expectation: 10, arguments: 4, 4, 6),
			Problem.TestCase(expectation: 10, arguments: 9, 4, 4),
			Problem.TestCase(expectation: 0, arguments: 0, 0, 1),
			Problem.TestCase(expectation: 10, arguments: 0, 9, 0),
			Problem.TestCase(expectation: 40, arguments: 10, 10, 19),
			Problem.TestCase(expectation: 90, arguments: 20, 30, 40),
			Problem.TestCase(expectation: 100, arguments: 45, 21, 30),
			Problem.TestCase(expectation: 60, arguments: 23, 11, 26),
			Problem.TestCase(expectation: 70, arguments: 23, 24, 25),
			Problem.TestCase(expectation: 80, arguments: 25, 24, 25),
			Problem.TestCase(expectation: 70, arguments: 23, 24, 29),
			Problem.TestCase(expectation: 70, arguments: 11, 24, 36),
			Problem.TestCase(expectation: 90, arguments: 24, 36, 32),
			Problem.TestCase(expectation: 50, arguments: 14, 12, 26),
			Problem.TestCase(expectation: 40, arguments: 12, 10, 24)
		],
		eulerMode: false
	),
	Problem(
		title: "closeFar",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "Given three ints, `a` `b` `c`, return true if one of `b` or `c` is \"close\" (differing from a by at most 1), while the other is \"far\", differing from both other values by 2 or more. Note: `abs(num)` computes the absolute value of a number.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 1, 2, 10),
			Problem.TestCase(expectation: false, arguments: 1, 2, 3),
			Problem.TestCase(expectation: true, arguments: 4, 1, 3),
			Problem.TestCase(expectation: false, arguments: 4, 5, 3),
			Problem.TestCase(expectation: false, arguments: 4, 3, 5),
			Problem.TestCase(expectation: true, arguments: -1, 10, 0),
			Problem.TestCase(expectation: true, arguments: 0, -1, 10),
			Problem.TestCase(expectation: true, arguments: 10, 10, 8),
			Problem.TestCase(expectation: false, arguments: 10, 8, 9),
			Problem.TestCase(expectation: false, arguments: 8, 9, 10),
			Problem.TestCase(expectation: false, arguments: 8, 9, 7),
			Problem.TestCase(expectation: true, arguments: 8, 6, 9)
		],
		eulerMode: false
	),
	Problem(title: "blackJack",
			returnType: Int.self,
			parameters: [
				Problem.Parameter(name: "a", type: Int.self),
				Problem.Parameter(name: "b", type: Int.self)
		], prompt: "Given 2 Int values greater than 0, return whichever value is nearest to 21 without going over. Return 0 if they both go over.",
		   solution: """
func blackJack(a: Int, b: Int) -> Int {
	// The value of a/b, or 0 if over 21
	var aVal = a
	if aVal > 21 {
		aVal = 0
	}
	var bVal = b
	if bVal > 21 {
		bVal = 0
	}
	
	// Now it works to just return whichever is larger.
	if aVal > bVal {
		return aVal
	} else {
		return bVal
	}
	
	// You can write a very short version of this same strategy
	// using the "ternary operator" ?: and max()
}
""",
		   hidesSolutionUntilSolved: true,
		   testCases: [
			Problem.TestCase(expectation: 21, arguments: 19, 21),
			Problem.TestCase(expectation: 21, arguments: 21, 19),
			Problem.TestCase(expectation: 19, arguments: 19, 22),
			Problem.TestCase(expectation: 19, arguments: 22, 19),
			Problem.TestCase(expectation: 0, arguments: 22, 50),
			Problem.TestCase(expectation: 0, arguments: 22, 22),
			Problem.TestCase(expectation: 1, arguments: 33, 1),
			Problem.TestCase(expectation: 2, arguments: 1, 2),
			Problem.TestCase(expectation: 0, arguments: 34, 33),
			Problem.TestCase(expectation: 19, arguments: 17, 19),
			Problem.TestCase(expectation: 18, arguments: 18, 17),
			Problem.TestCase(expectation: 16, arguments: 16, 23),
			Problem.TestCase(expectation: 4, arguments: 3, 4),
			Problem.TestCase(expectation: 3, arguments: 3, 2),
			Problem.TestCase(expectation: 21, arguments: 21, 20),
			]),
	Problem(
		title: "evenlySpaced",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "Given three ints, `a` `b` `c`, one of them is small, one is medium and one is large. Return true if the three values are evenly spaced, so the difference between small and medium is the same as the difference between medium and large.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 2, 4, 6),
			Problem.TestCase(expectation: true, arguments: 4, 6, 2),
			Problem.TestCase(expectation: false, arguments: 4, 6, 3),
			Problem.TestCase(expectation: true, arguments: 6, 2, 4),
			Problem.TestCase(expectation: false, arguments: 6, 2, 8),
			Problem.TestCase(expectation: true, arguments: 2, 2, 2),
			Problem.TestCase(expectation: false, arguments: 2, 2, 3),
			Problem.TestCase(expectation: true, arguments: 9, 10, 11),
			Problem.TestCase(expectation: true, arguments: 10, 9, 11),
			Problem.TestCase(expectation: false, arguments: 10, 9, 9),
			Problem.TestCase(expectation: false, arguments: 2, 4, 4),
			Problem.TestCase(expectation: false, arguments: 2, 2, 4),
			Problem.TestCase(expectation: false, arguments: 3, 6, 12),
			Problem.TestCase(expectation: false, arguments: 12, 3, 6)
		],
		eulerMode: false
	),
	Problem(
		title: "makeChocolate",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "small", type: Int.self),
			Problem.Parameter(name: "big", type: Int.self),
			Problem.Parameter(name: "goal", type: Int.self)
		],
		prompt: "We want make a package of goal kilos of chocolate. We have small bars (1 kilo each) and big bars (5 kilos each). Return the number of small bars to use, assuming we always use big bars before small bars. Return -1 if it can't be done.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 4, arguments: 4, 1, 9),
			Problem.TestCase(expectation: -1, arguments: 4, 1, 10),
			Problem.TestCase(expectation: 2, arguments: 4, 1, 7),
			Problem.TestCase(expectation: 2, arguments: 6, 2, 7),
			Problem.TestCase(expectation: 0, arguments: 4, 1, 5),
			Problem.TestCase(expectation: 4, arguments: 4, 1, 4),
			Problem.TestCase(expectation: 4, arguments: 5, 4, 9),
			Problem.TestCase(expectation: 3, arguments: 9, 3, 18),
			Problem.TestCase(expectation: -1, arguments: 3, 1, 9),
			Problem.TestCase(expectation: -1, arguments: 1, 2, 7),
			Problem.TestCase(expectation: 1, arguments: 1, 2, 6),
			Problem.TestCase(expectation: 0, arguments: 1, 2, 5),
			Problem.TestCase(expectation: 5, arguments: 6, 1, 10),
			Problem.TestCase(expectation: 6, arguments: 6, 1, 11),
			Problem.TestCase(expectation: -1, arguments: 6, 1, 12),
			Problem.TestCase(expectation: -1, arguments: 6, 1, 13),
			Problem.TestCase(expectation: 0, arguments: 6, 2, 10),
			Problem.TestCase(expectation: 1, arguments: 6, 2, 11),
			Problem.TestCase(expectation: 2, arguments: 6, 2, 12),
			Problem.TestCase(expectation: 50, arguments: 60, 100, 550),
			Problem.TestCase(expectation: 6, arguments: 1000, 1000000, 5000006),
			Problem.TestCase(expectation: 7, arguments: 7, 1, 12),
			Problem.TestCase(expectation: -1, arguments: 7, 1, 13),
			Problem.TestCase(expectation: 3, arguments: 7, 2, 13)
		],
		eulerMode: false
	)
	
	
]
