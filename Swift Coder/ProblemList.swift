//
//  ProblemList.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 4/16/16.
//  Copyright © 2016 Josh Birnholz. All rights reserved.
//

enum ProblemSet: String, CaseIterable {
	case codingBatWarmup1 = "CodingBat: Warmup-1"
	case codingBatWarmup2 = "CodingBat: Warmup-2"
	case codingBatString1 = "CodingBat: String-1"
	case codingBatArray1 = "CodingBat: Array-1"
	case codingBatLogic1 = "CodingBat: Logic-1"
	case codingBatLogic2 = "CodingBat: Logic-2"
	case codingBatString2 = "CodingBat: String-2"
	case codingBatString3 = "CodingBat: String-3"
	case codingBatArray2 = "CodingBat: Array-2"
	case codingBatArray3 = "CodingBat: Array-3"
	case codingBatAP1 = "CodingBat: AP-1"
	case codingBatRecursion1 = "CodingBat: Recursion-1"
	case projectEuler = "Project Euler"
	
	var problems: [Problem] {
		switch self {
		case .codingBatWarmup1: return codingBatWarmup1Problems
		case .codingBatWarmup2: return codingBatWarmup2Problems
		case .codingBatLogic1: return codingBatLogic1Problems
		case .codingBatArray1: return codingBatArray1Problems
		case .codingBatString1: return codingBatString1Problems
		case .codingBatLogic2: return codingBatLogic2Problems
		case .codingBatAP1: return codingBatAP1Problems
		case .codingBatRecursion1: return codingBatRecursion1Problems
		case .projectEuler: return eulerProblems
		case .codingBatString2:
			return codingBatString2Problems
		case .codingBatString3:
			return codingBatString3Problems
		case .codingBatArray2:
			return codingBatArray2Problems
		case .codingBatArray3:
			return codingBatArray3roblems
		}
	}
}

// MARK: - CodingBat

// MARK: Warmup1
fileprivate let codingBatWarmup1Problems = [
	Problem(
		title: "sleepIn",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "weekday", type: Bool.self),
			Problem.Parameter(name: "vacation", type: Bool.self)
		],
		prompt: "The parameter weekday is true if it is a weekday, and the parameter vacation is true if we are on vacation. We sleep in if it is not a weekday or we're on vacation. Return true if we sleep in.",
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
		prompt: "We have two monkeys, a and b, and the parameters aSmile and bSmile indicate if each is smiling. We are in trouble if they are both smiling or if neither of them is smiling. Return true if we are in trouble.",
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
		prompt: "Given an int n, return the absolute difference between n and 21, except return double the absolute difference if n is over 21.",
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
		prompt: "We have a loud talking parrot. The \"hour\" parameter is the current hour time in the range 0..23. We are in trouble if the parrot is talking and the hour is before 7 or after 20. Return true if we are in trouble.",
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
		prompt: "Given an int n, return true if it is within 10 of 100 or 200. Note: abs(num) computes the absolute value of a number.",
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
			prompt: "Given 2 int values, return true if one is negative and one is positive. Except if the parameter \"negative\" is true, then return true only if both are negative.",
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
		prompt: "Given a string, we'll say that the front is the first 3 chars of the string. If the string length is less than 3, the front is whatever is there. Return a new string which is 3 copies of the front.",
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
		prompt: "Return true if the given non-negative number is a multiple of 3 or a multiple of 5. Use the % (remainder) operator.",
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
		prompt: "Given three int values, a b c, return the largest.",
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
		prompt: "Given 2 int values, return whichever value is nearest to the value 10, or return 0 in the event of a tie. Note that abs(n) returns the absolute value of a number.",
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
		prompt: "Return true if the given string contains between 1 and 3 'e' chars.",
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
		prompt: "Given two non-negative int values, return true if they have the same last digit, such as with 27 and 57. Note that the % (remainder) operator computes remainders, so 17 % 10 is 7.",
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

// MARK: Warmup-2
fileprivate let codingBatWarmup2Problems = [
	Problem(
		title: "stringTimes",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a string and a non-negative int n, return a larger string that is n copies of the original string.",
		solution: """
		func stringTimes(str: String, n: Int) -> String {
			var result = ""
			
			for _ in 0 ..< n {
				result = result + str // could use += here
			}
			
			return result
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "HiHi", arguments: "Hi", 2),
			Problem.TestCase(expectation: "HiHiHi", arguments: "Hi", 3),
			Problem.TestCase(expectation: "Hi", arguments: "Hi", 1),
			Problem.TestCase(expectation: "", arguments: "Hi", 0),
			Problem.TestCase(expectation: "HiHiHiHiHi", arguments: "Hi", 5),
			Problem.TestCase(expectation: "Oh Boy!Oh Boy!", arguments: "Oh Boy!", 2),
			Problem.TestCase(expectation: "xxxx", arguments: "x", 4),
			Problem.TestCase(expectation: "", arguments: "", 4),
			Problem.TestCase(expectation: "codecode", arguments: "code", 2),
			Problem.TestCase(expectation: "codecodecode", arguments: "code", 3)
		],
		eulerMode: false
	),
	Problem(
		title: "frontTimes",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a string and a non-negative int n, we'll say that the front of the string is the first 3 chars, or whatever is there if the string is less than length 3. Return n copies of the front;",
		solution: """
		func frontTimes(str: String, n: Int) -> String {
			let front = String(str.prefix(3))
			
			var result = ""
			
			for _ in 0 ..< n {
				result = result + front
			}
			return result
		}
""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ChoCho", arguments: "Chocolate", 2),
			Problem.TestCase(expectation: "ChoChoCho", arguments: "Chocolate", 3),
			Problem.TestCase(expectation: "AbcAbcAbc", arguments: "Abc", 3),
			Problem.TestCase(expectation: "AbAbAbAb", arguments: "Ab", 4),
			Problem.TestCase(expectation: "AAAA", arguments: "A", 4),
			Problem.TestCase(expectation: "", arguments: "", 4),
			Problem.TestCase(expectation: "", arguments: "Abc", 0)
		],
		eulerMode: false
	),
	Problem(
		title: "arrayCount9",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return the number of 9's in the array.",
		solution: """
		func arrayCount9(nums: [Int]) -> Int {
			return nums.filter { $0 == 9 }.count
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: [1, 2, 9]),
			Problem.TestCase(expectation: 2, arguments: [1, 9, 9]),
			Problem.TestCase(expectation: 3, arguments: [1, 9, 9, 3, 9]),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: 0, arguments: [Int]()),
			Problem.TestCase(expectation: 0, arguments: [4, 2, 4, 3, 1]),
			Problem.TestCase(expectation: 1, arguments: [9, 2, 4, 3, 1])
		],
		eulerMode: false
	),
	Problem(
		title: "arrayFront9",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if one of the first 4 elements in the array is a 9. The array length may be less than 4.",
		solution: """
		func arrayFront9(nums: [Int]) -> Bool {
			return nums.prefix(4).contains(9)
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 2, 9, 3, 4]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4, 9]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3, 4, 5]),
			Problem.TestCase(expectation: true, arguments: [9, 2, 3]),
			Problem.TestCase(expectation: true, arguments: [1, 9, 9]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: true, arguments: [1, 9]),
			Problem.TestCase(expectation: false, arguments: [5, 5]),
			Problem.TestCase(expectation: false, arguments: [2]),
			Problem.TestCase(expectation: true, arguments: [9]),
			Problem.TestCase(expectation: false, arguments: [Int]()),
			Problem.TestCase(expectation: true, arguments: [3, 9, 2, 3, 3])
		],
		eulerMode: false
	),
	Problem(
		title: "array123",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if the sequence of numbers 1, 2, 3 appears in the array somewhere.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 1, 2, 3, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 2, 4, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 2, 1, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 2, 1, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3, 1, 2, 3]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 3]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 2]),
			Problem.TestCase(expectation: false, arguments: [1]),
			Problem.TestCase(expectation: false, arguments: [Int]())
		],
		eulerMode: false
	),
	Problem(
		title: "array667",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return the number of times that two 6's are next to each other in the array. Also count instances where the second \"6\" is actually a 7.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: [6, 6, 2]),
			Problem.TestCase(expectation: 1, arguments: [6, 6, 2, 6]),
			Problem.TestCase(expectation: 1, arguments: [6, 7, 2, 6]),
			Problem.TestCase(expectation: 2, arguments: [6, 6, 2, 6, 7]),
			Problem.TestCase(expectation: 0, arguments: [1, 6, 3]),
			Problem.TestCase(expectation: 0, arguments: [6, 1]),
			Problem.TestCase(expectation: 0, arguments: [Int]()),
			Problem.TestCase(expectation: 1, arguments: [3, 6, 7, 6]),
			Problem.TestCase(expectation: 2, arguments: [3, 6, 6, 7]),
			Problem.TestCase(expectation: 1, arguments: [6, 3, 6, 6]),
			Problem.TestCase(expectation: 2, arguments: [6, 7, 6, 6]),
			Problem.TestCase(expectation: 0, arguments: [1, 2, 3, 5, 6]),
			Problem.TestCase(expectation: 1, arguments: [1, 2, 3, 6, 6])
		],
		eulerMode: false
	),
	Problem(
		title: "noTriples",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, we'll say that a triple is a value appearing 3 times in a row in the array. Return true if the array does not contain any triples.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 1, 2, 2, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 2, 2, 2, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1, 2, 2, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 2, 2, 1, 2, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 2, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 1]),
			Problem.TestCase(expectation: true, arguments: [1, 1]),
			Problem.TestCase(expectation: true, arguments: [1]),
			Problem.TestCase(expectation: true, arguments: [Int]())
		],
		eulerMode: false
	),
	Problem(
		title: "has271",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of ints, return true if it contains a 2, 7, 1 pattern: a value, followed by the value plus 5, followed by the value minus 1. Additionally the 271 counts even if the \"1\" differs by 2 or less from the correct value.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: [1, 2, 7, 1]),
			Problem.TestCase(expectation: false, arguments: [1, 2, 8, 1]),
			Problem.TestCase(expectation: true, arguments: [2, 7, 1]),
			Problem.TestCase(expectation: true, arguments: [3, 8, 2]),
			Problem.TestCase(expectation: true, arguments: [2, 7, 3]),
			Problem.TestCase(expectation: false, arguments: [2, 7, 4]),
			Problem.TestCase(expectation: true, arguments: [2, 7, -1]),
			Problem.TestCase(expectation: false, arguments: [2, 7, -2]),
			Problem.TestCase(expectation: true, arguments: [4, 5, 3, 8, 0]),
			Problem.TestCase(expectation: true, arguments: [2, 7, 5, 10, 4]),
			Problem.TestCase(expectation: true, arguments: [2, 7, -2, 4, 9, 3]),
			Problem.TestCase(expectation: false, arguments: [2, 7, 5, 10, 1]),
			Problem.TestCase(expectation: false, arguments: [2, 7, -2, 4, 10, 2]),
			Problem.TestCase(expectation: false, arguments: [1, 1, 4, 9, 0]),
			Problem.TestCase(expectation: true, arguments: [1, 1, 4, 9, 4, 9, 2])
		],
		eulerMode: false
	)


]

// MARK: Logic-1
fileprivate let codingBatLogic1Problems = [
	Problem(title: "cigarParty",
			returnType: Bool.self,
			parameters: [
				Problem.Parameter(name: "cigars", type: Int.self),
				Problem.Parameter(name: "isWeekend", type: Bool.self)
		],
			prompt: "When squirrels get together for a party, they like to have cigars. A squirrel party is successful when the number of cigars is between 40 and 60, inclusive. Unless it is the weekend, in which case there is no upper bound on the number of cigars. Return true if the party with the given values is successful, or false otherwise.",
			testCases: [
				Problem.TestCase(expectation: false, arguments: 30, false),
				Problem.TestCase(expectation: true, arguments: 50, false),
				Problem.TestCase(expectation: true, arguments: 70, true),
				Problem.TestCase(expectation: false, arguments: 30, true),
				Problem.TestCase(expectation: true, arguments: 50, true),
				Problem.TestCase(expectation: true, arguments: 60, false),
				Problem.TestCase(expectation: false, arguments: 61, false),
				Problem.TestCase(expectation: true, arguments: 40, false),
				Problem.TestCase(expectation: false, arguments: 39, false),
				Problem.TestCase(expectation: true, arguments: 40, true),
				Problem.TestCase(expectation: false, arguments: 39, true),

				]),
	Problem(title: "dateFashion",
			returnType: Int.self,
			parameters: [
				Problem.Parameter(name: "you", type: Int.self),
				Problem.Parameter(name: "date", type: Int.self)
		],
			prompt: "You and your date are trying to get a table at a restaurant. The parameter \"you\" is the stylishness of your clothes, in the range 0..10, and \"date\" is the stylishness of your date's clothes. The result getting the table is encoded as an int value with 0=no, 1=maybe, 2=yes. If either of you is very stylish, 8 or more, then the result is 2 (yes). With the exception that if either of you has style of 2 or less, then the result is 0 (no). Otherwise the result is 1 (maybe).",
			testCases: [
				Problem.TestCase(expectation: 2, arguments: 5, 10),
				Problem.TestCase(expectation: 0, arguments: 5, 2),
				Problem.TestCase(expectation: 1, arguments: 5, 5),
				Problem.TestCase(expectation: 1, arguments: 3, 3),
				Problem.TestCase(expectation: 0, arguments: 10, 2),
				Problem.TestCase(expectation: 0, arguments: 2, 9),
				Problem.TestCase(expectation: 2, arguments: 9, 9),
				Problem.TestCase(expectation: 2, arguments: 10, 5),
				Problem.TestCase(expectation: 0, arguments: 2, 2),
				Problem.TestCase(expectation: 1, arguments: 3, 7),
				Problem.TestCase(expectation: 0, arguments: 2, 7),
				Problem.TestCase(expectation: 0, arguments: 6, 2),

				]),
	Problem(title: "squirrelPlay",
			returnType: Bool.self,
			parameters: [
				Problem.Parameter(name: "temp", type: Int.self),
				Problem.Parameter(name: "isSummer", type: Bool.self)
		],
			prompt: "The squirrels in Palo Alto spend most of the day playing. In particular, they play if the temperature is between 60 and 90 (inclusive). Unless it is summer, then the upper limit is 100 instead of 90. Given an int temperature and a boolean isSummer, return true if the squirrels play and false otherwise.",
			testCases: [
				Problem.TestCase(expectation: true, arguments: 70, false),
				Problem.TestCase(expectation: false, arguments: 95, false),
				Problem.TestCase(expectation: true, arguments: 95, true),
				Problem.TestCase(expectation: true, arguments: 90, false),
				Problem.TestCase(expectation: true, arguments: 90, true),
				Problem.TestCase(expectation: false, arguments: 50, false),
				Problem.TestCase(expectation: false, arguments: 50, true),
				Problem.TestCase(expectation: false, arguments: 100, false),
				Problem.TestCase(expectation: true, arguments: 100, true),
				Problem.TestCase(expectation: false, arguments: 105, true),
				Problem.TestCase(expectation: false, arguments: 59, false),
				Problem.TestCase(expectation: false, arguments: 59, true),
				Problem.TestCase(expectation: true, arguments: 60, false),

		]),
	Problem(
		title: "caughtSpeeding",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "speed", type: Int.self),
			Problem.Parameter(name: "isBirthday", type: Bool.self)
		],
		prompt: "You are driving a little too fast, and a police officer stops you. Write code to compute the result, encoded as an int value: 0=no ticket, 1=small ticket, 2=big ticket. If speed is 60 or less, the result is 0. If speed is between 61 and 80 inclusive, the result is 1. If speed is 81 or more, the result is 2. Unless it is your birthday -- on that day, your speed can be 5 higher in all cases.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 0, arguments: 60, false),
			Problem.TestCase(expectation: 1, arguments: 65, false),
			Problem.TestCase(expectation: 0, arguments: 65, true),
			Problem.TestCase(expectation: 1, arguments: 80, false),
			Problem.TestCase(expectation: 2, arguments: 85, false),
			Problem.TestCase(expectation: 1, arguments: 85, true),
			Problem.TestCase(expectation: 1, arguments: 70, false),
			Problem.TestCase(expectation: 1, arguments: 75, false),
			Problem.TestCase(expectation: 1, arguments: 75, true),
			Problem.TestCase(expectation: 0, arguments: 40, false),
			Problem.TestCase(expectation: 0, arguments: 40, true),
			Problem.TestCase(expectation: 2, arguments: 90, false)
		],
		eulerMode: false
	),
	Problem(
		title: "sortaSum",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given 2 ints, a and b, return their sum. However, sums in the range 10..19 inclusive, are forbidden, so in that case just return 20.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 7, arguments: 3, 4),
			Problem.TestCase(expectation: 20, arguments: 9, 4),
			Problem.TestCase(expectation: 21, arguments: 10, 11),
			Problem.TestCase(expectation: 9, arguments: 12, -3),
			Problem.TestCase(expectation: 9, arguments: -3, 12),
			Problem.TestCase(expectation: 9, arguments: 4, 5),
			Problem.TestCase(expectation: 20, arguments: 4, 6),
			Problem.TestCase(expectation: 21, arguments: 14, 7),
			Problem.TestCase(expectation: 20, arguments: 14, 6)
		],
		eulerMode: false
	),
	Problem(
		title: "alarmClock",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "day", type: Int.self),
			Problem.Parameter(name: "vacation", type: Bool.self)
		],
		prompt: "Given a day of the week encoded as 0=Sun, 1=Mon, 2=Tue, ...6=Sat, and a boolean indicating if we are on vacation, return a string of the form \"7:00\" indicating when the alarm clock should ring. Weekdays, the alarm should be \"7:00\" and on the weekend it should be \"10:00\". Unless we are on vacation -- then on weekdays it should be \"10:00\" and weekends it should be \"off\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "7:00", arguments: 1, false),
			Problem.TestCase(expectation: "7:00", arguments: 5, false),
			Problem.TestCase(expectation: "10:00", arguments: 0, false),
			Problem.TestCase(expectation: "10:00", arguments: 6, false),
			Problem.TestCase(expectation: "off", arguments: 0, true),
			Problem.TestCase(expectation: "off", arguments: 6, true),
			Problem.TestCase(expectation: "10:00", arguments: 1, true),
			Problem.TestCase(expectation: "10:00", arguments: 3, true),
			Problem.TestCase(expectation: "10:00", arguments: 5, true)
		],
		eulerMode: false
	),
	Problem(
		title: "love6",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "The number 6 is a truly great number. Given two int values, a and b, return true if either one is 6. Or if their sum or difference is 6. Note: the function abs(num) computes the absolute value of a number.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 6, 4),
			Problem.TestCase(expectation: false, arguments: 4, 5),
			Problem.TestCase(expectation: true, arguments: 1, 5),
			Problem.TestCase(expectation: true, arguments: 1, 6),
			Problem.TestCase(expectation: false, arguments: 1, 8),
			Problem.TestCase(expectation: true, arguments: 1, 7),
			Problem.TestCase(expectation: false, arguments: 7, 5),
			Problem.TestCase(expectation: true, arguments: 8, 2),
			Problem.TestCase(expectation: true, arguments: 6, 6),
			Problem.TestCase(expectation: false, arguments: -6, 2),
			Problem.TestCase(expectation: true, arguments: -4, -10),
			Problem.TestCase(expectation: false, arguments: -7, 1),
			Problem.TestCase(expectation: true, arguments: 7, -1),
			Problem.TestCase(expectation: true, arguments: -6, 12),
			Problem.TestCase(expectation: false, arguments: -2, -4),
			Problem.TestCase(expectation: true, arguments: 7, 1),
			Problem.TestCase(expectation: false, arguments: 0, 9),
			Problem.TestCase(expectation: false, arguments: 8, 3),
			Problem.TestCase(expectation: true, arguments: 3, 3),
			Problem.TestCase(expectation: false, arguments: 3, 4)
		],
		eulerMode: false
	),
	Problem(
		title: "in1To10",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self),
			Problem.Parameter(name: "outsideMode", type: Bool.self)
		],
		prompt: "Given a number n, return true if n is in the range 1..10, inclusive. Unless outsideMode is true, in which case return true if the number is less or equal to 1, or greater or equal to 10.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 5, false),
			Problem.TestCase(expectation: false, arguments: 11, false),
			Problem.TestCase(expectation: true, arguments: 11, true),
			Problem.TestCase(expectation: true, arguments: 10, false),
			Problem.TestCase(expectation: true, arguments: 10, true),
			Problem.TestCase(expectation: true, arguments: 9, false),
			Problem.TestCase(expectation: false, arguments: 9, true),
			Problem.TestCase(expectation: true, arguments: 1, false),
			Problem.TestCase(expectation: true, arguments: 1, true),
			Problem.TestCase(expectation: false, arguments: 0, false),
			Problem.TestCase(expectation: true, arguments: 0, true),
			Problem.TestCase(expectation: false, arguments: -1, false),
			Problem.TestCase(expectation: true, arguments: -1, true),
			Problem.TestCase(expectation: false, arguments: 99, false),
			Problem.TestCase(expectation: true, arguments: -99, true)
		],
		eulerMode: false
	),
	Problem(
		title: "specialEleven",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "We'll say a number is special if it is a multiple of 11 or if it is one more than a multiple of 11. Return true if the given non-negative number is special. Use the % (remainder) operator.",
		solution: nil,
		hint: "https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID64",
		testCases: [
			Problem.TestCase(expectation: true, arguments: 22),
			Problem.TestCase(expectation: true, arguments: 23),
			Problem.TestCase(expectation: false, arguments: 24),
			Problem.TestCase(expectation: false, arguments: 21),
			Problem.TestCase(expectation: true, arguments: 11),
			Problem.TestCase(expectation: true, arguments: 12),
			Problem.TestCase(expectation: false, arguments: 10),
			Problem.TestCase(expectation: false, arguments: 9),
			Problem.TestCase(expectation: false, arguments: 8),
			Problem.TestCase(expectation: true, arguments: 0),
			Problem.TestCase(expectation: true, arguments: 1),
			Problem.TestCase(expectation: false, arguments: 2),
			Problem.TestCase(expectation: true, arguments: 121),
			Problem.TestCase(expectation: true, arguments: 122),
			Problem.TestCase(expectation: false, arguments: 123),
			Problem.TestCase(expectation: false, arguments: 46),
			Problem.TestCase(expectation: false, arguments: 49),
			Problem.TestCase(expectation: false, arguments: 52),
			Problem.TestCase(expectation: false, arguments: 54),
			Problem.TestCase(expectation: true, arguments: 55)
		],
		eulerMode: false
	),
	Problem(
		title: "more20",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Return true if the given non-negative number is 1 or 2 more than a multiple of 20.",
		solution: nil,
		hint: "https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID64",
		testCases: [
			Problem.TestCase(expectation: false, arguments: 20),
			Problem.TestCase(expectation: true, arguments: 21),
			Problem.TestCase(expectation: true, arguments: 22),
			Problem.TestCase(expectation: false, arguments: 23),
			Problem.TestCase(expectation: false, arguments: 25),
			Problem.TestCase(expectation: false, arguments: 30),
			Problem.TestCase(expectation: false, arguments: 31),
			Problem.TestCase(expectation: false, arguments: 59),
			Problem.TestCase(expectation: false, arguments: 60),
			Problem.TestCase(expectation: true, arguments: 61),
			Problem.TestCase(expectation: true, arguments: 62),
			Problem.TestCase(expectation: false, arguments: 1020),
			Problem.TestCase(expectation: true, arguments: 1021),
			Problem.TestCase(expectation: false, arguments: 1000),
			Problem.TestCase(expectation: true, arguments: 1001),
			Problem.TestCase(expectation: false, arguments: 50),
			Problem.TestCase(expectation: false, arguments: 55),
			Problem.TestCase(expectation: false, arguments: 40),
			Problem.TestCase(expectation: true, arguments: 41),
			Problem.TestCase(expectation: false, arguments: 39),
			Problem.TestCase(expectation: true, arguments: 42)
		],
		eulerMode: false
	),
	Problem(
		title: "old35",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Return true if the given non-negative number is a multiple of 3 or 5, but not both. Use the % (remainder) operator.",
		solution: nil,
		hint: "https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID64",
		testCases: [
			Problem.TestCase(expectation: true, arguments: 3),
			Problem.TestCase(expectation: true, arguments: 10),
			Problem.TestCase(expectation: false, arguments: 15),
			Problem.TestCase(expectation: true, arguments: 5),
			Problem.TestCase(expectation: true, arguments: 9),
			Problem.TestCase(expectation: false, arguments: 8),
			Problem.TestCase(expectation: false, arguments: 7),
			Problem.TestCase(expectation: true, arguments: 6),
			Problem.TestCase(expectation: false, arguments: 17),
			Problem.TestCase(expectation: true, arguments: 18),
			Problem.TestCase(expectation: false, arguments: 29),
			Problem.TestCase(expectation: true, arguments: 20),
			Problem.TestCase(expectation: true, arguments: 21),
			Problem.TestCase(expectation: false, arguments: 22),
			Problem.TestCase(expectation: false, arguments: 45),
			Problem.TestCase(expectation: true, arguments: 99)
		],
		eulerMode: false
	),
	Problem(
		title: "less20",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Return true if the given non-negative number is 1 or 2 less than a multiple of 20. So for example 38 and 39 return true, but 40 returns false.",
		solution: nil,
		hint: "https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID64",
		testCases: [
			Problem.TestCase(expectation: true, arguments: 18),
			Problem.TestCase(expectation: true, arguments: 19),
			Problem.TestCase(expectation: false, arguments: 20),
			Problem.TestCase(expectation: false, arguments: 8),
			Problem.TestCase(expectation: false, arguments: 17),
			Problem.TestCase(expectation: false, arguments: 23),
			Problem.TestCase(expectation: false, arguments: 25),
			Problem.TestCase(expectation: false, arguments: 30),
			Problem.TestCase(expectation: false, arguments: 31),
			Problem.TestCase(expectation: true, arguments: 58),
			Problem.TestCase(expectation: true, arguments: 59),
			Problem.TestCase(expectation: false, arguments: 60),
			Problem.TestCase(expectation: false, arguments: 61),
			Problem.TestCase(expectation: false, arguments: 62),
			Problem.TestCase(expectation: false, arguments: 1017),
			Problem.TestCase(expectation: true, arguments: 1018),
			Problem.TestCase(expectation: true, arguments: 1019),
			Problem.TestCase(expectation: false, arguments: 1020),
			Problem.TestCase(expectation: false, arguments: 1021),
			Problem.TestCase(expectation: false, arguments: 1022),
			Problem.TestCase(expectation: false, arguments: 1023),
			Problem.TestCase(expectation: false, arguments: 37)
		],
		eulerMode: false
	),
	Problem(
		title: "nearTen",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "num", type: Int.self)
		],
		prompt: "Given a non-negative number \"num\", return true if num is within 2 of a multiple of 10. Note: (a % b) is the remainder of dividing a by b, so (7 % 5) is 2.",
		solution: nil,
		hint: "https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID64",
		testCases: [
			Problem.TestCase(expectation: true, arguments: 12),
			Problem.TestCase(expectation: false, arguments: 17),
			Problem.TestCase(expectation: true, arguments: 19),
			Problem.TestCase(expectation: true, arguments: 31),
			Problem.TestCase(expectation: false, arguments: 6),
			Problem.TestCase(expectation: true, arguments: 10),
			Problem.TestCase(expectation: true, arguments: 11),
			Problem.TestCase(expectation: true, arguments: 21),
			Problem.TestCase(expectation: true, arguments: 22),
			Problem.TestCase(expectation: false, arguments: 23),
			Problem.TestCase(expectation: false, arguments: 54),
			Problem.TestCase(expectation: false, arguments: 155),
			Problem.TestCase(expectation: true, arguments: 158),
			Problem.TestCase(expectation: false, arguments: 3),
			Problem.TestCase(expectation: true, arguments: 1)
		],
		eulerMode: false
	),
	Problem(
		title: "teenSum",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given 2 ints, a and b, return their sum. However, \"teen\" values in the range 13..19 inclusive, are extra lucky. So if either value is a teen, just return 19.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 7, arguments: 3, 4),
			Problem.TestCase(expectation: 19, arguments: 10, 13),
			Problem.TestCase(expectation: 19, arguments: 13, 2),
			Problem.TestCase(expectation: 19, arguments: 3, 19),
			Problem.TestCase(expectation: 19, arguments: 13, 13),
			Problem.TestCase(expectation: 20, arguments: 10, 10),
			Problem.TestCase(expectation: 19, arguments: 6, 14),
			Problem.TestCase(expectation: 19, arguments: 15, 2),
			Problem.TestCase(expectation: 19, arguments: 19, 19),
			Problem.TestCase(expectation: 19, arguments: 19, 20),
			Problem.TestCase(expectation: 19, arguments: 2, 18),
			Problem.TestCase(expectation: 16, arguments: 12, 4),
			Problem.TestCase(expectation: 22, arguments: 2, 20),
			Problem.TestCase(expectation: 19, arguments: 2, 17),
			Problem.TestCase(expectation: 19, arguments: 2, 16),
			Problem.TestCase(expectation: 13, arguments: 6, 7)
		],
		eulerMode: false
	),
	Problem(
		title: "answerCell",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "isMorning", type: Bool.self),
			Problem.Parameter(name: "isMom", type: Bool.self),
			Problem.Parameter(name: "isAsleep", type: Bool.self)
		],
		prompt: "Your cell phone rings. Return true if you should answer it. Normally you answer, except in the morning you only answer if it is your mom calling. In all cases, if you are asleep, you do not answer.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: false, false, false),
			Problem.TestCase(expectation: false, arguments: false, false, true),
			Problem.TestCase(expectation: false, arguments: true, false, false),
			Problem.TestCase(expectation: true, arguments: true, true, false),
			Problem.TestCase(expectation: true, arguments: false, true, false),
			Problem.TestCase(expectation: false, arguments: true, true, true)
		],
		eulerMode: false
	),
	Problem(
		title: "teaParty",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "tea", type: Int.self),
			Problem.Parameter(name: "candy", type: Int.self)
		],
		prompt: "We are having a party with amounts of tea and candy. Return the int outcome of the party encoded as 0=bad, 1=good, or 2=great. A party is good (1) if both tea and candy are at least 5. However, if either tea or candy is at least double the amount of the other one, the party is great (2). However, in all cases, if either tea or candy is less than 5, the party is always bad (0).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: 6, 8),
			Problem.TestCase(expectation: 0, arguments: 3, 8),
			Problem.TestCase(expectation: 2, arguments: 20, 6),
			Problem.TestCase(expectation: 2, arguments: 12, 6),
			Problem.TestCase(expectation: 1, arguments: 11, 6),
			Problem.TestCase(expectation: 0, arguments: 11, 4),
			Problem.TestCase(expectation: 0, arguments: 4, 5),
			Problem.TestCase(expectation: 1, arguments: 5, 5),
			Problem.TestCase(expectation: 1, arguments: 6, 6),
			Problem.TestCase(expectation: 2, arguments: 5, 10),
			Problem.TestCase(expectation: 1, arguments: 5, 9),
			Problem.TestCase(expectation: 0, arguments: 10, 4),
			Problem.TestCase(expectation: 2, arguments: 10, 20)
		],
		eulerMode: false
	),
	Problem(
		title: "fizzString",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string str, if the string starts with \"f\" return \"Fizz\". If the string ends with \"b\" return \"Buzz\". If both the \"f\" and \"b\" conditions are true, return \"FizzBuzz\". In all other cases, return the string unchanged.",
		solution: nil,
		hint: "https://codingbat.com/doc/practice/fizzbuzz-code.html",
		testCases: [
			Problem.TestCase(expectation: "Fizz", arguments: "fig"),
			Problem.TestCase(expectation: "Buzz", arguments: "dib"),
			Problem.TestCase(expectation: "FizzBuzz", arguments: "fib"),
			Problem.TestCase(expectation: "abc", arguments: "abc"),
			Problem.TestCase(expectation: "Fizz", arguments: "fooo"),
			Problem.TestCase(expectation: "booo", arguments: "booo"),
			Problem.TestCase(expectation: "Buzz", arguments: "ooob"),
			Problem.TestCase(expectation: "FizzBuzz", arguments: "fooob"),
			Problem.TestCase(expectation: "Fizz", arguments: "f"),
			Problem.TestCase(expectation: "Buzz", arguments: "b"),
			Problem.TestCase(expectation: "Buzz", arguments: "abcb"),
			Problem.TestCase(expectation: "Hello", arguments: "Hello"),
			Problem.TestCase(expectation: "Buzz", arguments: "Hellob"),
			Problem.TestCase(expectation: "af", arguments: "af"),
			Problem.TestCase(expectation: "bf", arguments: "bf"),
			Problem.TestCase(expectation: "FizzBuzz", arguments: "fb")
		],
		eulerMode: false
	),
	Problem(
		title: "fizzString2",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given an int n, return the string form of the number followed by \"!\". So the int 6 yields \"6!\". Except if the number is divisible by 3 use \"Fizz\" instead of the number, and if the number is divisible by 5 use \"Buzz\", and if divisible by both 3 and 5, use \"FizzBuzz\". Note: the % \"mod\" operator computes the remainder after division, so 23 % 10 yields 3. What will the remainder be when one number divides evenly into another?",
		solution: nil,
		hint: "https://codingbat.com/doc/practice/fizzbuzz-code.html",
		testCases: [
			Problem.TestCase(expectation: "1!", arguments: 1),
			Problem.TestCase(expectation: "2!", arguments: 2),
			Problem.TestCase(expectation: "Fizz!", arguments: 3),
			Problem.TestCase(expectation: "4!", arguments: 4),
			Problem.TestCase(expectation: "Buzz!", arguments: 5),
			Problem.TestCase(expectation: "Fizz!", arguments: 6),
			Problem.TestCase(expectation: "7!", arguments: 7),
			Problem.TestCase(expectation: "8!", arguments: 8),
			Problem.TestCase(expectation: "Fizz!", arguments: 9),
			Problem.TestCase(expectation: "FizzBuzz!", arguments: 15),
			Problem.TestCase(expectation: "16!", arguments: 16),
			Problem.TestCase(expectation: "Fizz!", arguments: 18),
			Problem.TestCase(expectation: "19!", arguments: 19),
			Problem.TestCase(expectation: "Fizz!", arguments: 21),
			Problem.TestCase(expectation: "44!", arguments: 44),
			Problem.TestCase(expectation: "FizzBuzz!", arguments: 45),
			Problem.TestCase(expectation: "Buzz!", arguments: 100)
		],
		eulerMode: false
	),
	Problem(
		title: "twoAsOne",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "Given three ints, a b c, return true if it is possible to add two of the ints to get the third.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 1, 2, 3),
			Problem.TestCase(expectation: true, arguments: 3, 1, 2),
			Problem.TestCase(expectation: false, arguments: 3, 2, 2),
			Problem.TestCase(expectation: true, arguments: 2, 3, 1),
			Problem.TestCase(expectation: true, arguments: 5, 3, -2),
			Problem.TestCase(expectation: false, arguments: 5, 3, -3),
			Problem.TestCase(expectation: true, arguments: 2, 5, 3),
			Problem.TestCase(expectation: false, arguments: 9, 5, 5),
			Problem.TestCase(expectation: true, arguments: 9, 4, 5),
			Problem.TestCase(expectation: true, arguments: 5, 4, 9),
			Problem.TestCase(expectation: true, arguments: 3, 3, 0),
			Problem.TestCase(expectation: false, arguments: 3, 3, 2)
		],
		eulerMode: false
	),
	Problem(
		title: "inOrder",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self),
			Problem.Parameter(name: "bOk", type: Bool.self)
		],
		prompt: "Given three ints, a b c, return true if b is greater than a, and c is greater than b. However, with the exception that if \"bOk\" is true, b does not need to be greater than a.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 1, 2, 4, false),
			Problem.TestCase(expectation: false, arguments: 1, 2, 1, false),
			Problem.TestCase(expectation: true, arguments: 1, 1, 2, true),
			Problem.TestCase(expectation: false, arguments: 3, 2, 4, false),
			Problem.TestCase(expectation: true, arguments: 2, 3, 4, false),
			Problem.TestCase(expectation: true, arguments: 3, 2, 4, true),
			Problem.TestCase(expectation: false, arguments: 4, 2, 2, true),
			Problem.TestCase(expectation: false, arguments: 4, 5, 2, true),
			Problem.TestCase(expectation: true, arguments: 2, 4, 6, true),
			Problem.TestCase(expectation: true, arguments: 7, 9, 10, false),
			Problem.TestCase(expectation: true, arguments: 7, 5, 6, true),
			Problem.TestCase(expectation: false, arguments: 7, 5, 4, true)
		],
		eulerMode: false
	),
	Problem(
		title: "inOrderEqual",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self),
			Problem.Parameter(name: "equalOk", type: Bool.self)
		],
		prompt: "Given three ints, a b c, return true if they are in strict increasing order, such as 2 5 11, or 5 6 7, but not 6 5 7 or 5 5 7. However, with the exception that if \"equalOk\" is true, equality is allowed, such as 5 5 7 or 5 5 5.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 2, 5, 11, false),
			Problem.TestCase(expectation: false, arguments: 5, 7, 6, false),
			Problem.TestCase(expectation: true, arguments: 5, 5, 7, true),
			Problem.TestCase(expectation: false, arguments: 5, 5, 7, false),
			Problem.TestCase(expectation: false, arguments: 2, 5, 4, false),
			Problem.TestCase(expectation: false, arguments: 3, 4, 3, false),
			Problem.TestCase(expectation: false, arguments: 3, 4, 4, false),
			Problem.TestCase(expectation: false, arguments: 3, 4, 3, true),
			Problem.TestCase(expectation: true, arguments: 3, 4, 4, true),
			Problem.TestCase(expectation: true, arguments: 1, 5, 5, true),
			Problem.TestCase(expectation: true, arguments: 5, 5, 5, true),
			Problem.TestCase(expectation: false, arguments: 2, 2, 1, true),
			Problem.TestCase(expectation: false, arguments: 9, 2, 2, true),
			Problem.TestCase(expectation: false, arguments: 0, 1, 0, true)
		],
		eulerMode: false
	),
	Problem(
		title: "lastDigit",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "Given three ints, a b c, return true if two or more of them have the same rightmost digit. The ints are non-negative. Note: the % (remainder) operator computes the remainder, e.g. 17 % 10 is 7.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 23, 19, 13),
			Problem.TestCase(expectation: false, arguments: 23, 19, 12),
			Problem.TestCase(expectation: true, arguments: 23, 19, 3),
			Problem.TestCase(expectation: true, arguments: 23, 19, 39),
			Problem.TestCase(expectation: false, arguments: 1, 2, 3),
			Problem.TestCase(expectation: true, arguments: 1, 1, 2),
			Problem.TestCase(expectation: true, arguments: 1, 2, 2),
			Problem.TestCase(expectation: false, arguments: 14, 25, 43),
			Problem.TestCase(expectation: true, arguments: 14, 25, 45),
			Problem.TestCase(expectation: false, arguments: 248, 106, 1002),
			Problem.TestCase(expectation: true, arguments: 248, 106, 1008),
			Problem.TestCase(expectation: true, arguments: 10, 11, 20),
			Problem.TestCase(expectation: true, arguments: 0, 11, 0)
		],
		eulerMode: false
	),
	Problem(
		title: "lessBy10",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "Given three ints, a b c, return true if one of them is 10 or more less than one of the others.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 1, 7, 11),
			Problem.TestCase(expectation: false, arguments: 1, 7, 10),
			Problem.TestCase(expectation: true, arguments: 11, 1, 7),
			Problem.TestCase(expectation: false, arguments: 10, 7, 1),
			Problem.TestCase(expectation: true, arguments: -10, 2, 2),
			Problem.TestCase(expectation: false, arguments: 2, 11, 11),
			Problem.TestCase(expectation: true, arguments: 3, 3, 30),
			Problem.TestCase(expectation: false, arguments: 3, 3, 3),
			Problem.TestCase(expectation: true, arguments: 10, 1, 11),
			Problem.TestCase(expectation: true, arguments: 10, 11, 1),
			Problem.TestCase(expectation: false, arguments: 10, 11, 2),
			Problem.TestCase(expectation: true, arguments: 3, 30, 3),
			Problem.TestCase(expectation: true, arguments: 2, 2, -8),
			Problem.TestCase(expectation: true, arguments: 2, 8, 12)
		],
		eulerMode: false
	),
	Problem(
		title: "withoutDoubles",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "die1", type: Int.self),
			Problem.Parameter(name: "die2", type: Int.self),
			Problem.Parameter(name: "noDoubles", type: Bool.self)
		],
		prompt: "Return the sum of two 6-sided dice rolls, each in the range 1..6. However, if noDoubles is true, if the two dice show the same value, increment one die to the next value, wrapping around to 1 if its value was 6.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 5, arguments: 2, 3, true),
			Problem.TestCase(expectation: 7, arguments: 3, 3, true),
			Problem.TestCase(expectation: 6, arguments: 3, 3, false),
			Problem.TestCase(expectation: 5, arguments: 2, 3, false),
			Problem.TestCase(expectation: 9, arguments: 5, 4, true),
			Problem.TestCase(expectation: 9, arguments: 5, 4, false),
			Problem.TestCase(expectation: 11, arguments: 5, 5, true),
			Problem.TestCase(expectation: 10, arguments: 5, 5, false),
			Problem.TestCase(expectation: 7, arguments: 6, 6, true),
			Problem.TestCase(expectation: 12, arguments: 6, 6, false),
			Problem.TestCase(expectation: 7, arguments: 1, 6, true),
			Problem.TestCase(expectation: 7, arguments: 6, 1, false)
		],
		eulerMode: false
	),
	Problem(
		title: "maxMod5",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given two int values, return whichever value is larger. However if the two values have the same remainder when divided by 5, then the return the smaller value. However, in all cases, if the two values are the same, return 0. Note: the % (remainder) operator computes the remainder, e.g. 7 % 5 is 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 3, arguments: 2, 3),
			Problem.TestCase(expectation: 6, arguments: 6, 2),
			Problem.TestCase(expectation: 3, arguments: 3, 2),
			Problem.TestCase(expectation: 12, arguments: 8, 12),
			Problem.TestCase(expectation: 7, arguments: 7, 12),
			Problem.TestCase(expectation: 6, arguments: 11, 6),
			Problem.TestCase(expectation: 2, arguments: 2, 7),
			Problem.TestCase(expectation: 0, arguments: 7, 7),
			Problem.TestCase(expectation: 9, arguments: 9, 1),
			Problem.TestCase(expectation: 9, arguments: 9, 14),
			Problem.TestCase(expectation: 2, arguments: 1, 2)
		],
		eulerMode: false
	),
	Problem(
		title: "redTicket",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "You have a red lottery ticket showing ints a, b, and c, each of which is 0, 1, or 2. If they are all the value 2, the result is 10. Otherwise if they are all the same, the result is 5. Otherwise so long as both b and c are different from a, the result is 1. Otherwise the result is 0.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 10, arguments: 2, 2, 2),
			Problem.TestCase(expectation: 0, arguments: 2, 2, 1),
			Problem.TestCase(expectation: 5, arguments: 0, 0, 0),
			Problem.TestCase(expectation: 1, arguments: 2, 0, 0),
			Problem.TestCase(expectation: 5, arguments: 1, 1, 1),
			Problem.TestCase(expectation: 0, arguments: 1, 2, 1),
			Problem.TestCase(expectation: 1, arguments: 1, 2, 0),
			Problem.TestCase(expectation: 1, arguments: 0, 2, 2),
			Problem.TestCase(expectation: 1, arguments: 1, 2, 2),
			Problem.TestCase(expectation: 0, arguments: 0, 2, 0),
			Problem.TestCase(expectation: 0, arguments: 1, 1, 2)
		],
		eulerMode: false
	),
	Problem(
		title: "greenTicket",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "You have a green lottery ticket, with ints a, b, and c on it. If the numbers are all different from each other, the result is 0. If all of the numbers are the same, the result is 20. If two of the numbers are the same, the result is 10.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 0, arguments: 1, 2, 3),
			Problem.TestCase(expectation: 20, arguments: 2, 2, 2),
			Problem.TestCase(expectation: 10, arguments: 1, 1, 2),
			Problem.TestCase(expectation: 10, arguments: 2, 1, 1),
			Problem.TestCase(expectation: 10, arguments: 1, 2, 1),
			Problem.TestCase(expectation: 0, arguments: 3, 2, 1),
			Problem.TestCase(expectation: 20, arguments: 0, 0, 0),
			Problem.TestCase(expectation: 10, arguments: 2, 0, 0),
			Problem.TestCase(expectation: 0, arguments: 0, 9, 10),
			Problem.TestCase(expectation: 10, arguments: 0, 10, 0),
			Problem.TestCase(expectation: 20, arguments: 9, 9, 9),
			Problem.TestCase(expectation: 10, arguments: 9, 0, 9)
		],
		eulerMode: false
	),
	Problem(
		title: "blueTicket",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self),
			Problem.Parameter(name: "c", type: Int.self)
		],
		prompt: "You have a blue lottery ticket, with ints a, b, and c on it. This makes three pairs, which we'll call ab, bc, and ac. Consider the sum of the numbers in each pair. If any pair sums to exactly 10, the result is 10. Otherwise if the ab sum is exactly 10 more than either bc or ac sums, the result is 5. Otherwise the result is 0.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 10, arguments: 9, 1, 0),
			Problem.TestCase(expectation: 0, arguments: 9, 2, 0),
			Problem.TestCase(expectation: 10, arguments: 6, 1, 4),
			Problem.TestCase(expectation: 0, arguments: 6, 1, 5),
			Problem.TestCase(expectation: 10, arguments: 10, 0, 0),
			Problem.TestCase(expectation: 5, arguments: 15, 0, 5),
			Problem.TestCase(expectation: 10, arguments: 5, 15, 5),
			Problem.TestCase(expectation: 5, arguments: 4, 11, 1),
			Problem.TestCase(expectation: 5, arguments: 13, 2, 3),
			Problem.TestCase(expectation: 0, arguments: 8, 4, 3),
			Problem.TestCase(expectation: 10, arguments: 8, 4, 2),
			Problem.TestCase(expectation: 0, arguments: 8, 4, 1)
		],
		eulerMode: false
	),
	Problem(
		title: "shareDigit",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given two ints, each in the range 10..99, return true if there is a digit that appears in both numbers, such as the 2 in 12 and 23. (Note: division, e.g. n/10, gives the left digit while the % (remainder) n%10 gives the right digit.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: 12, 23),
			Problem.TestCase(expectation: false, arguments: 12, 43),
			Problem.TestCase(expectation: false, arguments: 12, 44),
			Problem.TestCase(expectation: true, arguments: 23, 12),
			Problem.TestCase(expectation: true, arguments: 23, 39),
			Problem.TestCase(expectation: false, arguments: 23, 19),
			Problem.TestCase(expectation: true, arguments: 30, 90),
			Problem.TestCase(expectation: false, arguments: 30, 91),
			Problem.TestCase(expectation: true, arguments: 55, 55),
			Problem.TestCase(expectation: false, arguments: 55, 44)
		],
		eulerMode: false
	),
	Problem(
		title: "sumLimit",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "a", type: Int.self),
			Problem.Parameter(name: "b", type: Int.self)
		],
		prompt: "Given 2 non-negative ints, a and b, return their sum, so long as the sum has the same number of digits as a. If the sum has more digits than a, just return a without b. (Note: one way to compute the number of digits of a non-negative int n is to convert it to a string with String(n) and then check the length of the string.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 5, arguments: 2, 3),
			Problem.TestCase(expectation: 8, arguments: 8, 3),
			Problem.TestCase(expectation: 9, arguments: 8, 1),
			Problem.TestCase(expectation: 50, arguments: 11, 39),
			Problem.TestCase(expectation: 11, arguments: 11, 99),
			Problem.TestCase(expectation: 0, arguments: 0, 0),
			Problem.TestCase(expectation: 99, arguments: 99, 0),
			Problem.TestCase(expectation: 99, arguments: 99, 1),
			Problem.TestCase(expectation: 124, arguments: 123, 1),
			Problem.TestCase(expectation: 1, arguments: 1, 123),
			Problem.TestCase(expectation: 83, arguments: 23, 60),
			Problem.TestCase(expectation: 23, arguments: 23, 80),
			Problem.TestCase(expectation: 9001, arguments: 9000, 1),
			Problem.TestCase(expectation: 90000001, arguments: 90000000, 1),
			Problem.TestCase(expectation: 9000, arguments: 9000, 1000)
		],
		eulerMode: false
	)
	]

// MARK: Array-1
fileprivate let codingBatArray1Problems = [
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
		prompt: "Given an array of ints length 3, return a new array with the elements in reverse order, so [{]1, 2, 3] becomes [3, 2, 1].",
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

// MARK: String-1
fileprivate let codingBatString1Problems = [
	Problem(
		title: "helloName",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "name", type: String.self)
		],
		prompt: "Given a string name, e.g. \"Bob\", return a greeting of the form \"Hello Bob!\".",
		solution: nil,
		hint: """
		The code

		return "xyz" + name

		would return "xyzBob" for the "Bob" example, so it's not a solution, but it shows the right code pattern.

		This code does the same thing:

		return "xyz\\(name)"
		""",
		testCases: [
			Problem.TestCase(expectation: "Hello Bob!", arguments: "Bob"),
			Problem.TestCase(expectation: "Hello Alice!", arguments: "Alice"),
			Problem.TestCase(expectation: "Hello X!", arguments: "X"),
			Problem.TestCase(expectation: "Hello Dolly!", arguments: "Dolly"),
			Problem.TestCase(expectation: "Hello Alpha!", arguments: "Alpha"),
			Problem.TestCase(expectation: "Hello Omega!", arguments: "Omega"),
			Problem.TestCase(expectation: "Hello Goodbye!", arguments: "Goodbye"),
			Problem.TestCase(expectation: "Hello ho ho ho!", arguments: "ho ho ho"),
			Problem.TestCase(expectation: "Hello xyz!!", arguments: "xyz!"),
			Problem.TestCase(expectation: "Hello Hello!", arguments: "Hello")
		],
		eulerMode: false
	),
	Problem(
		title: "makeAbba",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "a", type: String.self),
			Problem.Parameter(name: "b", type: String.self)
		],
		prompt: "Given two strings, a and b, return the result of putting them together in the order abba, e.g. \"Hi\" and \"Bye\" returns \"HiByeByeHi\".",
		solution: nil,
		hint: """
		The code

		return a + b

		would return "HiBye" for the "Hi" example, so it's not a solution, but it shows the right code pattern.
		""",
		testCases: [
			Problem.TestCase(expectation: "HiByeByeHi", arguments: "Hi", "Bye"),
			Problem.TestCase(expectation: "YoAliceAliceYo", arguments: "Yo", "Alice"),
			Problem.TestCase(expectation: "WhatUpUpWhat", arguments: "What", "Up"),
			Problem.TestCase(expectation: "aaabbbbbbaaa", arguments: "aaa", "bbb"),
			Problem.TestCase(expectation: "xyyx", arguments: "x", "y"),
			Problem.TestCase(expectation: "xx", arguments: "x", ""),
			Problem.TestCase(expectation: "yy", arguments: "", "y"),
			Problem.TestCase(expectation: "BoYaYaBo", arguments: "Bo", "Ya"),
			Problem.TestCase(expectation: "YaYaYaYa", arguments: "Ya", "Ya")
		],
		eulerMode: false
	),
	Problem(
		title: "makeTags",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "tag", type: String.self),
			Problem.Parameter(name: "word", type: String.self)
		],
		prompt: "The web is built with HTML strings like \"<i>Yay</i>\" which draws Yay as italic text. In this example, the \"i\" tag makes <i> and </i> which surround the word \"Yay\". Given tag and word strings, create the HTML string with tags around the word, e.g. \"<i>Yay</i>\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "<i>Yay</i>", arguments: "i", "Yay"),
			Problem.TestCase(expectation: "<i>Hello</i>", arguments: "i", "Hello"),
			Problem.TestCase(expectation: "<cite>Yay</cite>", arguments: "cite", "Yay"),
			Problem.TestCase(expectation: "<address>here</address>", arguments: "address", "here"),
			Problem.TestCase(expectation: "<body>Heart</body>", arguments: "body", "Heart"),
			Problem.TestCase(expectation: "<i>i</i>", arguments: "i", "i"),
			Problem.TestCase(expectation: "<i></i>", arguments: "i", "")
		],
		eulerMode: false
	),
	Problem(
		title: "makeOutWord",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "out", type: String.self),
			Problem.Parameter(name: "word", type: String.self)
		],
		prompt: "Given an \"out\" string length 4, such as \"<<>>\", and a word, return a new string where the word is in the middle of the out string, e.g. \"<<word>>\". Note: str.prefix(2) will give you the first two characters of a String, and str.suffix(2) will give you the last two characters.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "<<Yay>>", arguments: "<<>>", "Yay"),
			Problem.TestCase(expectation: "<<WooHoo>>", arguments: "<<>>", "WooHoo"),
			Problem.TestCase(expectation: "[[word]]", arguments: "[[]]", "word"),
			Problem.TestCase(expectation: "HHHellooo", arguments: "HHoo", "Hello"),
			Problem.TestCase(expectation: "abYAYyz", arguments: "abyz", "YAY")
		],
		eulerMode: false
	),
	Problem(
		title: "extraEnd",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a new string made of 3 copies of the last 2 chars of the original string. The string length will be at least 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "lololo", arguments: "Hello"),
			Problem.TestCase(expectation: "ababab", arguments: "ab"),
			Problem.TestCase(expectation: "HiHiHi", arguments: "Hi"),
			Problem.TestCase(expectation: "dydydy", arguments: "Candy"),
			Problem.TestCase(expectation: "dedede", arguments: "Code")
		],
		eulerMode: false
	),
	Problem(
		title: "firstTwo",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return the string made of its first two chars, so the String \"Hello\" yields \"He\". If the string is shorter than length 2, return whatever there is, so \"X\" yields \"X\", and the empty string \"\" yields the empty string \"\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "He", arguments: "Hello"),
			Problem.TestCase(expectation: "ab", arguments: "abcdefg"),
			Problem.TestCase(expectation: "ab", arguments: "ab"),
			Problem.TestCase(expectation: "a", arguments: "a"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "Ki", arguments: "Kitten"),
			Problem.TestCase(expectation: "hi", arguments: "hi"),
			Problem.TestCase(expectation: "hi", arguments: "hiya")
		],
		eulerMode: false
	),
	Problem(
		title: "firstHalf",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string of even length, return the first half. So the string \"WooHoo\" yields \"Woo\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "Woo", arguments: "WooHoo"),
			Problem.TestCase(expectation: "Hello", arguments: "HelloThere"),
			Problem.TestCase(expectation: "abc", arguments: "abcdef"),
			Problem.TestCase(expectation: "a", arguments: "ab"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "01234", arguments: "0123456789"),
			Problem.TestCase(expectation: "kit", arguments: "kitten")
		],
		eulerMode: false
	),
	Problem(
		title: "withoutEnd",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a version without the first and last char, so \"Hello\" yields \"ell\". The string length will be at least 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ell", arguments: "Hello"),
			Problem.TestCase(expectation: "wif", arguments: "swift"),
			Problem.TestCase(expectation: "odin", arguments: "coding"),
			Problem.TestCase(expectation: "od", arguments: "code"),
			Problem.TestCase(expectation: "", arguments: "ab"),
			Problem.TestCase(expectation: "hocolate", arguments: "Chocolate!"),
			Problem.TestCase(expectation: "itte", arguments: "kitten"),
			Problem.TestCase(expectation: "ooho", arguments: "woohoo")
		],
		eulerMode: false
	),
	Problem(
		title: "comboString",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "a", type: String.self),
			Problem.Parameter(name: "b", type: String.self)
		],
		prompt: "Given 2 strings, a and b, return a string of the form short+long+short, with the shorter string on the outside and the longer string on the inside. The strings will not be the same length, but they may be empty (length 0).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "hiHellohi", arguments: "Hello", "hi"),
			Problem.TestCase(expectation: "hiHellohi", arguments: "hi", "Hello"),
			Problem.TestCase(expectation: "baaab", arguments: "aaa", "b"),
			Problem.TestCase(expectation: "baaab", arguments: "b", "aaa"),
			Problem.TestCase(expectation: "aaa", arguments: "aaa", ""),
			Problem.TestCase(expectation: "bb", arguments: "", "bb"),
			Problem.TestCase(expectation: "aaa1234aaa", arguments: "aaa", "1234"),
			Problem.TestCase(expectation: "bbaaabb", arguments: "aaa", "bb"),
			Problem.TestCase(expectation: "abba", arguments: "a", "bb"),
			Problem.TestCase(expectation: "abba", arguments: "bb", "a"),
			Problem.TestCase(expectation: "abxyzab", arguments: "xyz", "ab")
		],
		eulerMode: false
	),
	Problem(
		title: "nonStart",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "a", type: String.self),
			Problem.Parameter(name: "b", type: String.self)
		],
		prompt: "Given 2 strings, return their concatenation, except omit the first char of each. The strings will be at least length 1.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ellohere", arguments: "Hello", "There"),
			Problem.TestCase(expectation: "wiftode", arguments: "swift", "code"),
			Problem.TestCase(expectation: "hotlava", arguments: "shotl", "java"),
			Problem.TestCase(expectation: "by", arguments: "ab", "xy"),
			Problem.TestCase(expectation: "b", arguments: "ab", "x"),
			Problem.TestCase(expectation: "c", arguments: "x", "ac"),
			Problem.TestCase(expectation: "", arguments: "a", "x"),
			Problem.TestCase(expectation: "itat", arguments: "kit", "kat"),
			Problem.TestCase(expectation: "artart", arguments: "mart", "dart")
		],
		eulerMode: false
	),
	Problem(
		title: "left2",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a \"rotated left 2\" version where the first 2 chars are moved to the end. The string length will be at least 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "lloHe", arguments: "Hello"),
			Problem.TestCase(expectation: "iftsw", arguments: "swift"),
			Problem.TestCase(expectation: "Hi", arguments: "Hi"),
			Problem.TestCase(expectation: "deco", arguments: "code"),
			Problem.TestCase(expectation: "tca", arguments: "cat"),
			Problem.TestCase(expectation: "34512", arguments: "12345"),
			Problem.TestCase(expectation: "ocolateCh", arguments: "Chocolate"),
			Problem.TestCase(expectation: "icksbr", arguments: "bricks")
		],
		eulerMode: false
	),
	Problem(
		title: "right2",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a \"rotated right 2\" version where the last 2 chars are moved to the start. The string length will be at least 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "loHel", arguments: "Hello"),
			Problem.TestCase(expectation: "ftswi", arguments: "swift"),
			Problem.TestCase(expectation: "Hi", arguments: "Hi"),
			Problem.TestCase(expectation: "deco", arguments: "code"),
			Problem.TestCase(expectation: "atc", arguments: "cat"),
			Problem.TestCase(expectation: "45123", arguments: "12345")
		],
		eulerMode: false
	),
	Problem(
		title: "theEnd",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "front", type: Bool.self)
		],
		prompt: "Given a string, return a string length 1 from its front, unless front is false, in which case return a string length 1 from its back. The string will be non-empty.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "H", arguments: "Hello", true),
			Problem.TestCase(expectation: "o", arguments: "Hello", false),
			Problem.TestCase(expectation: "o", arguments: "oh", true),
			Problem.TestCase(expectation: "h", arguments: "oh", false),
			Problem.TestCase(expectation: "x", arguments: "x", true),
			Problem.TestCase(expectation: "x", arguments: "x", false),
			Problem.TestCase(expectation: "j", arguments: "java", true),
			Problem.TestCase(expectation: "e", arguments: "chocolate", false),
			Problem.TestCase(expectation: "1", arguments: "1234", true),
			Problem.TestCase(expectation: "e", arguments: "code", false)
		],
		eulerMode: false
	),
	Problem(
		title: "withouEnd2",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a version without both the first and last char of the string. The string may be any length, including 0.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ell", arguments: "Hello"),
			Problem.TestCase(expectation: "b", arguments: "abc"),
			Problem.TestCase(expectation: "", arguments: "ab"),
			Problem.TestCase(expectation: "", arguments: "a"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "old", arguments: "coldy"),
			Problem.TestCase(expectation: "wift cod", arguments: "swift code")
		],
		eulerMode: false
	),
	Problem(
		title: "middleTwo",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string of even length, return a string made of the middle two chars, so the string \"string\" yields \"ri\". The string length will be at least 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ri", arguments: "string"),
			Problem.TestCase(expectation: "od", arguments: "code"),
			Problem.TestCase(expectation: "ct", arguments: "Practice"),
			Problem.TestCase(expectation: "ab", arguments: "ab"),
			Problem.TestCase(expectation: "45", arguments: "0123456789")
		],
		eulerMode: false
	),
	Problem(
		title: "endsLy",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return true if it ends in \"ly\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "oddly"),
			Problem.TestCase(expectation: false, arguments: "y"),
			Problem.TestCase(expectation: false, arguments: "oddy"),
			Problem.TestCase(expectation: false, arguments: "oddl"),
			Problem.TestCase(expectation: false, arguments: "olydd"),
			Problem.TestCase(expectation: true, arguments: "ly"),
			Problem.TestCase(expectation: false, arguments: ""),
			Problem.TestCase(expectation: false, arguments: "falsey"),
			Problem.TestCase(expectation: true, arguments: "evenly")
		],
		eulerMode: false
	),
	Problem(
		title: "nTwice",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a string and an int n, return a string made of the first and last n chars from the string. The string length will be at least n.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "Helo", arguments: "Hello", 2),
			Problem.TestCase(expectation: "Choate", arguments: "Chocolate", 3),
			Problem.TestCase(expectation: "Ce", arguments: "Chocolate", 1),
			Problem.TestCase(expectation: "", arguments: "Chocolate", 0),
			Problem.TestCase(expectation: "Hellello", arguments: "Hello", 4),
			Problem.TestCase(expectation: "CodeCode", arguments: "Code", 4),
			Problem.TestCase(expectation: "Code", arguments: "Code", 2)
		],
		eulerMode: false
	),
	Problem(
		title: "twoChar",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "index", type: Int.self)
		],
		prompt: "Given a string and an index, return a string length 2 starting at the given index. If the index is too big or too small to define a string length 2, use the first 2 chars. The string length will be at least 2.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "sw", arguments: "swift", 0),
			Problem.TestCase(expectation: "wi", arguments: "swift", 1),
			Problem.TestCase(expectation: "if", arguments: "swift", 2),
			Problem.TestCase(expectation: "ft", arguments: "swift", 3),
			Problem.TestCase(expectation: "sw", arguments: "swift", 4),
			Problem.TestCase(expectation: "sw", arguments: "swift", 5),
			Problem.TestCase(expectation: "sw", arguments: "swift", -1),
			Problem.TestCase(expectation: "He", arguments: "Hello", 0),
			Problem.TestCase(expectation: "el", arguments: "Hello", 1),
			Problem.TestCase(expectation: "He", arguments: "Hello", 99),
			Problem.TestCase(expectation: "lo", arguments: "Hello", 3),
			Problem.TestCase(expectation: "He", arguments: "Hello", 4),
			Problem.TestCase(expectation: "He", arguments: "Hello", 5),
			Problem.TestCase(expectation: "He", arguments: "Hello", -7),
			Problem.TestCase(expectation: "He", arguments: "Hello", 6),
			Problem.TestCase(expectation: "He", arguments: "Hello", -1),
			Problem.TestCase(expectation: "ya", arguments: "yay", 0)
		],
		eulerMode: false
	),
	Problem(
		title: "middleThree",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string of odd length, return the string length 3 from its middle, so \"Candy\" yields \"and\". The string length will be at least 3.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "and", arguments: "Candy"),
			Problem.TestCase(expectation: "and", arguments: "and"),
			Problem.TestCase(expectation: "lvi", arguments: "solving"),
			Problem.TestCase(expectation: "yet", arguments: "Hi yet Hi"),
			Problem.TestCase(expectation: "tay", arguments: "swift tay swift"),
			Problem.TestCase(expectation: "col", arguments: "Chocolate"),
			Problem.TestCase(expectation: "xyz", arguments: "XabcxyzabcX")
		],
		eulerMode: false
	),
	Problem(title: "hasBad",
			returnType: Bool.self,
			parameters: [
				Problem.Parameter(name: "str", type: String.self)
			],
			prompt: "Given a string, return true if \"bad\" appears starting at index 0 or 1 in the string, such as with \"badxxx\" or \"xbadxx\" but not \"xxbadxx\". The string may be any length, including 0.",
			testCases: [
				Problem.TestCase(expectation: true, arguments: "badxx"),
				Problem.TestCase(expectation: true, arguments: "xbadxx"),
				Problem.TestCase(expectation: false, arguments: "xxbadxx"),
				Problem.TestCase(expectation: false, arguments: "code"),
				Problem.TestCase(expectation: true, arguments: "bad"),
				Problem.TestCase(expectation: false, arguments: "ba"),
				Problem.TestCase(expectation: false, arguments: "xba"),
				Problem.TestCase(expectation: true, arguments: "xbad"),
				Problem.TestCase(expectation: false, arguments: ""),
				Problem.TestCase(expectation: true, arguments: "badyy"),
		]),
	Problem(
		title: "atFirst",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a string length 2 made of its first 2 chars. If the string length is less than 2, use '@' for the missing chars.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "he", arguments: "hello"),
			Problem.TestCase(expectation: "hi", arguments: "hi"),
			Problem.TestCase(expectation: "h@", arguments: "h"),
			Problem.TestCase(expectation: "@@", arguments: ""),
			Problem.TestCase(expectation: "ki", arguments: "kitten"),
			Problem.TestCase(expectation: "sw", arguments: "swift"),
			Problem.TestCase(expectation: "s@", arguments: "s")
		],
		eulerMode: false
	),
	Problem(
		title: "lastChars",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "a", type: String.self),
			Problem.Parameter(name: "b", type: String.self)
		],
		prompt: "Given 2 strings, a and b, return a new string made of the first char of a and the last char of b, so \"yo\" and \"swift\" yields \"yt\". If either string is length 0, use '@' for its missing char.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ls", arguments: "last", "chars"),
			Problem.TestCase(expectation: "yt", arguments: "yo", "swift"),
			Problem.TestCase(expectation: "h@", arguments: "hi", ""),
			Problem.TestCase(expectation: "@o", arguments: "", "hello"),
			Problem.TestCase(expectation: "@@", arguments: "", ""),
			Problem.TestCase(expectation: "ki", arguments: "kitten", "hi"),
			Problem.TestCase(expectation: "kp", arguments: "k", "zip"),
			Problem.TestCase(expectation: "k@", arguments: "kitten", ""),
			Problem.TestCase(expectation: "kp", arguments: "kitten", "zip")
		],
		eulerMode: false
	),
	Problem(
		title: "conCat",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "a", type: String.self),
			Problem.Parameter(name: "b", type: String.self)
		],
		prompt: "Given two strings, append them together (known as \"concatenation\") and return the result. However, if the concatenation creates a double-char, then omit one of the chars, so \"abc\" and \"cat\" yields \"abcat\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "abcat", arguments: "abc", "cat"),
			Problem.TestCase(expectation: "dogcat", arguments: "dog", "cat"),
			Problem.TestCase(expectation: "abc", arguments: "abc", ""),
			Problem.TestCase(expectation: "cat", arguments: "", "cat"),
			Problem.TestCase(expectation: "pig", arguments: "pig", "g"),
			Problem.TestCase(expectation: "pigdoggy", arguments: "pig", "doggy")
		],
		eulerMode: false
	),
	Problem(
		title: "lastTwo",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string of any length, return a new string where the last 2 chars, if present, are swapped, so \"coding\" yields \"codign\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "codign", arguments: "coding"),
			Problem.TestCase(expectation: "cta", arguments: "cat"),
			Problem.TestCase(expectation: "ba", arguments: "ab"),
			Problem.TestCase(expectation: "a", arguments: "a"),
			Problem.TestCase(expectation: "", arguments: "")
		],
		eulerMode: false
	),
	Problem(
		title: "seeColor",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, if the string begins with \"red\" or \"blue\" return that color string, otherwise return the empty string.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "red", arguments: "redxx"),
			Problem.TestCase(expectation: "", arguments: "xxred"),
			Problem.TestCase(expectation: "blue", arguments: "blueTimes"),
			Problem.TestCase(expectation: "", arguments: "NoColor"),
			Problem.TestCase(expectation: "red", arguments: "red"),
			Problem.TestCase(expectation: "", arguments: "re"),
			Problem.TestCase(expectation: "", arguments: "blu"),
			Problem.TestCase(expectation: "blue", arguments: "blue"),
			Problem.TestCase(expectation: "", arguments: "a"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "", arguments: "xyzred")
		],
		eulerMode: false
	),
	Problem(
		title: "frontAgain",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return true if the first 2 chars in the string also appear at the end of the string, such as with \"edited\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "edited"),
			Problem.TestCase(expectation: false, arguments: "edit"),
			Problem.TestCase(expectation: true, arguments: "ed"),
			Problem.TestCase(expectation: true, arguments: "jj"),
			Problem.TestCase(expectation: true, arguments: "jjj"),
			Problem.TestCase(expectation: true, arguments: "jjjj"),
			Problem.TestCase(expectation: false, arguments: "jjjk"),
			Problem.TestCase(expectation: false, arguments: "x"),
			Problem.TestCase(expectation: false, arguments: ""),
			Problem.TestCase(expectation: false, arguments: "swift"),
			Problem.TestCase(expectation: true, arguments: "swiftsw")
		],
		eulerMode: false
	),
	Problem(
		title: "minCat",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "a", type: String.self),
			Problem.Parameter(name: "b", type: String.self)
		],
		prompt: "Given two strings, append them together (known as \"concatenation\") and return the result. However, if the strings are different lengths, omit characters from the beginning of the longer string so it is the same length as the shorter string. So \"Hello\" and \"Hi\" yield \"loHi\". The strings may be any length.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "loHi", arguments: "Hello", "Hi"),
			Problem.TestCase(expectation: "Hift", arguments: "Hi", "swift"),
			Problem.TestCase(expectation: "ftHi", arguments: "swift", "Hi"),
			Problem.TestCase(expectation: "cx", arguments: "abc", "x"),
			Problem.TestCase(expectation: "xc", arguments: "x", "abc"),
			Problem.TestCase(expectation: "", arguments: "abc", "")
		],
		eulerMode: false
	),
	Problem(
		title: "extraFront",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a new string made of 3 copies of the first 2 characters of the original string. The string may be any length. If there are fewer than 2 characters, use whatever is there.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "HeHeHe", arguments: "Hello"),
			Problem.TestCase(expectation: "ababab", arguments: "ab"),
			Problem.TestCase(expectation: "HHH", arguments: "H"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "CaCaCa", arguments: "Candy"),
			Problem.TestCase(expectation: "CoCoCo", arguments: "Code")
		],
		eulerMode: false
	),
	Problem(
		title: "without2",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, if a length 2 substring appears at both its beginning and end, return a string without the substring at the beginning, so \"HelloHe\" yields \"lloHe\". The substring may overlap with itself, so \"Hi\" yields \"\". Otherwise, return the original string unchanged.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "lloHe", arguments: "HelloHe"),
			Problem.TestCase(expectation: "HelloHi", arguments: "HelloHi"),
			Problem.TestCase(expectation: "", arguments: "Hi"),
			Problem.TestCase(expectation: "Chocolate", arguments: "Chocolate"),
			Problem.TestCase(expectation: "x", arguments: "xxx"),
			Problem.TestCase(expectation: "", arguments: "xx"),
			Problem.TestCase(expectation: "x", arguments: "x"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "Fruits", arguments: "Fruits")
		],
		eulerMode: false
	),
	Problem(
		title: "deFront",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a version without the first 2 characters. Except keep the first character if it is \"a\" and keep the second character if it is \"b\". The string may be any length. Harder than it looks.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "llo", arguments: "Hello"),
			Problem.TestCase(expectation: "ift", arguments: "swift"),
			Problem.TestCase(expectation: "aay", arguments: "away"),
			Problem.TestCase(expectation: "ay", arguments: "axy"),
			Problem.TestCase(expectation: "abc", arguments: "abc"),
			Problem.TestCase(expectation: "by", arguments: "xby"),
			Problem.TestCase(expectation: "ab", arguments: "ab"),
			Problem.TestCase(expectation: "a", arguments: "ax"),
			Problem.TestCase(expectation: "ab", arguments: "axb"),
			Problem.TestCase(expectation: "aa", arguments: "aaa"),
			Problem.TestCase(expectation: "bc", arguments: "xbc"),
			Problem.TestCase(expectation: "bb", arguments: "bbb"),
			Problem.TestCase(expectation: "zz", arguments: "bazz"),
			Problem.TestCase(expectation: "", arguments: "ba"),
			Problem.TestCase(expectation: "abxyz", arguments: "abxyz"),
			Problem.TestCase(expectation: "", arguments: "hi"),
			Problem.TestCase(expectation: "s", arguments: "his"),
			Problem.TestCase(expectation: "", arguments: "xz"),
			Problem.TestCase(expectation: "z", arguments: "zzz")
		],
		eulerMode: false
	),
	Problem(
		title: "startWord",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "word", type: String.self)
		],
		prompt: "Given a string and a second \"word\" string, we'll say that the word matches the string if it appears at the front of the string, except its first character does not need to match exactly. On a match, return the front of the string, or otherwise return the empty string. So, so with the string \"hippo\" the word \"hi\" returns \"hi\" and \"xip\" returns \"hip\". The word will be at least length 1.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "hi", arguments: "hippo", "hi"),
			Problem.TestCase(expectation: "hip", arguments: "hippo", "xip"),
			Problem.TestCase(expectation: "h", arguments: "hippo", "i"),
			Problem.TestCase(expectation: "", arguments: "hippo", "ix"),
			Problem.TestCase(expectation: "", arguments: "h", "ix"),
			Problem.TestCase(expectation: "", arguments: "", "i"),
			Problem.TestCase(expectation: "hi", arguments: "hip", "zi"),
			Problem.TestCase(expectation: "hip", arguments: "hip", "zip"),
			Problem.TestCase(expectation: "", arguments: "hip", "zig"),
			Problem.TestCase(expectation: "h", arguments: "h", "z"),
			Problem.TestCase(expectation: "hippo", arguments: "hippo", "xippo"),
			Problem.TestCase(expectation: "", arguments: "hippo", "xyz"),
			Problem.TestCase(expectation: "hip", arguments: "hippo", "hip"),
			Problem.TestCase(expectation: "kit", arguments: "kitten", "cit"),
			Problem.TestCase(expectation: "kit", arguments: "kit", "cit")
		],
		eulerMode: false
	),
	Problem(
		title: "withoutX",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, if the first or last characters are \"x\", return the string without those \"x\" chars, and otherwise return the string unchanged.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "Hi", arguments: "xHix"),
			Problem.TestCase(expectation: "Hi", arguments: "xHi"),
			Problem.TestCase(expectation: "Hxi", arguments: "Hxix"),
			Problem.TestCase(expectation: "Hi", arguments: "Hi"),
			Problem.TestCase(expectation: "xHi", arguments: "xxHi"),
			Problem.TestCase(expectation: "Hi", arguments: "Hix"),
			Problem.TestCase(expectation: "axb", arguments: "xaxbx"),
			Problem.TestCase(expectation: "", arguments: "xx"),
			Problem.TestCase(expectation: "", arguments: "x"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "Hello", arguments: "Hello"),
			Problem.TestCase(expectation: "Hexllo", arguments: "Hexllo")
		],
		eulerMode: false
	),
	Problem(
		title: "withoutX2",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, if one or both of the first 2 chars is \"x\", return the string without those \"x\" chars, and otherwise return the string unchanged. This is a little harder than it looks.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "Hi", arguments: "xHi"),
			Problem.TestCase(expectation: "Hi", arguments: "Hxi"),
			Problem.TestCase(expectation: "Hi", arguments: "Hi"),
			Problem.TestCase(expectation: "Hi", arguments: "xxHi"),
			Problem.TestCase(expectation: "Hix", arguments: "Hix"),
			Problem.TestCase(expectation: "axb", arguments: "xaxb"),
			Problem.TestCase(expectation: "", arguments: "xx"),
			Problem.TestCase(expectation: "", arguments: "x"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "Hello", arguments: "Hello"),
			Problem.TestCase(expectation: "Hexllo", arguments: "Hexllo"),
			Problem.TestCase(expectation: "Hxllo", arguments: "xHxllo")
		],
		eulerMode: false
	)
	]

// MARK: Logic-2
fileprivate let codingBatLogic2Problems = [
	Problem(title: "makeBricks",
			returnType: Bool.self,
			parameters: [
				Problem.Parameter(name: "small", type: Int.self),
				Problem.Parameter(name: "big", type: Int.self),
				Problem.Parameter(name: "goal", type: Int.self)
		],
			prompt: "We want to make a row of bricks that is goal inches long. We have a number of small bricks (1 inch each) and big bricks (5 inches each). Return true if it is possible to make the goal by choosing from the given bricks. This is a little harder than it looks and can be done without any loops.",
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
		prompt: "Given 3 int values, a b c, return their sum. However, if one of the values is the same as another of the values, it does not count towards the sum.",
		solution: nil,
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
		prompt: "Given 3 int values, a b c, return their sum. However, if one of the values is 13 then it does not count towards the sum and values to its right do not count. So for example, if b is 13, then both b and c do not count.",
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
		prompt: "Given 3 int values, a b c, return their sum. However, if any of the values is a teen -- in the range 13...19 -- then that value counts as 0, except 15 and 16 do not count as a teens. Write a separate helper \"func fixTeen(n: Int) -> Int {\"that takes in an int value and returns that value fixed for the teen rule. In this way, you avoid repeating the teen code 3 times (i.e. \"decomposition\"). Define the helper below and at the same indent level as the main noTeenSum function.",
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
		prompt: "For this problem, we'll round an int value up to the next multiple of 10 if its rightmost digit is 5 or more, so 15 rounds up to 20. Alternately, round down to the previous multiple of 10 if its rightmost digit is less than 5, so 12 rounds down to 10. Given 3 ints, a b c, return the sum of their rounded values. To avoid code repetition, write a separate helper \"func round10(num: Int) -> Int {\" and call it 3 times. Write the helper entirely below and at the same indent level as the roundSum function.",
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
		prompt: "Given three ints, a b c, return true if one of b or c is \"close\" (differing from a by at most 1), while the other is \"far\", differing from both other values by 2 or more. Note: abs(num) computes the absolute value of a number.",
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
		prompt: "Given three ints, a b c, one of them is small, one is medium and one is large. Return true if the three values are evenly spaced, so the difference between small and medium is the same as the difference between medium and large.",
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

// MARK: AP-1
fileprivate let codingBatAP1Problems = [
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
		prompt: "Given an array of scores sorted in increasing order, return true if the array contains 3 adjacent scores that differ from each other by at most 2, such as with [3, 4, 5] or [3, 5, 5].",
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
		prompt: "Given an array of scores, compute the int average of the first half and the second half, and return whichever is larger. We'll say that the second half begins at index length/2. The array length will be at least 2. To practice decomposition, write a separate helper method \nfunc average(scores: [Int], start: Int, end: Int) -> Int { which computes the average of the elements between indexes start..end. Call your helper method twice to implement the scoresAverage function. Write your helper method after your scoresAverage function in the text area. Normally you would compute averages with doubles, but here we use ints so the expected results are exact.",
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
		prompt: "Given a positive int n, return true if it contains a 1 digit. Note: use % to get the rightmost digit, and / to discard the rightmost digit.",
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
		prompt: "We'll say that a positive int divides itself if every digit in the number divides into the number evenly. So for example 128 divides itself since 1, 2, and 8 all divide into 128 evenly. We'll say that 0 does not divide into anything evenly, so no number with a 0 digit divides itself. Note: use % to get the rightmost digit, and / to discard the rightmost digit.",
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
		prompt: "Given an array of positive ints, return a new array of length \"count\" containing the first even numbers from the original array. The original array will contain at least \"count\" even numbers.",
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
		prompt: "We'll say that a positive int n is \"endy\" if it is in the range 0...10 or 90...100. Given an array of positive ints, return a new array of length \"count\" containing the first endy numbers from the original array. Decompose out a separate isEndy(int n) method to test if a number is endy. The original array will contain at least \"count\" endy numbers.",
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
		prompt: "Given 2 arrays that are the same length containing strings, compare the 1st string in one array to the 1st string in the other array, the 2nd to the 2nd and so on. Count the number of times that the 2 strings are non-empty and start with the same char. The strings may be any length, including 0.",
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
			prompt: "The \"key\" array is an array containing the correct answers to an exam, like [\"a\", \"a\", \"b\", \"b\"]. The \"answers\" array contains a student's answers, with \"?\" representing a question left blank. The two arrays are not empty and are the same length. Return the score for this array of answers, giving +4 for each correct answer, -1 for each incorrect answer, and +0 for each blank answer.",
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
		prompt: "Given two arrays, A and B, of non-negative int scores. A \"special\" score is one which is a multiple of 10, such as 40 or 90. Return the sum of largest special score in A and the largest special score in B. To practice decomposition, write a separate helper function which finds the largest special score in an array. Write your helper function after your scoresSpecial method in the text area.",
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
		prompt: "We have an array of heights, representing the altitude along a walking trail. Given start/end indexes into the array, return the sum of the changes for a walk beginning at the start index and ending at the end index. For example, with the heights [5, 3, 6, 7, 2] and start=2, end=4 yields a sum of 1 + 5 = 6. The start end end index will both be valid indexes into the array with start <= end.",
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
		prompt: "(A variation on the sumHeights problem.) We have an array of heights, representing the altitude along a walking trail. Given start/end indexes into the array, return the sum of the changes for a walk beginning at the start index and ending at the end index, however increases in height count double. For example, with the heights [5, 3, 6, 7, 2] and start=2, end=4 yields a sum of 1*2 + 5 = 7. The start end end index will both be valid indexes into the array with start <= end.",
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
		prompt: "Start with two arrays of strings, A and B, each with its elements in alphabetical order and without duplicates. Return a new array containing the first N elements from the two arrays. The result array should be in alphabetical order and without duplicates. A and B will both have a length which is N or more. The best \"linear\" solution makes a single pass over A and B, taking advantage of the fact that they are in alphabetical order, copying elements directly to the new array.",
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
		prompt: "Start with two arrays of strings, a and b, each in alphabetical order, possibly with duplicates. Return the count of the number of strings which appear in both arrays. The best \"linear\" solution makes a single pass over both arrays, taking advantage of the fact that they are in alphabetical order.",
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

// MARK: String-2
fileprivate let codingBatString2Problems: [Problem] = [
]

// MARK: String-3
fileprivate let codingBatString3Problems: [Problem] = [
]

// MARK: Array-2
fileprivate let codingBatArray2Problems: [Problem] = [
	Problem(
		title: "countEvens",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Return the number of even ints in the given array. Note: the % (remainder) operator computes the remainder, e.g. 5 % 2 is 1.",
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
		prompt: "Given an array length 1 or more of ints, return the difference between the largest and smallest values in the array. Note: the built-in min(v1, v2) and max(v1, v2) methods return the smaller or larger of two values.",
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
	)
]

// MARK: Array-3
fileprivate let codingBatArray3roblems: [Problem] = [
]

// MARK: Recursion-1
fileprivate let codingBatRecursion1Problems: [Problem] = [
	Problem(
		title: "factorial",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given n of 1 or more, return the factorial of n, which is n * (n-1) * (n-2) ... 1. Compute the result recursively (without loops).",
		solution: nil,
		hint: nil,
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
	)
]

// MARK: - Project Euler
fileprivate let eulerProblems = [
	Problem(title: "Multiples of 3 and 5",
			functionName: "euler1",
			returnType: Int.self,
			parameters: [Problem.Parameter](),
			prompt: "If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6, and 9. The sum of these multiples is 23.\n\nFind the sum of all the multiples of 3 or 5 below 1000.",
			solution: nil,
			testCases: [Problem.TestCase(expectation: 233168)],
			eulerMode: true),
	Problem(title: "Even Fibonacci numbers",
			functionName: "euler2",
			returnType: Int.self,
			parameters: [Problem.Parameter](),
			prompt: "Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:\n\n1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...\n\nBy considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.",
			solution: nil,
			testCases: [Problem.TestCase(expectation: 4613732)],
			eulerMode: true),
	Problem(title: "Largest prime factor",
			functionName: "euler3",
			returnType: Int.self,
			parameters: [Problem.Parameter](),
			prompt: "The prime factors of 13195 are 5, 7, 13 and 29.\n\nWhat is the largest prime factor of the number 600851475143?",
			solution: nil,
			testCases: [Problem.TestCase(expectation: 6857)],
			eulerMode: true),
	Problem(title: "Largest palindrome product",
			functionName: "euler4",
			returnType: Int.self,
			parameters: [Problem.Parameter](),
			prompt: "A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.\n\nFind the largest palindrome made from the product of two 3-digit numbers.",
			solution: nil,
			testCases: [Problem.TestCase(expectation: 906609)],
			eulerMode: true),
	Problem(title: "Smallest multiple",
			functionName: "euler5",
			returnType: Int.self,
			parameters: [Problem.Parameter](),
			prompt: "2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.\n\nWhat is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?",
			solution: nil,
			testCases: [Problem.TestCase(expectation: 232792560)],
			eulerMode: true),
	Problem(title: "Sum square difference",
			functionName: "euler6",
			returnType: Int.self,
			parameters: [Problem.Parameter](),
			prompt: "The sum of the squares of the first ten natural numbers is: 1²+ 2² + ... + 10² = 385\n\nThe square of the sum of the first ten natural numbers is: (1 + 2 + ... + 10)² = 55² = 3025\n\nHence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.\n\nFind the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.",
			solution: nil,
			testCases: [Problem.TestCase(expectation: 25164150)], eulerMode: true),
	Problem(title: "10001st prime",
			functionName: "euler7",
			returnType: Int.self,
			parameters: [Problem.Parameter](),
			prompt: "By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.\n\nWhat is the 10 001st prime number?",
			solution: nil,
			testCases: [Problem.TestCase(expectation: 104743)], eulerMode: true),
	Problem(title: "Largest product in a series",
			functionName: "euler8", returnType: Int.self,
			parameters: [Problem.Parameter](),
			prompt: """
The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450

Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
""",
			solution: nil,
			testCases: [Problem.TestCase(expectation: 23514624000)], eulerMode: true),
	Problem(title: "Summation of primes",
			functionName: "euler10",
			returnType: Int.self,
			parameters: [Problem.Parameter](),
			prompt: """
			The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

			Find the sum of all the primes below two million.
			""",
			solution: nil,
			testCases: [Problem.TestCase(expectation: 142913828922)],
			eulerMode: true),
	Problem(title: "Power digit sum",
			functionName: "euler16",
			returnType: Int.self,
			parameters: [Problem.Parameter](),
			prompt: """
			2¹⁵ = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
			
			What is the sum of the digits of the number 2¹⁰⁰⁰?
			""",
			solution: nil,
			testCases: [Problem.TestCase(expectation: 31875000)],
			eulerMode: true)
]
