//
//  CodingBatWarmup1Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatWarmup1Problems: [Problem] = [
	Problem(
		title: "sleepIn",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "weekday", type: Bool.self),
			Problem.Parameter(name: "vacation", type: Bool.self)
		],
		prompt: "The parameter `weekday` is true if it is a weekday, and the parameter `vacation` is true if we are on vacation. We sleep in if it is not a weekday or we're on vacation. Return true if we sleep in.",
		solution: """
		func sleepIn(weekday: Bool, vacation: Bool) -> Bool {
			if !weekday || vacation {
				return true
			}

			return false

			// Solution notes:
			// Better to write "vacation" than "vacation == "true"
			// though they mean exactly the same thing.
			// Likewise "!weekday" is better than "weekday == false".
			// This can all be shortened to: return !weekday || vacation
			// Here we just put the return-false last,
			// or could use an if/else.
		}
		""",
		testCases: [
			Problem.TestCase(expectation: true, arguments: false, false),
			Problem.TestCase(expectation: false, arguments: true, false),
			Problem.TestCase(expectation: true, arguments: false, true),
			Problem.TestCase(expectation: true, arguments: true, true)
		]),
	Problem(
		title: "monkeyTrouble",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "aSmile", type: Bool.self),
			Problem.Parameter(name: "bSmile", type: Bool.self)
		],
		prompt: "We have two monkeys, a and b, and the parameters `aSmile` and `bSmile` indicate if each is smiling. We are in trouble if they are both smiling or if neither of them is smiling. Return true if we are in trouble.",
		solution: """
func monkeyTrouble(aSmile: Bool, bSmile: Bool) -> Bool {
	if aSmile && bSmile {
		return true
	}
	if !aSmile && !bSmile {
		return true
	}
	return false
	// The above can be shortened to:
	//    return (aSmile && bSmile) || (!aSmile && !bSmile)
	// Or this very short version:
	// (think about how this is the same as the above)
	//	  return aSmile == bSmile
}
""",
		testCases: [
			Problem.TestCase(expectation: true, arguments: true, true),
			Problem.TestCase(expectation: true, arguments: false, false),
			Problem.TestCase(expectation: false, arguments: true, false),
			Problem.TestCase(expectation: false, arguments: false, true)]
	),
	Problem(title: "sumDouble",
			returnType: Int.self,
			parameters: [
				Problem.Parameter(name: "a", type: Int.self),
				Problem.Parameter(name: "b", type: Int.self)
		],
			prompt: "Given two int values, return their sum. Unless the two values are the same, then return double their sum.",
			solution: """
func sumDouble(a: Int, b: Int) -> Int {
	// Store the sum in a local variable
	var sum = a + b
	
	// Double it if a and b are the same
	if a == b {
    	sum = sum * 2
  	}

	return sum
}
""",
			testCases: [
				Problem.TestCase(expectation: 3, arguments: 1, 2),
				Problem.TestCase(expectation: 5, arguments: 3, 2),
				Problem.TestCase(expectation: 8, arguments: 2, 2),
				Problem.TestCase(expectation: -1, arguments: -1, 0),
				Problem.TestCase(expectation: 12, arguments: 3, 3),
				Problem.TestCase(expectation: 0, arguments: 0, 0),
				Problem.TestCase(expectation: 1, arguments: 0, 1),
				Problem.TestCase(expectation: 7, arguments: 3, 4)
		]),
	Problem(
		title: "diff21",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given an int `n`, return the absolute difference between `n` and 21, except return double the absolute difference if `n` is over 21.",
		solution: """
func diff21(n: Int) -> Int {
	if n <= 21 {
		return 21 - n
	} else {
		return (n - 21) * 2
	}
}
""",
		testCases: [
			Problem.TestCase(expectation: 2, arguments: 19),
			Problem.TestCase(expectation: 11, arguments: 10),
			Problem.TestCase(expectation: 0, arguments: 21),
			Problem.TestCase(expectation: 2, arguments: 22),
			Problem.TestCase(expectation: 8, arguments: 25),
			Problem.TestCase(expectation: 18, arguments: 30),
			Problem.TestCase(expectation: 21, arguments: 0),
			Problem.TestCase(expectation: 20, arguments: 1),
			Problem.TestCase(expectation: 19, arguments: 2),
			Problem.TestCase(expectation: 22, arguments: -1),
			Problem.TestCase(expectation: 23, arguments: -2),
			Problem.TestCase(expectation: 58, arguments: 50)
		]),
	Problem(
		title: "parrotTrouble",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "talking", type: Bool.self),
			Problem.Parameter(name: "hour", type: Int.self)
		],
		prompt: "We have a loud talking parrot. The \"`hour`\" parameter is the current hour time in the range 0..23. We are in trouble if the parrot is talking and the hour is before 7 or after 20. Return true if we are in trouble.",
		solution: """
func parrotTrouble(talking: Bool, hour: Int) -> Bool {
	return talking && (hour < 7 || hour > 20)
	// Need parenthesis around the || clause
	// since && binds more tightly than ||
	// && is like arithmetic *, || is like arithmetic +
}
""",
		testCases: [
			Problem.TestCase(expectation: true, arguments: true, 6),
			Problem.TestCase(expectation: false, arguments: true, 7),
			Problem.TestCase(expectation: false, arguments: false, 6),
			Problem.TestCase(expectation: true, arguments: true, 21),
			Problem.TestCase(expectation: false, arguments: false, 21),
			Problem.TestCase(expectation: false, arguments: false, 20),
			Problem.TestCase(expectation: true, arguments: true, 23),
			Problem.TestCase(expectation: false, arguments: false, 23),
			Problem.TestCase(expectation: false, arguments: true, 20),
			Problem.TestCase(expectation: false, arguments: false, 12),
			]),
	Problem(
		title: "makes10",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given 2 Ints, a and b, return true if one of them is 10 or if their sum is 10.",
		solution: """
func makes10(a: Int, b: Int) -> Bool {
	return a == 10 || b == 10 || a+b == 10
}
""",
		testCases: [
			Problem.TestCase(expectation: true, arguments: 9, 10),
			Problem.TestCase(expectation: false, arguments: 9, 9),
			Problem.TestCase(expectation: true, arguments: 1, 9),
			Problem.TestCase(expectation: true, arguments: 10, 1),
			Problem.TestCase(expectation: true, arguments: 10, 10),
			Problem.TestCase(expectation: true, arguments: 8, 2),
			Problem.TestCase(expectation: false, arguments: 8, 3),
			Problem.TestCase(expectation: true, arguments: 10, 42),
			Problem.TestCase(expectation: true, arguments: 12, -2),
			]),
	Problem(
		title: "nearHundred",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given an int n, return true if it is within 10 of 100 or 200. Note: `abs(num)` computes the absolute value of a number.",
		solution: """
func nearHundred(n: Int) -> Bool {
	return (abs(100 - n) <= 10) || (abs(200 - n) <= 10)
}
""",
		testCases: [
			Problem.TestCase(expectation: true, arguments: 93),
			Problem.TestCase(expectation: true, arguments: 90),
			Problem.TestCase(expectation: false, arguments: 89),
			Problem.TestCase(expectation: true, arguments: 110),
			Problem.TestCase(expectation: false, arguments: 111),
			Problem.TestCase(expectation: false, arguments: 121),
			Problem.TestCase(expectation: false, arguments: 0),
			Problem.TestCase(expectation: false, arguments: 5),
			Problem.TestCase(expectation: true, arguments: 191),
			Problem.TestCase(expectation: false, arguments: 189),
			Problem.TestCase(expectation: true, arguments: 190),
			Problem.TestCase(expectation: true, arguments: 200),
			Problem.TestCase(expectation: true, arguments: 210),
			Problem.TestCase(expectation: false, arguments: 211),
			Problem.TestCase(expectation: false, arguments: 290),
			
			]),
	Problem(title: "posNeg",
			returnType: Bool.self,
			parameters: [
				Problem.Parameter(name: "a", type: Int.self),
				Problem.Parameter(name: "b", type: Int.self),
				Problem.Parameter(name: "negative", type: Bool.self)
		],
			prompt: "Given 2 int values, return true if one is negative and one is positive. Except if the parameter \"`negative`\" is true, then return true only if both are negative.",
			solution: """
			func posNeg(a: Int, b: Int, negative: Bool) -> Bool {
				if negative {
					return a < 0 && b < 0
				} else {
					return (a < 0 && b > 0) || (a > 0 && b < 0)
				}
			}
			""",
			testCases: [
				Problem.TestCase(expectation: true, arguments: 1, -1, false),
				Problem.TestCase(expectation: true, arguments: -1, 1, false),
				Problem.TestCase(expectation: true, arguments: -4, -5, true),
				Problem.TestCase(expectation: false, arguments: -4, -5, false),
				Problem.TestCase(expectation: true, arguments: -4, 5, false),
				Problem.TestCase(expectation: false, arguments: -4, 5, true),
				Problem.TestCase(expectation: false, arguments: 1, 1, false),
				Problem.TestCase(expectation: false, arguments: -1, -1, false),
				Problem.TestCase(expectation: false, arguments: 1, -1, true),
				Problem.TestCase(expectation: false, arguments: -1, 1, true),
				Problem.TestCase(expectation: false, arguments: 1, 1, true),
				Problem.TestCase(expectation: true, arguments: -1, -1, true),
				Problem.TestCase(expectation: true, arguments: 5, -5, false),
				Problem.TestCase(expectation: true, arguments: -6, 6, false),
				Problem.TestCase(expectation: false, arguments: -5, -6, false),
				Problem.TestCase(expectation: false, arguments: -2, -1, false),
				Problem.TestCase(expectation: false, arguments: 1, 2, false),
				Problem.TestCase(expectation: false, arguments: -5, 6, true),
				Problem.TestCase(expectation: true, arguments: -5, -5, true),
				
				]),
	Problem(title: "notString",
			returnType: String.self,
			parameters: [Problem.Parameter(name: "str", type: String.self)],
			prompt: "Given a string, return a new string where \"not \" has been added to the front. However, if the string already begins with \"not\", return the string unchanged.",
			solution: """
			func notString(str: String) -> String {
				if str.hasPrefix("not") {
					return str
				}
				
				return "not " + str
			}
			""",
			testCases: [
				Problem.TestCase(expectation: "not candy", arguments: "candy"),
				Problem.TestCase(expectation: "not x", arguments: "x"),
				Problem.TestCase(expectation: "not bad", arguments: "not bad"),
				Problem.TestCase(expectation: "not bad", arguments: "bad"),
				Problem.TestCase(expectation: "not", arguments: "not"),
				Problem.TestCase(expectation: "not is not", arguments: "is not"),
				Problem.TestCase(expectation: "not no", arguments: "no")
		]),
	Problem(
		title: "front3",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, we'll say that the front is the first 3 characters of the string. If the string length is less than 3, the front is whatever is there. Return a new string which is 3 copies of the front.",
		solution: """
		func front3(str: String) -> String {
			let front = String(str.prefix(3))
			
			return front + front + front
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "SwiSwiSwi", arguments: "Swift"),
			Problem.TestCase(expectation: "ChoChoCho", arguments: "Chocolate"),
			Problem.TestCase(expectation: "abcabcabc", arguments: "abc"),
			Problem.TestCase(expectation: "abcabcabc", arguments: "abcXYZ"),
			Problem.TestCase(expectation: "ababab", arguments: "ab"),
			Problem.TestCase(expectation: "aaa", arguments: "a"),
			Problem.TestCase(expectation: "", arguments: "")
		],
		eulerMode: false
	),
	Problem(
		title: "or35",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Return true if the given non-negative number is a multiple of 3 or a multiple of 5. Use the `%` (remainder) operator.",
		solution: """
		func or35(n: Int) -> Bool {
			return n % 3 == 0 || n % 5 == 0
		}
		""",
		hint: "https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID64",
		testCases: [
			Problem.TestCase(expectation: true, arguments: 3),
			Problem.TestCase(expectation: true, arguments: 10),
			Problem.TestCase(expectation: false, arguments: 8),
			Problem.TestCase(expectation: true, arguments: 15),
			Problem.TestCase(expectation: true, arguments: 5),
			Problem.TestCase(expectation: true, arguments: 9),
			Problem.TestCase(expectation: false, arguments: 4),
			Problem.TestCase(expectation: false, arguments: 7),
			Problem.TestCase(expectation: true, arguments: 6),
			Problem.TestCase(expectation: false, arguments: 17),
			Problem.TestCase(expectation: true, arguments: 18),
			Problem.TestCase(expectation: false, arguments: 29),
			Problem.TestCase(expectation: true, arguments: 20),
			Problem.TestCase(expectation: true, arguments: 21),
			Problem.TestCase(expectation: false, arguments: 22),
			Problem.TestCase(expectation: true, arguments: 45),
			Problem.TestCase(expectation: true, arguments: 99),
			Problem.TestCase(expectation: true, arguments: 100),
			Problem.TestCase(expectation: false, arguments: 101),
			Problem.TestCase(expectation: false, arguments: 121),
			Problem.TestCase(expectation: false, arguments: 122),
			Problem.TestCase(expectation: true, arguments: 123)
		],
		eulerMode: false
	),
	Problem(
		title: "startHi",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return true if the string starts with \"hi\" and false otherwise.",
		solution: """
		func startHi(str: String) -> Bool {
			return str.hasPrefix("hi")
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "hi there"),
			Problem.TestCase(expectation: true, arguments: "hi"),
			Problem.TestCase(expectation: false, arguments: "hello hi"),
			Problem.TestCase(expectation: false, arguments: "he"),
			Problem.TestCase(expectation: false, arguments: "h"),
			Problem.TestCase(expectation: false, arguments: ""),
			Problem.TestCase(expectation: false, arguments: "ho hi"),
			Problem.TestCase(expectation: true, arguments: "hi ho")
		],
		eulerMode: false
	),
	Problem(
		title: "icyHot",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "temp1", type: Int.self),
			Problem.Parameter(name: "temp2", type: Int.self)
		],
		prompt: "Given two temperatures, return true if one is less than 0 and the other is greater than 100.",
		solution: """
		func icyHot(temp1: Int, temp2: Int) -> Bool {
			if (temp1 < 0 && temp2 > 100) || (temp1 > 100 && temp2 < 0) {
				return true
			} else {
				return false
			}
			// Could be written as: return (temp1 < 0 && ...)
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 120, -1),
			Problem.TestCase(expectation: true, arguments: -1, 120),
			Problem.TestCase(expectation: false, arguments: 2, 120),
			Problem.TestCase(expectation: false, arguments: -1, 100),
			Problem.TestCase(expectation: false, arguments: -2, -2),
			Problem.TestCase(expectation: false, arguments: 120, 120)
		],
		eulerMode: false
	),
	Problem(
		title: "in1020",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given 2 int values, return true if either of them is in the range 10...20.",
		solution: """
		func in1020(a: Int, b: Int) -> Bool {
			return (a >= 10 && a <= 20) || (b >= 10 && b <= 20)
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 12, 99),
			Problem.TestCase(expectation: true, arguments: 21, 12),
			Problem.TestCase(expectation: false, arguments: 8, 99),
			Problem.TestCase(expectation: true, arguments: 99, 10),
			Problem.TestCase(expectation: true, arguments: 20, 20),
			Problem.TestCase(expectation: false, arguments: 21, 21),
			Problem.TestCase(expectation: false, arguments: 9, 9)
		],
		eulerMode: false
	),
	Problem(
		title: "hasTeen",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "We'll say that a number is \"teen\" if it is in the range 13...19. Given 3 int values, return true if 1 or more of them are teen.",
		solution: """
		func hasTeen(a: Int, b: Int, c: Int) -> Bool {
			// Here it is written as one big expression,
			// vs. a series of if-statements.
			return (a>=13 && a<=19) ||
				   (b>=13 && b<=19) ||
				   (c>=13 && c<=19)
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 13, 20, 10),
			Problem.TestCase(expectation: true, arguments: 20, 19, 10),
			Problem.TestCase(expectation: true, arguments: 20, 10, 13),
			Problem.TestCase(expectation: false, arguments: 1, 20, 12),
			Problem.TestCase(expectation: true, arguments: 19, 20, 12),
			Problem.TestCase(expectation: true, arguments: 12, 20, 19),
			Problem.TestCase(expectation: false, arguments: 12, 9, 20),
			Problem.TestCase(expectation: true, arguments: 12, 18, 20),
			Problem.TestCase(expectation: true, arguments: 14, 2, 20),
			Problem.TestCase(expectation: false, arguments: 4, 2, 20),
			Problem.TestCase(expectation: false, arguments: 11, 22, 22)
		],
		eulerMode: false
	),
	Problem(
		title: "loneTeen",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "We'll say that a number is \"teen\" if it is in the range 13..19 inclusive. Given 2 int values, return true if one or the other is teen, but not both.",
		solution: """
		func loneTeen(a: Int, b: Int) -> Bool {
			// Store teen-ness in boolean local vars first. Boolean local
			// vars like this are a little rare, but here they work great.
			let aTeen = a >= 13 && a <= 19
			let bTeen = b >= 13 && b <= 19
			
			return (aTeen && !bTeen) || (!aTeen && bTeen)
			// Translation: one or the other, but not both.
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 13, 99),
			Problem.TestCase(expectation: true, arguments: 21, 19),
			Problem.TestCase(expectation: false, arguments: 13, 13),
			Problem.TestCase(expectation: true, arguments: 14, 20),
			Problem.TestCase(expectation: true, arguments: 20, 15),
			Problem.TestCase(expectation: false, arguments: 16, 17),
			Problem.TestCase(expectation: true, arguments: 16, 9),
			Problem.TestCase(expectation: false, arguments: 16, 18),
			Problem.TestCase(expectation: false, arguments: 13, 19),
			Problem.TestCase(expectation: true, arguments: 13, 20),
			Problem.TestCase(expectation: true, arguments: 6, 18),
			Problem.TestCase(expectation: true, arguments: 99, 13),
			Problem.TestCase(expectation: false, arguments: 99, 99)
		],
		eulerMode: false
	),
	Problem(
		title: "intMax",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "Given three int values, `a` `b` `c`, return the largest.",
		solution: """
		func intMax(a: Int, b: Int, c: Int) -> Int {
			var max: Int
			
			// First check between a and b
			if a > b {
				max = a
			} else {
				max = b
			}
			
			// Now check between max and c
			if c > max {
				max = c
			}
			
			return max
			
			// Could use the built in max(x, y) function
			// which selects the larger of two values.
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 3, arguments: 1, 2, 3),
			Problem.TestCase(expectation: 3, arguments: 1, 3, 2),
			Problem.TestCase(expectation: 3, arguments: 3, 2, 1),
			Problem.TestCase(expectation: 9, arguments: 9, 3, 3),
			Problem.TestCase(expectation: 9, arguments: 3, 9, 3),
			Problem.TestCase(expectation: 9, arguments: 3, 3, 9),
			Problem.TestCase(expectation: 8, arguments: 8, 2, 3),
			Problem.TestCase(expectation: -1, arguments: -3, -1, -2),
			Problem.TestCase(expectation: 6, arguments: 6, 2, 5),
			Problem.TestCase(expectation: 6, arguments: 5, 6, 2),
			Problem.TestCase(expectation: 6, arguments: 5, 2, 6)
		],
		eulerMode: false
	),
	Problem(
		title: "close10",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given 2 int values, return whichever value is nearest to the value 10, or return 0 in the event of a tie. Note that `abs(n)` returns the absolute value of a number.",
		solution: """
		func close10(a: Int, b: Int) -> Int {
			let aDiff = abs(a - 10)
			let bDiff = abs(b - 10)
			
			if aDiff < bDiff {
				return a
			}
			if bDiff < aDiff {
				return b
			}
			return 0 // i.e. aDiff == bDiff
			
			// Solution notes: aDiff/bDiff local vars
			// clean up the code a bit.
			// Could have "else" before the second if
			// and then return 0.
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 8, arguments: 8, 13),
			Problem.TestCase(expectation: 8, arguments: 13, 8),
			Problem.TestCase(expectation: 0, arguments: 13, 7),
			Problem.TestCase(expectation: 0, arguments: 7, 13),
			Problem.TestCase(expectation: 9, arguments: 9, 13),
			Problem.TestCase(expectation: 8, arguments: 13, 8),
			Problem.TestCase(expectation: 10, arguments: 10, 12),
			Problem.TestCase(expectation: 10, arguments: 11, 10),
			Problem.TestCase(expectation: 5, arguments: 5, 21),
			Problem.TestCase(expectation: 0, arguments: 0, 20),
			Problem.TestCase(expectation: 0, arguments: 10, 10)
		],
		eulerMode: false
	),
	Problem(
		title: "in3050",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given 2 int values, return true if they are both in the range 30...40, or they are both in the range 40...50.",
		solution: """
		func in3050(a: Int, b: Int) -> Bool {
			if a >= 30 && a <= 40 && b >= 30 && b <= 40 {
				return true
			}
			if a >= 40 && a <= 50 && b >= 40 && b <= 50 {
				return true
			}
			return false
			// This could be written as one very large expression,
			// connecting the two main parts with ||
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 30, 31),
			Problem.TestCase(expectation: false, arguments: 30, 41),
			Problem.TestCase(expectation: true, arguments: 40, 50),
			Problem.TestCase(expectation: false, arguments: 40, 51),
			Problem.TestCase(expectation: false, arguments: 39, 50),
			Problem.TestCase(expectation: false, arguments: 50, 39),
			Problem.TestCase(expectation: true, arguments: 40, 39),
			Problem.TestCase(expectation: true, arguments: 49, 48),
			Problem.TestCase(expectation: true, arguments: 50, 40),
			Problem.TestCase(expectation: false, arguments: 50, 51),
			Problem.TestCase(expectation: true, arguments: 35, 36),
			Problem.TestCase(expectation: false, arguments: 35, 45)
		],
		eulerMode: false
	),
	Problem(
		title: "max1020",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given 2 positive int values, return the larger value that is in the range 10...20, or return 0 if neither is in that range.",
		solution: """
		func max1020(a: Int, b: Int) -> Int {
			// First figure out the larger and smaller numbers
			var larger = a
			var smaller = b
			
			if b > a {
				larger = b
				smaller = a
			}
			
			// Check the larger value first
			if larger >= 10 && larger <= 20 {
				return larger
			}
			if smaller >= 10 && smaller <= 20 {
				return smaller
			}
			return 0
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 19, arguments: 11, 19),
			Problem.TestCase(expectation: 19, arguments: 19, 11),
			Problem.TestCase(expectation: 11, arguments: 11, 9),
			Problem.TestCase(expectation: 0, arguments: 9, 21),
			Problem.TestCase(expectation: 10, arguments: 10, 21),
			Problem.TestCase(expectation: 10, arguments: 21, 10),
			Problem.TestCase(expectation: 11, arguments: 9, 11),
			Problem.TestCase(expectation: 10, arguments: 23, 10),
			Problem.TestCase(expectation: 20, arguments: 20, 10),
			Problem.TestCase(expectation: 20, arguments: 7, 20),
			Problem.TestCase(expectation: 17, arguments: 17, 16)
		],
		eulerMode: false
	),
	Problem(
		title: "stringE",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Return true if the given string contains between 1 and 3 'e' characters.",
		solution: """
		func stringE(str: String) -> Bool {
			var count = 0
			
			for char in str {
				if char == "e" {
					count += 1
				}
			}
			
			return count >= 1 && count <= 3
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "Hello"),
			Problem.TestCase(expectation: true, arguments: "Heelle"),
			Problem.TestCase(expectation: false, arguments: "Heelele"),
			Problem.TestCase(expectation: false, arguments: "Hll"),
			Problem.TestCase(expectation: true, arguments: "e"),
			Problem.TestCase(expectation: false, arguments: "")
		],
		eulerMode: false
	),
	Problem(
		title: "lastDigit",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given two non-negative int values, return true if they have the same last digit, such as with 27 and 57. Note that the `%` (remainder) operator computes remainders, so `17 % 10` is 7.",
		solution: """
		func lastDigit(a: Int, b: Int) -> Bool {
			// True if the last digits are the same
			return a % 10 == b % 10
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 7, 17),
			Problem.TestCase(expectation: false, arguments: 6, 17),
			Problem.TestCase(expectation: true, arguments: 3, 113),
			Problem.TestCase(expectation: false, arguments: 114, 113),
			Problem.TestCase(expectation: true, arguments: 114, 4),
			Problem.TestCase(expectation: true, arguments: 10, 0),
			Problem.TestCase(expectation: false, arguments: 11, 0)
		],
		eulerMode: false
	)
	
]
