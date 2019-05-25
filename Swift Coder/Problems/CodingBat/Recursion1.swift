//
//  CodingBatRecursion1Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatRecursion1Problems: [Problem] = [
	Problem(
		title: "factorial",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given n of 1 or more, return the factorial of n, which is n * (n-1) * (n-2) ... 1. Compute the result recursively (without loops).",
		solution: """
		func factorial(n: Int) -> Int {
			// Base case: if n is 1, we can return the answer directly
			if n == 1 {
				return 1
			}
			
			// Recursion: otherwise make a recursive call with n-1
			// (towards the base caes), i.e. call factorial(n-1).
			// Assume the recursive call works correctly, and fix up
			// what it returns to make our result.
			return n * factorial(n: n-1)
		}
		""",
		hint: "First, detect the \"base case\", a case so simple that the answer can be returned immediately (here when `n==1`). Otherwise make a recursive call of `factorial(n: n-1)` (towards the base case). Assume the recursive call returns a correct value, and fix that value up to make our result.",
		testCases: [
			Problem.TestCase(expectation: 1, arguments: 1),
			Problem.TestCase(expectation: 2, arguments: 2),
			Problem.TestCase(expectation: 6, arguments: 3),
			Problem.TestCase(expectation: 24, arguments: 4),
			Problem.TestCase(expectation: 120, arguments: 5),
			Problem.TestCase(expectation: 720, arguments: 6),
			Problem.TestCase(expectation: 5040, arguments: 7),
			Problem.TestCase(expectation: 40320, arguments: 8),
			Problem.TestCase(expectation: 479001600, arguments: 12)
		],
		eulerMode: false
	),
	Problem(
		title: "bunnyEars",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "bunnies", type: Int.self)
		],
		prompt: "We have a number of bunnies and each bunny has two big floppy ears. We want to compute the total number of ears across all the bunnies recursively (without loops or multiplication).",
		solution: """
		func bunnyEars(bunnies: Int) -> Int {
			// Base case: if bunnies==0, just return 0
			if bunnies == 0 {
				return 0
			}
			
			// Recursive case: otherwise, make a recursive call
			// with bunnies-1 (towards the base case), and fix up
			// what it returns.
			return 2 + bunnyEars(bunnies: bunnies-1)
		}
		""",
		hint: "First detect the base case (`bunnies == 0`), and in that case just return 0. Otherwise, make a recursive call to `bunnyEars(bunnies: bunnies-1)`. Trust that the recursive call returns the correct value, and fix it up by adding 2.",
		testCases: [
			Problem.TestCase(expectation: 0, arguments: 0),
			Problem.TestCase(expectation: 2, arguments: 1),
			Problem.TestCase(expectation: 4, arguments: 2),
			Problem.TestCase(expectation: 6, arguments: 3),
			Problem.TestCase(expectation: 8, arguments: 4),
			Problem.TestCase(expectation: 10, arguments: 5),
			Problem.TestCase(expectation: 24, arguments: 12),
			Problem.TestCase(expectation: 100, arguments: 50),
			Problem.TestCase(expectation: 468, arguments: 234)
		],
		eulerMode: false
	),
	Problem(
		title: "fibonacci",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "The fibonacci sequence is a famous bit of mathematics, and it happens to have a recursive definition. The first two values in the sequence are 0 and 1 (essentially 2 base cases). Each subsequent value is the sum of the previous two values, so the whole sequence is: 0, 1, 1, 2, 3, 5, 8, 13, 21 and so on. Define a recursive fibonacci(n:) method that returns the nth fibonacci number, with n=0 representing the start of the sequence.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 0, arguments: 0),
			Problem.TestCase(expectation: 1, arguments: 1),
			Problem.TestCase(expectation: 1, arguments: 2),
			Problem.TestCase(expectation: 2, arguments: 3),
			Problem.TestCase(expectation: 3, arguments: 4),
			Problem.TestCase(expectation: 5, arguments: 5),
			Problem.TestCase(expectation: 8, arguments: 6),
			Problem.TestCase(expectation: 13, arguments: 7)
		],
		eulerMode: false
	),
	Problem(
		title: "bunnyEars2",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "bunnies", type: Int.self)
		],
		prompt: "We have bunnies standing in a line, numbered 1, 2, ... The odd bunnies (1, 3, ..) have the normal 2 ears. The even bunnies (2, 4, ..) we'll say have 3 ears, because they each have a raised foot. Recursively return the number of \"ears\" in the bunny line 1, 2, ... n (without loops or multiplication).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 0, arguments: 0),
			Problem.TestCase(expectation: 2, arguments: 1),
			Problem.TestCase(expectation: 5, arguments: 2),
			Problem.TestCase(expectation: 7, arguments: 3),
			Problem.TestCase(expectation: 10, arguments: 4),
			Problem.TestCase(expectation: 12, arguments: 5),
			Problem.TestCase(expectation: 15, arguments: 6),
			Problem.TestCase(expectation: 25, arguments: 10)
		],
		eulerMode: false
	),
	Problem(
		title: "triangle",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "rows", type: Int.self)
		],
		prompt: "We have triangle made of blocks. The topmost row has 1 block, the next row down has 2 blocks, the next row has 3 blocks, and so on. Compute recursively (no loops or multiplication) the total number of blocks in such a triangle with the given number of rows.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 0, arguments: 0),
			Problem.TestCase(expectation: 1, arguments: 1),
			Problem.TestCase(expectation: 3, arguments: 2),
			Problem.TestCase(expectation: 6, arguments: 3),
			Problem.TestCase(expectation: 10, arguments: 4),
			Problem.TestCase(expectation: 15, arguments: 5),
			Problem.TestCase(expectation: 21, arguments: 6),
			Problem.TestCase(expectation: 28, arguments: 7)
		],
		eulerMode: false
	),
	Problem(
		title: "sumDigits2",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a non-negative int n, return the sum of its digits recursively (no loops). Note that recursion (%) by 10 yields the rightmost digit (126 % 10 is 6), while divide (/) by 10 removes the rightmost digit (126 / 10 is 12).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 9, arguments: 126),
			Problem.TestCase(expectation: 13, arguments: 49),
			Problem.TestCase(expectation: 3, arguments: 12),
			Problem.TestCase(expectation: 1, arguments: 10),
			Problem.TestCase(expectation: 1, arguments: 1),
			Problem.TestCase(expectation: 0, arguments: 0),
			Problem.TestCase(expectation: 10, arguments: 730),
			Problem.TestCase(expectation: 4, arguments: 1111),
			Problem.TestCase(expectation: 5, arguments: 11111),
			Problem.TestCase(expectation: 3, arguments: 10110),
			Problem.TestCase(expectation: 10, arguments: 235)
		],
		eulerMode: false
	),
	Problem(
		title: "count7",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a non-negative int n, return the count of the occurrences of 7 as a digit, so for example 717 yields 2. (no loops). Note that recursion (%) by 10 yields the rightmost digit (126 % 10 is 6), while divide (/) by 10 removes the rightmost digit (126 / 10 is 12).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 2, arguments: 717),
			Problem.TestCase(expectation: 1, arguments: 7),
			Problem.TestCase(expectation: 0, arguments: 123),
			Problem.TestCase(expectation: 2, arguments: 77),
			Problem.TestCase(expectation: 1, arguments: 7123),
			Problem.TestCase(expectation: 3, arguments: 771237),
			Problem.TestCase(expectation: 4, arguments: 771737),
			Problem.TestCase(expectation: 2, arguments: 47571),
			Problem.TestCase(expectation: 6, arguments: 777777),
			Problem.TestCase(expectation: 4, arguments: 70701277),
			Problem.TestCase(expectation: 5, arguments: 777576197),
			Problem.TestCase(expectation: 0, arguments: 99999),
			Problem.TestCase(expectation: 1, arguments: 99799)
		],
		eulerMode: false
	),
	Problem(
		title: "count8",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a non-negative int n, compute recursively (no loops) the count of the occurrences of 8 as a digit, except that an 8 with another 8 immediately to its left counts double, so 8818 yields 4. Note that recursion (%) by 10 yields the rightmost digit (126 % 10 is 6), while divide (/) by 10 removes the rightmost digit (126 / 10 is 12).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: 8),
			Problem.TestCase(expectation: 2, arguments: 818),
			Problem.TestCase(expectation: 4, arguments: 8818),
			Problem.TestCase(expectation: 4, arguments: 8088),
			Problem.TestCase(expectation: 0, arguments: 123),
			Problem.TestCase(expectation: 2, arguments: 81238),
			Problem.TestCase(expectation: 6, arguments: 88788),
			Problem.TestCase(expectation: 1, arguments: 8234),
			Problem.TestCase(expectation: 1, arguments: 2348),
			Problem.TestCase(expectation: 3, arguments: 23884),
			Problem.TestCase(expectation: 0, arguments: 0),
			Problem.TestCase(expectation: 5, arguments: 1818188),
			Problem.TestCase(expectation: 5, arguments: 8818181),
			Problem.TestCase(expectation: 1, arguments: 1080),
			Problem.TestCase(expectation: 3, arguments: 188),
			Problem.TestCase(expectation: 9, arguments: 88888),
			Problem.TestCase(expectation: 2, arguments: 9898),
			Problem.TestCase(expectation: 1, arguments: 78)
		],
		eulerMode: false
	),
	Problem(
		title: "powerN",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "base", type: Int.self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given base and n that are both 1 or more, compute recursively (no loops) the value of base to the n power, so powerN(base: 3, n: 2) is 9 (3 squared).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 3, arguments: 3, 1),
			Problem.TestCase(expectation: 9, arguments: 3, 2),
			Problem.TestCase(expectation: 27, arguments: 3, 3),
			Problem.TestCase(expectation: 2, arguments: 2, 1),
			Problem.TestCase(expectation: 4, arguments: 2, 2),
			Problem.TestCase(expectation: 8, arguments: 2, 3),
			Problem.TestCase(expectation: 16, arguments: 2, 4),
			Problem.TestCase(expectation: 32, arguments: 2, 5),
			Problem.TestCase(expectation: 10, arguments: 10, 1),
			Problem.TestCase(expectation: 100, arguments: 10, 2),
			Problem.TestCase(expectation: 1000, arguments: 10, 3)
		],
		eulerMode: false
	),
	Problem(
		title: "countX",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute recursively (no loops) the number of lowercase \"x\" characters in the string.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 4, arguments: "xxhixx"),
			Problem.TestCase(expectation: 3, arguments: "xhixhix"),
			Problem.TestCase(expectation: 0, arguments: "hi"),
			Problem.TestCase(expectation: 0, arguments: "h"),
			Problem.TestCase(expectation: 1, arguments: "x"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 0, arguments: "hihi"),
			Problem.TestCase(expectation: 0, arguments: "hiAAhi12hi")
		],
		eulerMode: false
	),
	Problem(
		title: "countHi2",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute recursively (no loops) the number of times lowercase \"hi\" appears in the string.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: "xxhixx"),
			Problem.TestCase(expectation: 2, arguments: "xhixhix"),
			Problem.TestCase(expectation: 1, arguments: "hi"),
			Problem.TestCase(expectation: 2, arguments: "hihih"),
			Problem.TestCase(expectation: 0, arguments: "h"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 4, arguments: "ihihihihih"),
			Problem.TestCase(expectation: 5, arguments: "ihihihihihi"),
			Problem.TestCase(expectation: 3, arguments: "hiAAhi12hi"),
			Problem.TestCase(expectation: 3, arguments: "xhixhxihihhhih"),
			Problem.TestCase(expectation: 1, arguments: "ship")
		],
		eulerMode: false
	),
	Problem(
		title: "changeXY",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute recursively (no loops) a new string where all the lowercase \"x\" characters have been changed to \"y\" characters.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "codey", arguments: "codex"),
			Problem.TestCase(expectation: "yyhiyy", arguments: "xxhixx"),
			Problem.TestCase(expectation: "yhiyhiy", arguments: "xhixhix"),
			Problem.TestCase(expectation: "hiy", arguments: "hiy"),
			Problem.TestCase(expectation: "h", arguments: "h"),
			Problem.TestCase(expectation: "y", arguments: "x"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "yyy", arguments: "xxx"),
			Problem.TestCase(expectation: "yyhyyi", arguments: "yyhxyi"),
			Problem.TestCase(expectation: "hihi", arguments: "hihi")
		],
		eulerMode: false
	),
	Problem(
		title: "changePi",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute recursively (no loops) a new string where all appearances of \"pi\" have been replaced by \"3.14\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "x3.14x", arguments: "xpix"),
			Problem.TestCase(expectation: "3.143.14", arguments: "pipi"),
			Problem.TestCase(expectation: "3.14p", arguments: "pip"),
			Problem.TestCase(expectation: "3.14", arguments: "pi"),
			Problem.TestCase(expectation: "hip", arguments: "hip"),
			Problem.TestCase(expectation: "p", arguments: "p"),
			Problem.TestCase(expectation: "x", arguments: "x"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "3.14xx", arguments: "pixx"),
			Problem.TestCase(expectation: "xyzzy", arguments: "xyzzy")
		],
		eulerMode: false
	),
	Problem(
		title: "noX",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute recursively a new string where all the \"x\" characters have been removed.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ab", arguments: "xaxb"),
			Problem.TestCase(expectation: "abc", arguments: "abc"),
			Problem.TestCase(expectation: "", arguments: "xx"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "ab", arguments: "axxbxx"),
			Problem.TestCase(expectation: "Hello", arguments: "Hellox")
		],
		eulerMode: false
	),
	Problem(
		title: "array6",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "index", type: Int.self)
		],
		prompt: "Given an array of ints, compute recursively if the array contains a 6. We'll use the convention of considering only the part of the array that begins at the given index. In this way, a recursive call can pass index+1 to move down the array. The initial call will pass in index as 0.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 6, 4], 0),
			Problem.TestCase(expectation: false, arguments: [1, 4], 0),
			Problem.TestCase(expectation: true, arguments: [6], 0),
			Problem.TestCase(expectation: false, arguments: [Int](), 0),
			Problem.TestCase(expectation: true, arguments: [6, 2, 2], 0),
			Problem.TestCase(expectation: false, arguments: [2, 5], 0),
			Problem.TestCase(expectation: true, arguments: [1, 9, 4, 6, 6], 0),
			Problem.TestCase(expectation: true, arguments: [2, 5, 6], 0)
		],
		eulerMode: false
	),
	Problem(
		title: "array11",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "index", type: Int.self)
		],
		prompt: "Given an array of ints, compute recursively the number of times that the value 11 appears in the array. We'll use the convention of considering only the part of the array that begins at the given index. In this way, a recursive call can pass index+1 to move down the array. The initial call will pass in index as 0.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: [1, 2, 11], 0),
			Problem.TestCase(expectation: 2, arguments: [11, 11], 0),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3, 4], 0),
			Problem.TestCase(expectation: 3, arguments: [1, 11, 3, 11, 11], 0),
			Problem.TestCase(expectation: 1, arguments: [11], 0),
			Problem.TestCase(expectation: 0, arguments: [1], 0),
			Problem.TestCase(expectation: 0, arguments: [Int](), 0),
			Problem.TestCase(expectation: 2, arguments: [11, 2, 3, 4, 11, 5], 0),
			Problem.TestCase(expectation: 2, arguments: [11, 5, 11], 0)
		],
		eulerMode: false
	),
	Problem(
		title: "array220",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self),
			Problem.Parameter(name: "index", type: Int.self)
		],
		prompt: "Given an array of ints, compute recursively if the array contains somewhere a value followed in the array by that value times 10. We'll use the convention of considering only the part of the array that begins at the given index. In this way, a recursive call can pass index+1 to move down the array. The initial call will pass in index as 0.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 2, 20], 0),
			Problem.TestCase(expectation: true, arguments: [3, 30], 0),
			Problem.TestCase(expectation: false, arguments: [3], 0),
			Problem.TestCase(expectation: false, arguments: [Int](), 0),
			Problem.TestCase(expectation: true, arguments: [3, 3, 30, 4], 0),
			Problem.TestCase(expectation: false, arguments: [2, 19, 4], 0),
			Problem.TestCase(expectation: false, arguments: [20, 2, 21], 0),
			Problem.TestCase(expectation: true, arguments: [20, 2, 21, 210], 0),
			Problem.TestCase(expectation: true, arguments: [2, 200, 2000], 0),
			Problem.TestCase(expectation: true, arguments: [0, 0], 0),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4, 5, 6], 0),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3, 4, 5, 50, 6], 0),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4, 5, 51, 6], 0),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3, 4, 4, 50, 500, 6], 0)
		],
		eulerMode: false
	),
	Problem(
		title: "allStar",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute recursively a new string where all the adjacent characters are now separated by a \"*\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "h*e*l*l*o", arguments: "hello"),
			Problem.TestCase(expectation: "a*b*c", arguments: "abc"),
			Problem.TestCase(expectation: "a*b", arguments: "ab"),
			Problem.TestCase(expectation: "a", arguments: "a"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "3*.*1*4", arguments: "3.14"),
			Problem.TestCase(expectation: "C*h*o*c*o*l*a*t*e", arguments: "Chocolate"),
			Problem.TestCase(expectation: "1*2*3*4", arguments: "1234")
		],
		eulerMode: false
	),
	Problem(
		title: "pairStar",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute recursively a new string where identical characters that are adjacent in the original string are separated from each other by a \"*\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "hel*lo", arguments: "hello"),
			Problem.TestCase(expectation: "x*xy*y", arguments: "xxyy"),
			Problem.TestCase(expectation: "a*a*a*a", arguments: "aaaa"),
			Problem.TestCase(expectation: "a*a*ab", arguments: "aaab"),
			Problem.TestCase(expectation: "a*a", arguments: "aa"),
			Problem.TestCase(expectation: "a", arguments: "a"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "noadjacent", arguments: "noadjacent"),
			Problem.TestCase(expectation: "ab*ba", arguments: "abba"),
			Problem.TestCase(expectation: "ab*b*ba", arguments: "abbba")
		],
		eulerMode: false
	),
	Problem(
		title: "endX",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute recursively a new string where all the lowercase 'x' characters have been moved to the end of the string.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "rexx", arguments: "xxre"),
			Problem.TestCase(expectation: "hixxxx", arguments: "xxhixx"),
			Problem.TestCase(expectation: "hihixxx", arguments: "xhixhix"),
			Problem.TestCase(expectation: "hiy", arguments: "hiy"),
			Problem.TestCase(expectation: "h", arguments: "h"),
			Problem.TestCase(expectation: "x", arguments: "x"),
			Problem.TestCase(expectation: "xx", arguments: "xx"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "bxx", arguments: "bxx"),
			Problem.TestCase(expectation: "baxx", arguments: "bxax"),
			Problem.TestCase(expectation: "aaaxxx", arguments: "axaxax"),
			Problem.TestCase(expectation: "hixxx", arguments: "xxhxi")
		],
		eulerMode: false
	),
	Problem(
		title: "countPairs",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "We'll say that a \"pair\" in a string is two instances of a character separated by a character. So \"AxA\" the A's make a pair. Pairs can overlap, so \"AxAxA\" contains 3 pairs -- 2 for A and 1 for x. Recursively compute the number of pairs in the given string.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: "axa"),
			Problem.TestCase(expectation: 2, arguments: "axax"),
			Problem.TestCase(expectation: 1, arguments: "axbx"),
			Problem.TestCase(expectation: 0, arguments: "hi"),
			Problem.TestCase(expectation: 3, arguments: "hihih"),
			Problem.TestCase(expectation: 3, arguments: "ihihhh"),
			Problem.TestCase(expectation: 0, arguments: "ihjxhh"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 0, arguments: "a"),
			Problem.TestCase(expectation: 0, arguments: "aa"),
			Problem.TestCase(expectation: 1, arguments: "aaa")
		],
		eulerMode: false
	),
	Problem(
		title: "countAbc",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Count recursively the total number of \"abc\" and \"aba\" substrings that appear in the given string.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: "abc"),
			Problem.TestCase(expectation: 2, arguments: "abcxxabc"),
			Problem.TestCase(expectation: 2, arguments: "abaxxaba"),
			Problem.TestCase(expectation: 2, arguments: "ababc"),
			Problem.TestCase(expectation: 0, arguments: "abxbc"),
			Problem.TestCase(expectation: 1, arguments: "aaabc"),
			Problem.TestCase(expectation: 0, arguments: "hello"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 0, arguments: "ab"),
			Problem.TestCase(expectation: 1, arguments: "aba"),
			Problem.TestCase(expectation: 0, arguments: "aca"),
			Problem.TestCase(expectation: 0, arguments: "aaa")
		],
		eulerMode: false
	),
	Problem(
		title: "count11",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute recursively (no loops) the number of \"11\" substrings in the string. The \"11\" substrings should not overlap.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 2, arguments: "11abc11"),
			Problem.TestCase(expectation: 3, arguments: "abc11x11x11"),
			Problem.TestCase(expectation: 1, arguments: "111"),
			Problem.TestCase(expectation: 2, arguments: "1111"),
			Problem.TestCase(expectation: 0, arguments: "1"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 0, arguments: "hi"),
			Problem.TestCase(expectation: 4, arguments: "11x111x1111"),
			Problem.TestCase(expectation: 1, arguments: "1x111"),
			Problem.TestCase(expectation: 0, arguments: "1Hello1"),
			Problem.TestCase(expectation: 0, arguments: "Hello")
		],
		eulerMode: false
	),
	Problem(
		title: "stringClean",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return recursively a \"cleaned\" string where adjacent characters that are the same have been reduced to a single char. So \"yyzzza\" yields \"yza\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "yza", arguments: "yyzzza"),
			Problem.TestCase(expectation: "abcd", arguments: "abbbcdd"),
			Problem.TestCase(expectation: "Helo", arguments: "Hello"),
			Problem.TestCase(expectation: "XabcY", arguments: "XXabcYY"),
			Problem.TestCase(expectation: "12ab45", arguments: "112ab445"),
			Problem.TestCase(expectation: "Helo Bokeper", arguments: "Hello Bookkeeper")
		],
		eulerMode: false
	),
	Problem(
		title: "countHi3",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute recursively the number of times lowercase \"hi\" appears in the string, however do not count \"hi\" that have an 'x' immedately before them.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: "ahixhi"),
			Problem.TestCase(expectation: 2, arguments: "ahibhi"),
			Problem.TestCase(expectation: 0, arguments: "xhixhi"),
			Problem.TestCase(expectation: 1, arguments: "hixhi"),
			Problem.TestCase(expectation: 2, arguments: "hixhhi"),
			Problem.TestCase(expectation: 3, arguments: "hihihi"),
			Problem.TestCase(expectation: 3, arguments: "hihihix"),
			Problem.TestCase(expectation: 2, arguments: "xhihihix"),
			Problem.TestCase(expectation: 0, arguments: "xxhi"),
			Problem.TestCase(expectation: 1, arguments: "hixxhi"),
			Problem.TestCase(expectation: 1, arguments: "hi"),
			Problem.TestCase(expectation: 0, arguments: "xxxx"),
			Problem.TestCase(expectation: 0, arguments: "h"),
			Problem.TestCase(expectation: 0, arguments: "x"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 1, arguments: "Hellohi")
		],
		eulerMode: false
	),
	Problem(
		title: "parenBit",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string that contains a single pair of parenthesis, compute recursively a new string made of only of the parenthesis and their contents, so \"xyz(abc)123\" yields \"(abc)\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "(abc)", arguments: "xyz(abc)123"),
			Problem.TestCase(expectation: "(hello)", arguments: "x(hello)"),
			Problem.TestCase(expectation: "(xy)", arguments: "(xy)1)"),
			Problem.TestCase(expectation: "(possible)", arguments: "not really (possible)"),
			Problem.TestCase(expectation: "(abc)", arguments: "(abc)"),
			Problem.TestCase(expectation: "(abc)", arguments: "(abc)xyz"),
			Problem.TestCase(expectation: "(abc)", arguments: "(abc)x"),
			Problem.TestCase(expectation: "(x)", arguments: "(x)"),
			Problem.TestCase(expectation: "()", arguments: "()"),
			Problem.TestCase(expectation: "(ipsa)", arguments: "res (ipsa) loquitor"),
			Problem.TestCase(expectation: "(not really)", arguments: "hello(not really)there"),
			Problem.TestCase(expectation: "(ab)", arguments: "ab(ab)ab")
		],
		eulerMode: false
	),
	Problem(
		title: "nestParen",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return true if it is a nesting of zero or more pairs of parenthesis, like \"(())\" or \"((()))\". Suggestion: check the first and last characters, and then recur on what's inside them.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "(())"),
			Problem.TestCase(expectation: true, arguments: "((()))"),
			Problem.TestCase(expectation: false, arguments: "(((x))"),
			Problem.TestCase(expectation: false, arguments: "((())"),
			Problem.TestCase(expectation: false, arguments: "((()()"),
			Problem.TestCase(expectation: true, arguments: "()"),
			Problem.TestCase(expectation: true, arguments: ""),
			Problem.TestCase(expectation: false, arguments: "(yy)"),
			Problem.TestCase(expectation: true, arguments: "(())"),
			Problem.TestCase(expectation: false, arguments: "(((y))"),
			Problem.TestCase(expectation: false, arguments: "((y)))"),
			Problem.TestCase(expectation: true, arguments: "((()))"),
			Problem.TestCase(expectation: false, arguments: "(())))"),
			Problem.TestCase(expectation: false, arguments: "((yy())))"),
			Problem.TestCase(expectation: true, arguments: "(((())))")
		],
		eulerMode: false
	),
	Problem(
		title: "strCount",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "sub", type: String.self)
		],
		prompt: "Given a string and a non-empty substring sub, compute recursively the number of times that sub appears in the string, without the sub strings overlapping.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 2, arguments: "catcowcat", "cat"),
			Problem.TestCase(expectation: 1, arguments: "catcowcat", "cow"),
			Problem.TestCase(expectation: 0, arguments: "catcowcat", "dog"),
			Problem.TestCase(expectation: 2, arguments: "cacatcowcat", "cat"),
			Problem.TestCase(expectation: 2, arguments: "xyx", "x"),
			Problem.TestCase(expectation: 4, arguments: "iiiijj", "i"),
			Problem.TestCase(expectation: 2, arguments: "iiiijj", "ii"),
			Problem.TestCase(expectation: 1, arguments: "iiiijj", "iii"),
			Problem.TestCase(expectation: 2, arguments: "iiiijj", "j"),
			Problem.TestCase(expectation: 1, arguments: "iiiijj", "jj"),
			Problem.TestCase(expectation: 4, arguments: "aaabababab", "ab"),
			Problem.TestCase(expectation: 1, arguments: "aaabababab", "aa"),
			Problem.TestCase(expectation: 6, arguments: "aaabababab", "a"),
			Problem.TestCase(expectation: 4, arguments: "aaabababab", "b")
		],
		eulerMode: false
	),
	Problem(
		title: "strCopies",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "sub", type: String.self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a string and a non-empty substring sub, compute recursively if at least n copies of sub appear in the string somewhere, possibly with overlapping. N will be non-negative.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "catcowcat", "cat", 2),
			Problem.TestCase(expectation: false, arguments: "catcowcat", "cow", 2),
			Problem.TestCase(expectation: true, arguments: "catcowcat", "cow", 1),
			Problem.TestCase(expectation: true, arguments: "iiijjj", "i", 3),
			Problem.TestCase(expectation: false, arguments: "iiijjj", "i", 4),
			Problem.TestCase(expectation: true, arguments: "iiijjj", "ii", 2),
			Problem.TestCase(expectation: false, arguments: "iiijjj", "ii", 3),
			Problem.TestCase(expectation: false, arguments: "iiijjj", "x", 3),
			Problem.TestCase(expectation: true, arguments: "iiijjj", "x", 0),
			Problem.TestCase(expectation: true, arguments: "iiiiij", "iii", 3),
			Problem.TestCase(expectation: false, arguments: "iiiiij", "iii", 4),
			Problem.TestCase(expectation: true, arguments: "ijiiiiij", "iiii", 2),
			Problem.TestCase(expectation: false, arguments: "ijiiiiij", "iiii", 3),
			Problem.TestCase(expectation: true, arguments: "dogcatdogcat", "dog", 2)
		],
		eulerMode: false
	),
	Problem(
		title: "strDist",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "sub", type: String.self)
		],
		prompt: "Given a string and a non-empty substring sub, compute recursively the largest substring which starts and ends with sub and return its length.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 9, arguments: "catcowcat", "cat"),
			Problem.TestCase(expectation: 3, arguments: "catcowcat", "cow"),
			Problem.TestCase(expectation: 9, arguments: "cccatcowcatxx", "cat"),
			Problem.TestCase(expectation: 12, arguments: "abccatcowcatcatxyz", "cat"),
			Problem.TestCase(expectation: 3, arguments: "xyx", "x"),
			Problem.TestCase(expectation: 1, arguments: "xyx", "y"),
			Problem.TestCase(expectation: 0, arguments: "xyx", "z"),
			Problem.TestCase(expectation: 1, arguments: "z", "z"),
			Problem.TestCase(expectation: 0, arguments: "x", "z"),
			Problem.TestCase(expectation: 0, arguments: "", "z"),
			Problem.TestCase(expectation: 13, arguments: "hiHellohihihi", "hi"),
			Problem.TestCase(expectation: 5, arguments: "hiHellohihihi", "hih"),
			Problem.TestCase(expectation: 1, arguments: "hiHellohihihi", "o"),
			Problem.TestCase(expectation: 2, arguments: "hiHellohihihi", "ll")
		],
		eulerMode: false
	)
	
]
