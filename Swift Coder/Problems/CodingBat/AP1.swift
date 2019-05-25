//
//  CodingBatAP1Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatAP1Problems: [Problem] = [
	Problem(
		title: "scoresIncreasing",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "scores", type: [Int].self)
		],
		prompt: "Given an array of scores, return true if each score is equal or greater than the one before. The array will be length 2 or more.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 3, 4]),
			Problem.TestCase(expectation: false, arguments: [1, 3, 2]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 4]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 2, 4, 4, 7]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 2, 4, 3, 7]),
			Problem.TestCase(expectation: true, arguments: [-5, 4, 11])
		],
		eulerMode: false
	),
	Problem(
		title: "scores100",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "scores", type: [Int].self)
		],
		prompt: "Given an array of scores, return true if there are scores of 100 next to each other in the array. The array length will be at least 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 100, 100]),
			Problem.TestCase(expectation: false, arguments: [1, 100, 99, 100]),
			Problem.TestCase(expectation: true, arguments: [100, 1, 100, 100]),
			Problem.TestCase(expectation: false, arguments: [100, 1, 100, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4, 5]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 100, 4, 5])
		],
		eulerMode: false
	),
	Problem(
		title: "scoresClump",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "scores", type: [Int].self)
		],
		prompt: "Given an array of scores sorted in increasing order, return true if the array contains 3 adjacent scores that differ from each other by at most 2, such as with `[3, 4, 5]` or `[3, 5, 5]`.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [3, 4, 5]),
			Problem.TestCase(expectation: false, arguments: [3, 4, 6]),
			Problem.TestCase(expectation: true, arguments: [1, 3, 5, 5]),
			Problem.TestCase(expectation: true, arguments: [2, 4, 5, 6]),
			Problem.TestCase(expectation: false, arguments: [2, 4, 5, 7]),
			Problem.TestCase(expectation: true, arguments: [2, 4, 4, 7]),
			Problem.TestCase(expectation: false, arguments: [3, 3, 6, 7, 9]),
			Problem.TestCase(expectation: true, arguments: [3, 3, 7, 7, 9]),
			Problem.TestCase(expectation: false, arguments: [4, 5, 8])
		],
		eulerMode: false
	),
	Problem(
		title: "scoresAverage",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "scores", type: [Int].self)
		],
		prompt: "Given an array of scores, compute the int average of the first half and the second half, and return whichever is larger. We'll say that the second half begins at index `count`/2. The array length will be at least 2. To practice decomposition, write a separate helper method `func average(scores: [Int], start: Int, end: Int) -> Int {` which computes the average of the elements between indexes start..end. Call your helper method twice to implement the `scoresAverage` function. Write your helper method after your `scoresAverage` function in the text area. Normally you would compute averages with doubles, but here we use ints so the expected results are exact.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 4, arguments: [2, 2, 4, 4]),
			Problem.TestCase(expectation: 4, arguments: [4, 4, 4, 2, 2, 2]),
			Problem.TestCase(expectation: 4, arguments: [3, 4, 5, 1, 2, 3]),
			Problem.TestCase(expectation: 6, arguments: [5, 6]),
			Problem.TestCase(expectation: 5, arguments: [5, 4]),
			Problem.TestCase(expectation: 5, arguments: [5, 4, 5, 6, 2, 1, 2, 3])
		],
		eulerMode: false
	),
	Problem(
		title: "wordsCount",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "words", type: [String].self),
			Problem.Parameter(name: "len", type: Int.self)
		],
		prompt: "Given an array of strings, return the count of the number of strings with the given length.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 2, arguments: ["a", "bb", "b", "ccc"], 1),
			Problem.TestCase(expectation: 1, arguments: ["a", "bb", "b", "ccc"], 3),
			Problem.TestCase(expectation: 0, arguments: ["a", "bb", "b", "ccc"], 4),
			Problem.TestCase(expectation: 2, arguments: ["xx", "yyy", "x", "yy", "z"], 1),
			Problem.TestCase(expectation: 2, arguments: ["xx", "yyy", "x", "yy", "z"], 2),
			Problem.TestCase(expectation: 1, arguments: ["xx", "yyy", "x", "yy", "z"], 3)
		],
		eulerMode: false
	),
	Problem(
		title: "wordsFront",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "words", type: [String].self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given an array of strings, return a new array containing the first N strings. N will be in the range 1..length.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a"], arguments: ["a", "b", "c", "d"], 1),
			Problem.TestCase(expectation: ["a", "b"], arguments: ["a", "b", "c", "d"], 2),
			Problem.TestCase(expectation: ["a", "b", "c"], arguments: ["a", "b", "c", "d"], 3),
			Problem.TestCase(expectation: ["a", "b", "c", "d"], arguments: ["a", "b", "c", "d"], 4),
			Problem.TestCase(expectation: ["Hi"], arguments: ["Hi", "There"], 1),
			Problem.TestCase(expectation: ["Hi", "There"], arguments: ["Hi", "There"], 2)
		],
		eulerMode: false
	),
	Problem(
		title: "hasOne",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a positive int `n`, return true if it contains a 1 digit. Note: use `%` to get the rightmost digit, and `/` to discard the rightmost digit.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 10),
			Problem.TestCase(expectation: false, arguments: 22),
			Problem.TestCase(expectation: false, arguments: 220),
			Problem.TestCase(expectation: true, arguments: 212),
			Problem.TestCase(expectation: true, arguments: 1),
			Problem.TestCase(expectation: false, arguments: 9),
			Problem.TestCase(expectation: true, arguments: 211112),
			Problem.TestCase(expectation: true, arguments: 121121),
			Problem.TestCase(expectation: false, arguments: 222222),
			Problem.TestCase(expectation: true, arguments: 56156),
			Problem.TestCase(expectation: false, arguments: 56556)
		],
		eulerMode: false
	),
	Problem(
		title: "dividesSelf",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "We'll say that a positive int divides itself if every digit in the number divides into the number evenly. So for example 128 divides itself since 1, 2, and 8 all divide into 128 evenly. We'll say that 0 does not divide into anything evenly, so no number with a 0 digit divides itself. Note: use `%` to get the rightmost digit, and `/` to discard the rightmost digit.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 128),
			Problem.TestCase(expectation: true, arguments: 12),
			Problem.TestCase(expectation: false, arguments: 120),
			Problem.TestCase(expectation: true, arguments: 122),
			Problem.TestCase(expectation: false, arguments: 13),
			Problem.TestCase(expectation: false, arguments: 32),
			Problem.TestCase(expectation: true, arguments: 22),
			Problem.TestCase(expectation: false, arguments: 42),
			Problem.TestCase(expectation: true, arguments: 212),
			Problem.TestCase(expectation: false, arguments: 213),
			Problem.TestCase(expectation: true, arguments: 162)
		],
		eulerMode: false
	),
	Problem(
		title: "copyEvens",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "count", type: Int.self)
		],
		prompt: "Given an array of positive ints, return a new array of length \"`count`\" containing the first even numbers from the original array. The original array will contain at least \"`count`\" even numbers.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [2, 4], arguments: [3, 2, 4, 5, 8], 2),
			Problem.TestCase(expectation: [2, 4, 8], arguments: [3, 2, 4, 5, 8], 3),
			Problem.TestCase(expectation: [6, 2, 4], arguments: [6, 1, 2, 4, 5, 8], 3),
			Problem.TestCase(expectation: [6, 2, 4, 8], arguments: [6, 1, 2, 4, 5, 8], 4),
			Problem.TestCase(expectation: [4], arguments: [3, 1, 4, 1, 5], 1),
			Problem.TestCase(expectation: [2], arguments: [2], 1),
			Problem.TestCase(expectation: [6, 2], arguments: [6, 2, 4, 8], 2),
			Problem.TestCase(expectation: [6, 2, 4], arguments: [6, 2, 4, 8], 3),
			Problem.TestCase(expectation: [6, 2, 4, 8], arguments: [6, 2, 4, 8], 4),
			Problem.TestCase(expectation: [8], arguments: [1, 8, 4], 1),
			Problem.TestCase(expectation: [8, 4], arguments: [1, 8, 4], 2),
			Problem.TestCase(expectation: [2, 8], arguments: [2, 8, 4], 2)
		],
		eulerMode: false
	),
	Problem(
		title: "copyEndy",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "count", type: Int.self)
		],
		prompt: "We'll say that a positive int n is \"endy\" if it is in the range 0...10 or 90...100. Given an array of positive ints, return a new array of length \"`count`\" containing the first endy numbers from the original array. Decompose out a separate `isEndy(n: Int)` method to test if a number is endy. The original array will contain at least \"`count`\" endy numbers.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [9, 90], arguments: [9, 11, 90, 22, 6], 2),
			Problem.TestCase(expectation: [9, 90, 6], arguments: [9, 11, 90, 22, 6], 3),
			Problem.TestCase(expectation: [1, 1], arguments: [12, 1, 1, 13, 0, 20], 2),
			Problem.TestCase(expectation: [1, 1, 0], arguments: [12, 1, 1, 13, 0, 20], 3),
			Problem.TestCase(expectation: [0], arguments: [0], 1),
			Problem.TestCase(expectation: [10, 90], arguments: [10, 11, 90], 2),
			Problem.TestCase(expectation: [90, 100], arguments: [90, 22, 100], 2),
			Problem.TestCase(expectation: [10], arguments: [12, 11, 10, 89, 101, 4], 1),
			Problem.TestCase(expectation: [2, 2], arguments: [13, 2, 2, 0], 2),
			Problem.TestCase(expectation: [2, 2, 0], arguments: [13, 2, 2, 0], 3),
			Problem.TestCase(expectation: [2, 2], arguments: [13, 2, 13, 2, 0, 30], 2),
			Problem.TestCase(expectation: [2, 2, 0], arguments: [13, 2, 13, 2, 0, 30], 3)
		],
		eulerMode: false
	),
	Problem(
		title: "matchUp",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: [String].self),
			Problem.Parameter(name: "b", type: [String].self)
		],
		prompt: "Given 2 arrays that are the same length containing strings, compare the 1st string in one array to the 1st string in the other array, the 2nd to the 2nd and so on. Count the number of times that the 2 strings are non-empty and start with the same character. The strings may be any length, including 0.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: ["aa", "bb", "cc"], ["aaa", "xx", "bb"]),
			Problem.TestCase(expectation: 2, arguments: ["aa", "bb", "cc"], ["aaa", "b", "bb"]),
			Problem.TestCase(expectation: 1, arguments: ["aa", "bb", "cc"], ["", "", "ccc"]),
			Problem.TestCase(expectation: 1, arguments: ["", "", "ccc"], ["aa", "bb", "cc"]),
			Problem.TestCase(expectation: 0, arguments: ["", "", ""], ["", "bb", "cc"]),
			Problem.TestCase(expectation: 0, arguments: ["aa", "bb", "cc"], ["", "", ""]),
			Problem.TestCase(expectation: 1, arguments: ["aa", "", "ccc"], ["", "bb", "cc"]),
			Problem.TestCase(expectation: 0, arguments: ["x", "y", "z"], ["y", "z", "x"]),
			Problem.TestCase(expectation: 1, arguments: ["", "y", "z"], ["", "y", "x"]),
			Problem.TestCase(expectation: 3, arguments: ["x", "y", "z"], ["xx", "yyy", "zzz"]),
			Problem.TestCase(expectation: 2, arguments: ["x", "y", "z"], ["xx", "yyy", ""]),
			Problem.TestCase(expectation: 3, arguments: ["b", "x", "y", "z"], ["a", "xx", "yyy", "zzz"]),
			Problem.TestCase(expectation: 1, arguments: ["aaa", "bb", "c"], ["aaa", "xx", "bb"])
		],
		eulerMode: false
	),
	Problem(title: "scoreUp",
			returnType: Int.self,
			parameters: [
				Problem.Parameter(name: "key", type: [String].self),
				Problem.Parameter(name: "answers", type: [String].self)
		],
			prompt: "The \"`key`\" array is an array containing the correct answers to an exam, like `[\"a\", \"a\", \"b\", \"b\"]`. The \"`answers`\" array contains a student's answers, with \"?\" representing a question left blank. The two arrays are not empty and are the same length. Return the score for this array of answers, giving +4 for each correct answer, -1 for each incorrect answer, and +0 for each blank answer.",
			testCases: [
				Problem.TestCase(expectation: 6, arguments: ["a", "a", "b", "b"], ["a", "c", "b", "c"]),
				Problem.TestCase(expectation: 11, arguments: ["a", "a", "b", "b"], ["a", "a", "b", "c"]),
				Problem.TestCase(expectation: 16, arguments: ["a", "a", "b", "b"], ["a", "a", "b", "b"]),
				Problem.TestCase(expectation: 3, arguments: ["a", "a", "b", "b"], ["?", "c", "b", "?"]),
				Problem.TestCase(expectation: -1, arguments: ["a", "a", "b", "b"], ["?", "c", "?", "?"]),
				Problem.TestCase(expectation: 7, arguments: ["a", "a", "b", "b"], ["c", "?", "b", "b"]),
				Problem.TestCase(expectation: 3, arguments: ["a", "a", "b", "b"], ["c", "?", "b", "?"]),
				Problem.TestCase(expectation: 2, arguments: ["a", "b", "c"], ["a", "c", "b"]),
				Problem.TestCase(expectation: 4, arguments: ["a", "a", "b", "b", "c", "c"], ["a", "c", "a", "c", "a", "c"]),
				Problem.TestCase(expectation: 6, arguments: ["a", "a", "b", "b", "c", "c"], ["a", "c", "?", "?", "a", "c"]),
				Problem.TestCase(expectation: 11, arguments: ["a", "a", "b", "b", "c", "c"], ["a", "c", "?", "?", "c", "c"]),
				Problem.TestCase(expectation: 12, arguments: ["a", "b", "c"], ["a", "b", "c"])
		]),
	Problem(
		title: "wordsWithout",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "words", type: [String].self),
			Problem.Parameter(name: "target", type: String.self)
		],
		prompt: "Given an array of strings, return a new array without the strings that are equal to the target string. One approach is to count the occurrences of the target string, make a new array of the correct length, and then copy over the correct strings.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["b", "c"], arguments: ["a", "b", "c", "a"], "a"),
			Problem.TestCase(expectation: ["a", "c", "a"], arguments: ["a", "b", "c", "a"], "b"),
			Problem.TestCase(expectation: ["a", "b", "a"], arguments: ["a", "b", "c", "a"], "c"),
			Problem.TestCase(expectation: ["c", "a", "a"], arguments: ["b", "c", "a", "a"], "b"),
			Problem.TestCase(expectation: ["xx", "yyy", "yy"], arguments: ["xx", "yyy", "x", "yy", "x"], "x"),
			Problem.TestCase(expectation: ["xx", "yyy", "x", "x"], arguments: ["xx", "yyy", "x", "yy", "x"], "yy"),
			Problem.TestCase(expectation: ["ab", "ac"], arguments: ["aa", "ab", "ac", "aa"], "aa")
		],
		eulerMode: false
	),
	Problem(
		title: "scoresSpecial",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: [Int].self),
			Problem.Parameter(name: "b", type: [Int].self)
		],
		prompt: "Given two arrays, `a` and `b`, of non-negative int scores. A \"special\" score is one which is a multiple of 10, such as 40 or 90. Return the sum of largest special score in A and the largest special score in B. To practice decomposition, write a separate helper function which finds the largest special score in an array. Write your helper function after your `scoresSpecial` method in the text area.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 40, arguments: [12, 10, 4], [2, 20, 30]),
			Problem.TestCase(expectation: 40, arguments: [20, 10, 4], [2, 20, 10]),
			Problem.TestCase(expectation: 20, arguments: [12, 11, 4], [2, 20, 31]),
			Problem.TestCase(expectation: 50, arguments: [1, 20, 2, 50], [3, 4, 5]),
			Problem.TestCase(expectation: 50, arguments: [3, 4, 5], [1, 50, 2, 20]),
			Problem.TestCase(expectation: 50, arguments: [10, 4, 20, 30], [20]),
			Problem.TestCase(expectation: 50, arguments: [10, 4, 20, 30], [20]),
			Problem.TestCase(expectation: 50, arguments: [10, 4, 20, 30], [3, 20, 99]),
			Problem.TestCase(expectation: 60, arguments: [10, 4, 20, 30], [30, 20, 99]),
			Problem.TestCase(expectation: 0, arguments: [Int](), [2]),
			Problem.TestCase(expectation: 20, arguments: [Int](), [20]),
			Problem.TestCase(expectation: 40, arguments: [14, 10, 4], [4, 20, 30])
		],
		eulerMode: false
	),
	Problem(
		title: "sumHeights",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "heights", type: [Int].self),
			Problem.Parameter(name: "start", type: Int.self),
			Problem.Parameter(name: "end", type: Int.self)
		],
		prompt: "We have an array of heights, representing the altitude along a walking trail. Given `start`/`end` indexes into the array, return the sum of the changes for a walk beginning at the start index and ending at the end index. For example, with the heights `[5, 3, 6, 7, 2]` and `start`=2, `end`=4 yields a sum of 1 + 5 = 6. The start end end index will both be valid indexes into the array with start <= end.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 6, arguments: [5, 3, 6, 7, 2], 2, 4),
			Problem.TestCase(expectation: 2, arguments: [5, 3, 6, 7, 2], 0, 1),
			Problem.TestCase(expectation: 11, arguments: [5, 3, 6, 7, 2], 0, 4),
			Problem.TestCase(expectation: 0, arguments: [5, 3, 6, 7, 2], 1, 1),
			Problem.TestCase(expectation: 3, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 0, 3),
			Problem.TestCase(expectation: 11, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 4, 8),
			Problem.TestCase(expectation: 8, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 7, 8),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 8, 8),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 2, 2),
			Problem.TestCase(expectation: 3, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 3, 6),
			Problem.TestCase(expectation: 1, arguments: [10, 8, 7, 7, 7, 6, 7], 1, 4),
			Problem.TestCase(expectation: 2, arguments: [10, 8, 7, 7, 7, 6, 7], 1, 5)
		],
		eulerMode: false
	),
	Problem(
		title: "sumHeights2",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "heights", type: [Int].self),
			Problem.Parameter(name: "start", type: Int.self),
			Problem.Parameter(name: "end", type: Int.self)
		],
		prompt: "(A variation on the sumHeights problem.) We have an array of heights, representing the altitude along a walking trail. Given start/end indexes into the array, return the sum of the changes for a walk beginning at the start index and ending at the end index, however increases in height count double. For example, with the heights `[5, 3, 6, 7, 2]` and start=2, end=4 yields a sum of 1*2 + 5 = 7. The start end end index will both be valid indexes into the array with start <= end.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 7, arguments: [5, 3, 6, 7, 2], 2, 4),
			Problem.TestCase(expectation: 2, arguments: [5, 3, 6, 7, 2], 0, 1),
			Problem.TestCase(expectation: 15, arguments: [5, 3, 6, 7, 2], 0, 4),
			Problem.TestCase(expectation: 0, arguments: [5, 3, 6, 7, 2], 1, 1),
			Problem.TestCase(expectation: 6, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 0, 3),
			Problem.TestCase(expectation: 19, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 4, 8),
			Problem.TestCase(expectation: 16, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 7, 8),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 8, 8),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 2, 2),
			Problem.TestCase(expectation: 4, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 3, 6),
			Problem.TestCase(expectation: 1, arguments: [10, 8, 7, 7, 7, 6, 7], 1, 4),
			Problem.TestCase(expectation: 2, arguments: [10, 8, 7, 7, 7, 6, 7], 1, 5)
		],
		eulerMode: false
	),
	Problem(
		title: "bigHeights",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "heights", type: [Int].self),
			Problem.Parameter(name: "start", type: Int.self),
			Problem.Parameter(name: "end", type: Int.self)
		],
		prompt: "(A variation on the sumHeights problem.) We have an array of heights, representing the altitude along a walking trail. Given start/end indexes into the array, return the number of \"big\" steps for a walk starting at the start index and ending at the end index. We'll say that step is big if it is 5 or more up or down. The start end end index will both be valid indexes into the array with start <= end.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: [5, 3, 6, 7, 2], 2, 4),
			Problem.TestCase(expectation: 0, arguments: [5, 3, 6, 7, 2], 0, 1),
			Problem.TestCase(expectation: 1, arguments: [5, 3, 6, 7, 2], 0, 4),
			Problem.TestCase(expectation: 0, arguments: [5, 3, 6, 7, 3], 0, 4),
			Problem.TestCase(expectation: 0, arguments: [5, 3, 6, 7, 2], 1, 1),
			Problem.TestCase(expectation: 1, arguments: [5, 13, 6, 7, 2], 1, 2),
			Problem.TestCase(expectation: 2, arguments: [5, 13, 6, 7, 2], 0, 2),
			Problem.TestCase(expectation: 2, arguments: [5, 13, 6, 7, 2], 1, 4),
			Problem.TestCase(expectation: 3, arguments: [5, 13, 6, 7, 2], 0, 4),
			Problem.TestCase(expectation: 2, arguments: [5, 13, 6, 7, 2], 0, 3),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 0, 3),
			Problem.TestCase(expectation: 1, arguments: [1, 2, 3, 4, 5, 4, 3, 2, 10], 4, 8),
			Problem.TestCase(expectation: 1, arguments: [1, 2, 3, 14, 5, 4, 3, 2, 10], 0, 3),
			Problem.TestCase(expectation: 1, arguments: [1, 2, 3, 14, 5, 4, 3, 2, 10], 7, 8),
			Problem.TestCase(expectation: 2, arguments: [1, 2, 3, 14, 5, 4, 3, 2, 10], 3, 8),
			Problem.TestCase(expectation: 3, arguments: [1, 2, 3, 14, 5, 4, 3, 2, 10], 2, 8)
		],
		eulerMode: false
	),
	Problem(
		title: "userCompare",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "aName", type: String.self),
			Problem.Parameter(name: "aId", type: Int.self),
			Problem.Parameter(name: "bName", type: String.self),
			Problem.Parameter(name: "bId", type: Int.self)
		],
		prompt: "We have data for two users, A and B, each with a String name and an int id. The goal is to order the users such as for sorting. Return -1 if A comes before B, 1 if A comes after B, and 0 if they are the same. Order first by the string names, and then by the id numbers if the names are the same. Note: Strings can be compared with the > and < operators, which return a boolean value indicating which one is ordered first. (On the AP, there would be two User objects, but here the code simply takes the two strings and two ints directly. The code logic is the same.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: -1, arguments: "bb", 1, "zz", 2),
			Problem.TestCase(expectation: 1, arguments: "bb", 1, "aa", 2),
			Problem.TestCase(expectation: 0, arguments: "bb", 1, "bb", 1),
			Problem.TestCase(expectation: 1, arguments: "bb", 5, "bb", 1),
			Problem.TestCase(expectation: -1, arguments: "bb", 5, "bb", 10),
			Problem.TestCase(expectation: -1, arguments: "adam", 1, "bob", 2),
			Problem.TestCase(expectation: -1, arguments: "bob", 1, "bob", 2),
			Problem.TestCase(expectation: 1, arguments: "bzb", 1, "bob", 2)
		],
		eulerMode: false
	),
	Problem(
		title: "mergeTwo",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "a", type: [String].self),
			Problem.Parameter(name: "b", type: [String].self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Start with two arrays of strings, `a` and `b`, each with its elements in alphabetical order and without duplicates. Return a new array containing the first N elements from the two arrays. The result array should be in alphabetical order and without duplicates. `a` and `b` will both have a length which is `n or more. The best \"linear\" solution makes a single pass over `a` and `b`, taking advantage of the fact that they are in alphabetical order, copying elements directly to the new array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a", "b", "c"], arguments: ["a", "c", "z"], ["b", "f", "z"], 3),
			Problem.TestCase(expectation: ["a", "c", "f"], arguments: ["a", "c", "z"], ["c", "f", "z"], 3),
			Problem.TestCase(expectation: ["c", "f", "g"], arguments: ["f", "g", "z"], ["c", "f", "g"], 3),
			Problem.TestCase(expectation: ["a", "c", "z"], arguments: ["a", "c", "z"], ["a", "c", "z"], 3),
			Problem.TestCase(expectation: ["a", "b", "c"], arguments: ["a", "b", "c", "z"], ["a", "c", "z"], 3),
			Problem.TestCase(expectation: ["a", "b", "c"], arguments: ["a", "c", "z"], ["a", "b", "c", "z"], 3),
			Problem.TestCase(expectation: ["a", "c"], arguments: ["a", "c", "z"], ["a", "c", "z"], 2),
			Problem.TestCase(expectation: ["a", "c", "y"], arguments: ["a", "c", "z"], ["a", "c", "y", "z"], 3),
			Problem.TestCase(expectation: ["a", "b", "x"], arguments: ["x", "y", "z"], ["a", "b", "z"], 3)
		],
		eulerMode: false
	),
	Problem(
		title: "commonTwo",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: [String].self),
			Problem.Parameter(name: "b", type: [String].self)
		],
		prompt: "Start with two arrays of strings, `a` and `b`, each in alphabetical order, possibly with duplicates. Return the count of the number of strings which appear in both arrays. The best \"linear\" solution makes a single pass over both arrays, taking advantage of the fact that they are in alphabetical order.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 2, arguments: ["a", "c", "x"], ["b", "c", "d", "x"]),
			Problem.TestCase(expectation: 3, arguments: ["a", "c", "x"], ["a", "b", "c", "x", "z"]),
			Problem.TestCase(expectation: 3, arguments: ["a", "b", "c"], ["a", "b", "c"]),
			Problem.TestCase(expectation: 3, arguments: ["a", "a", "b", "b", "c"], ["a", "b", "c"]),
			Problem.TestCase(expectation: 3, arguments: ["a", "a", "b", "b", "c"], ["a", "b", "b", "b", "c"]),
			Problem.TestCase(expectation: 3, arguments: ["a", "a", "b", "b", "c"], ["a", "b", "b", "c", "c"]),
			Problem.TestCase(expectation: 2, arguments: ["b", "b", "b", "b", "c"], ["a", "b", "b", "b", "c"]),
			Problem.TestCase(expectation: 4, arguments: ["a", "b", "c", "c", "d"], ["a", "b", "b", "c", "d", "d"]),
			Problem.TestCase(expectation: 1, arguments: ["a", "a", "b", "b", "c"], ["b", "b", "b"]),
			Problem.TestCase(expectation: 1, arguments: ["a", "a", "b", "b", "c"], ["c", "c"]),
			Problem.TestCase(expectation: 1, arguments: ["a", "a", "b", "b", "c"], ["b", "b", "b", "x"]),
			Problem.TestCase(expectation: 1, arguments: ["a", "a", "b", "b", "c"], ["b", "b"]),
			Problem.TestCase(expectation: 1, arguments: ["a"], ["a", "b"]),
			Problem.TestCase(expectation: 0, arguments: ["a"], ["b"]),
			Problem.TestCase(expectation: 0, arguments: ["a", "a"], ["b", "b"]),
			Problem.TestCase(expectation: 2, arguments: ["a", "b"], ["a", "b"])
		],
		eulerMode: false
	)
	
]
