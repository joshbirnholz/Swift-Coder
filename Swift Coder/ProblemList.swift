//
//  ProblemList.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 4/16/16.
//  Copyright © 2016 Josh Birnholz. All rights reserved.
//


public enum ProblemSet: String, CaseIterable {
	case codingBatWarmup1 = "Warmup-1"
	case codingBatWarmup2 = "Warmup-2"
	case codingBatString1 = "String-1"
	case codingBatArray1 = "Array-1"
	case codingBatLogic1 = "Logic-1"
	case codingBatLogic2 = "Logic-2"
	case codingBatString2 = "String-2"
	case codingBatString3 = "String-3"
	case codingBatArray2 = "Array-2"
	case codingBatArray3 = "Array-3"
	case codingBatAP1 = "AP-1"
	case codingBatRecursion1 = "Recursion-1"
	case codingBatRecursion2 = "Recursion-2"
	case codingBatDictionary1 = "Dictionary-1"
	case codingBatDictionary2 = "Dictionary-2"
	case codingBatFunctional1 = "Functional-1"
	case codingBatFunctional2 = "Functional-2"
	case projectEuler = "Project Euler"
	
	var problems: [Problem] {
		switch self {
		case .codingBatWarmup1:
			return codingBatWarmup1Problems
		case .codingBatWarmup2:
			return codingBatWarmup2Problems
		case .codingBatLogic1:
			return codingBatLogic1Problems
		case .codingBatArray1:
			return codingBatArray1Problems
		case .codingBatString1:
			return codingBatString1Problems
		case .codingBatLogic2:
			return codingBatLogic2Problems
		case .codingBatAP1:
			return codingBatAP1Problems
		case .codingBatRecursion1:
			return codingBatRecursion1Problems
		case .projectEuler: return eulerProblems
		case .codingBatString2:
			return codingBatString2Problems
		case .codingBatString3:
			return codingBatString3Problems
		case .codingBatArray2:
			return codingBatArray2Problems
		case .codingBatArray3:
			return codingBatArray3Problems
		case .codingBatFunctional1:
			return codingBatFunctional1Problems
		case .codingBatFunctional2:
			return codingBatFunctional2Problems
		case .codingBatRecursion2:
			return codingBatRecursion2Problems
		case .codingBatDictionary1:
			return codingBatDictionary1Problems
		case .codingBatDictionary2:
			return codingBatDictionary2Problems
		}
	}
}

// MARK: - CodingBat

// MARK: Warmup1
fileprivate let codingBatWarmup1Problems: [Problem] = [
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
fileprivate let codingBatWarmup2Problems: [Problem] = [
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
		prompt: "Given a string and a non-negative int n, we'll say that the front of the string is the first 3 characters, or whatever is there if the string is less than length 3. Return n copies of the front;",
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
fileprivate let codingBatLogic1Problems: [Problem] = [
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
fileprivate let codingBatArray1Problems: [Problem] = [
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
fileprivate let codingBatString1Problems: [Problem] = [
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
		prompt: "Given a string, return a new string made of 3 copies of the last 2 characters of the original string. The string length will be at least 2.",
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
		prompt: "Given a string, return the string made of its first two characters, so the String \"Hello\" yields \"He\". If the string is shorter than length 2, return whatever there is, so \"X\" yields \"X\", and the empty string \"\" yields the empty string \"\".",
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
		prompt: "Given a string, return a \"rotated left 2\" version where the first 2 characters are moved to the end. The string length will be at least 2.",
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
		prompt: "Given a string, return a \"rotated right 2\" version where the last 2 characters are moved to the start. The string length will be at least 2.",
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
			Problem.TestCase(expectation: "s", arguments: "swift", true),
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
		prompt: "Given a string of even length, return a string made of the middle two characters, so the string \"string\" yields \"ri\". The string length will be at least 2.",
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
		prompt: "Given a string and an int n, return a string made of the first and last n characters from the string. The string length will be at least n.",
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
		prompt: "Given a string and an index, return a string length 2 starting at the given index. If the index is too big or too small to define a string length 2, use the first 2 characters. The string length will be at least 2.",
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
		prompt: "Given a string, return a string length 2 made of its first 2 characters. If the string length is less than 2, use '@' for the missing characters.",
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
			Problem.TestCase(expectation: "ls", arguments: "last", "characters"),
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
		prompt: "Given two strings, append them together (known as \"concatenation\") and return the result. However, if the concatenation creates a double-char, then omit one of the characters, so \"abc\" and \"cat\" yields \"abcat\".",
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
		prompt: "Given a string of any length, return a new string where the last 2 characters, if present, are swapped, so \"coding\" yields \"codign\".",
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
		prompt: "Given a string, return true if the first 2 characters in the string also appear at the end of the string, such as with \"edited\".",
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
		prompt: "Given a string, if the first or last characters are \"x\", return the string without those \"x\" characters, and otherwise return the string unchanged.",
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
		prompt: "Given a string, if one or both of the first 2 characters is \"x\", return the string without those \"x\" characters, and otherwise return the string unchanged. This is a little harder than it looks.",
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
fileprivate let codingBatLogic2Problems: [Problem] = [
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
fileprivate let codingBatAP1Problems: [Problem] = [
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
	Problem(
		title: "doubleChar",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a string where for every char in the original, there are two characters.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "TThhee", arguments: "The"),
			Problem.TestCase(expectation: "AAAAbbbb", arguments: "AAbb"),
			Problem.TestCase(expectation: "HHii--TThheerree", arguments: "Hi-There"),
			Problem.TestCase(expectation: "WWoorrdd!!", arguments: "Word!"),
			Problem.TestCase(expectation: "!!!!", arguments: "!!"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "aa", arguments: "a"),
			Problem.TestCase(expectation: "..", arguments: "."),
			Problem.TestCase(expectation: "aaaa", arguments: "aa")
		],
		eulerMode: false
	),
	Problem(
		title: "countHi",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Return the number of times that the string \"hi\" appears anywhere in the given string.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: "abc hi ho"),
			Problem.TestCase(expectation: 2, arguments: "ABChi hi"),
			Problem.TestCase(expectation: 2, arguments: "hihi"),
			Problem.TestCase(expectation: 2, arguments: "hiHIhi"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 0, arguments: "h"),
			Problem.TestCase(expectation: 1, arguments: "hi"),
			Problem.TestCase(expectation: 0, arguments: "Hi is no HI on ahI"),
			Problem.TestCase(expectation: 2, arguments: "hiho not HOHIhi")
		],
		eulerMode: false
	),
	Problem(
		title: "catDog",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Return true if the string \"cat\" and \"dog\" appear the same number of times in the given string.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "catdog"),
			Problem.TestCase(expectation: false, arguments: "catcat"),
			Problem.TestCase(expectation: true, arguments: "1cat1cadodog"),
			Problem.TestCase(expectation: false, arguments: "catxxdogxxxdog"),
			Problem.TestCase(expectation: true, arguments: "catxdogxdogxcat"),
			Problem.TestCase(expectation: false, arguments: "catxdogxdogxca"),
			Problem.TestCase(expectation: false, arguments: "dogdogcat"),
			Problem.TestCase(expectation: true, arguments: "dogogcat"),
			Problem.TestCase(expectation: false, arguments: "dog"),
			Problem.TestCase(expectation: false, arguments: "cat"),
			Problem.TestCase(expectation: true, arguments: "ca"),
			Problem.TestCase(expectation: true, arguments: "c"),
			Problem.TestCase(expectation: true, arguments: "")
		],
		eulerMode: false
	),
	Problem(
		title: "countCode",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Return the number of times that the string \"code\" appears anywhere in the given string, except we'll accept any letter for the 'd', so \"cope\" and \"cooe\" count.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: "aaacodebbb"),
			Problem.TestCase(expectation: 2, arguments: "codexxcode"),
			Problem.TestCase(expectation: 2, arguments: "cozexxcope"),
			Problem.TestCase(expectation: 1, arguments: "cozfxxcope"),
			Problem.TestCase(expectation: 1, arguments: "xxcozeyycop"),
			Problem.TestCase(expectation: 0, arguments: "cozcop"),
			Problem.TestCase(expectation: 0, arguments: "abcxyz"),
			Problem.TestCase(expectation: 1, arguments: "code"),
			Problem.TestCase(expectation: 0, arguments: "ode"),
			Problem.TestCase(expectation: 0, arguments: "c"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 3, arguments: "AAcodeBBcoleCCccoreDD"),
			Problem.TestCase(expectation: 2, arguments: "AAcodeBBcoleCCccorfDD"),
			Problem.TestCase(expectation: 3, arguments: "coAcodeBcoleccoreDD")
		],
		eulerMode: false
	),
	Problem(
		title: "endOther",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "a", type: String.self),
			Problem.Parameter(name: "b", type: String.self)
		],
		prompt: "Given two strings, return true if either of the strings appears at the very end of the other string, ignoring upper/lower case differences (in other words, the computation should not be \"case sensitive\"). Note: str.lowercased() returns the lowercase version of a string.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "Hiabc", "abc"),
			Problem.TestCase(expectation: true, arguments: "AbC", "HiaBc"),
			Problem.TestCase(expectation: true, arguments: "abc", "abXabc"),
			Problem.TestCase(expectation: false, arguments: "Hiabc", "abcd"),
			Problem.TestCase(expectation: true, arguments: "Hiabc", "bc"),
			Problem.TestCase(expectation: false, arguments: "Hiabcx", "bc"),
			Problem.TestCase(expectation: true, arguments: "abc", "abc"),
			Problem.TestCase(expectation: true, arguments: "xyz", "12xyz"),
			Problem.TestCase(expectation: false, arguments: "yz", "12xz"),
			Problem.TestCase(expectation: true, arguments: "Z", "12xz"),
			Problem.TestCase(expectation: true, arguments: "12", "12"),
			Problem.TestCase(expectation: false, arguments: "abcXYZ", "abcDEF"),
			Problem.TestCase(expectation: false, arguments: "ab", "ab12"),
			Problem.TestCase(expectation: true, arguments: "ab", "12ab")
		],
		eulerMode: false
	),
	Problem(
		title: "xyzThere",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Return true if the given string contains an appearance of \"xyz\" where the xyz is not directly preceeded by a period (.). So \"xxyz\" counts but \"x.xyz\" does not.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "abcxyz"),
			Problem.TestCase(expectation: false, arguments: "abc.xyz"),
			Problem.TestCase(expectation: true, arguments: "xyz.abc"),
			Problem.TestCase(expectation: false, arguments: "abcxy"),
			Problem.TestCase(expectation: true, arguments: "xyz"),
			Problem.TestCase(expectation: false, arguments: "xy"),
			Problem.TestCase(expectation: false, arguments: "x"),
			Problem.TestCase(expectation: false, arguments: ""),
			Problem.TestCase(expectation: true, arguments: "abc.xyzxyz"),
			Problem.TestCase(expectation: true, arguments: "abc.xxyz"),
			Problem.TestCase(expectation: false, arguments: ".xyz"),
			Problem.TestCase(expectation: false, arguments: "12.xyz"),
			Problem.TestCase(expectation: true, arguments: "12xyz"),
			Problem.TestCase(expectation: false, arguments: "1.xyz.xyz2.xyz")
		],
		eulerMode: false
	),
	Problem(
		title: "bobThere",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Return true if the given string contains a \"bob\" string, but where the middle 'o' char can be any character.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "abcbob"),
			Problem.TestCase(expectation: true, arguments: "b9b"),
			Problem.TestCase(expectation: false, arguments: "bac"),
			Problem.TestCase(expectation: true, arguments: "bbb"),
			Problem.TestCase(expectation: false, arguments: "abcdefb"),
			Problem.TestCase(expectation: true, arguments: "123abcbcdbabxyz"),
			Problem.TestCase(expectation: false, arguments: "b12"),
			Problem.TestCase(expectation: true, arguments: "b1b"),
			Problem.TestCase(expectation: true, arguments: "b12b1b"),
			Problem.TestCase(expectation: false, arguments: "bbc"),
			Problem.TestCase(expectation: true, arguments: "bbb"),
			Problem.TestCase(expectation: false, arguments: "bb"),
			Problem.TestCase(expectation: false, arguments: "b")
		],
		eulerMode: false
	),
	Problem(
		title: "xyBalance",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "We'll say that a String is xy-balanced if for all the 'x' characters in the string, there exists a 'y' character somewhere later in the string. So \"xxy\" is balanced, but \"xyx\" is not. One 'y' can balance multiple 'x's. Return true if the given string is xy-balanced.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "aaxbby"),
			Problem.TestCase(expectation: false, arguments: "aaxbb"),
			Problem.TestCase(expectation: false, arguments: "yaaxbb"),
			Problem.TestCase(expectation: true, arguments: "yaaxbby"),
			Problem.TestCase(expectation: true, arguments: "xaxxbby"),
			Problem.TestCase(expectation: false, arguments: "xaxxbbyx"),
			Problem.TestCase(expectation: true, arguments: "xxbxy"),
			Problem.TestCase(expectation: false, arguments: "xxbx"),
			Problem.TestCase(expectation: true, arguments: "bbb"),
			Problem.TestCase(expectation: false, arguments: "bxbb"),
			Problem.TestCase(expectation: true, arguments: "bxyb"),
			Problem.TestCase(expectation: true, arguments: "xy"),
			Problem.TestCase(expectation: true, arguments: "y"),
			Problem.TestCase(expectation: false, arguments: "x"),
			Problem.TestCase(expectation: true, arguments: ""),
			Problem.TestCase(expectation: false, arguments: "yxyxyxyx"),
			Problem.TestCase(expectation: true, arguments: "yxyxyxyxy"),
			Problem.TestCase(expectation: true, arguments: "12xabxxydxyxyzz")
		],
		eulerMode: false
	),
	Problem(
		title: "mixString",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "a", type: String.self),
			Problem.Parameter(name: "b", type: String.self)
		],
		prompt: "Given two strings, a and b, create a bigger string made of the first char of a, the first char of b, the second char of a, the second char of b, and so on. Any leftover characters go at the end of the result.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "axbycz", arguments: "abc", "xyz"),
			Problem.TestCase(expectation: "HTihere", arguments: "Hi", "There"),
			Problem.TestCase(expectation: "xTxhxexre", arguments: "xxxx", "There"),
			Problem.TestCase(expectation: "xXxx", arguments: "xxx", "X"),
			Problem.TestCase(expectation: "22/7 around", arguments: "2/", "27 around"),
			Problem.TestCase(expectation: "Hello", arguments: "", "Hello"),
			Problem.TestCase(expectation: "Abc", arguments: "Abc", ""),
			Problem.TestCase(expectation: "", arguments: "", ""),
			Problem.TestCase(expectation: "ab", arguments: "a", "b"),
			Problem.TestCase(expectation: "abx", arguments: "ax", "b"),
			Problem.TestCase(expectation: "abx", arguments: "a", "bx"),
			Problem.TestCase(expectation: "SLoong", arguments: "So", "Long"),
			Problem.TestCase(expectation: "LSoong", arguments: "Long", "So")
		],
		eulerMode: false
	),
	Problem(
		title: "repeatEnd",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a string and an int n, return a string made of n repetitions of the last n characters of the string. You may assume that n is between 0 and the length of the string, inclusive.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "llollollo", arguments: "Hello", 3),
			Problem.TestCase(expectation: "lolo", arguments: "Hello", 2),
			Problem.TestCase(expectation: "o", arguments: "Hello", 1),
			Problem.TestCase(expectation: "", arguments: "Hello", 0),
			Problem.TestCase(expectation: "abcabcabc", arguments: "abc", 3),
			Problem.TestCase(expectation: "3434", arguments: "1234", 2),
			Problem.TestCase(expectation: "234234234", arguments: "1234", 3),
			Problem.TestCase(expectation: "", arguments: "", 0)
		],
		eulerMode: false
	),
	Problem(
		title: "repeatFront",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a string and an int n, return a string made of the first n characters of the string, followed by the first n-1 characters of the string, and so on. You may assume that n is between 0 and the length of the string, inclusive (i.e. n >= 0 and n <= str.count).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ChocChoChC", arguments: "Chocolate", 4),
			Problem.TestCase(expectation: "ChoChC", arguments: "Chocolate", 3),
			Problem.TestCase(expectation: "IcI", arguments: "Ice Cream", 2),
			Problem.TestCase(expectation: "I", arguments: "Ice Cream", 1),
			Problem.TestCase(expectation: "", arguments: "Ice Cream", 0),
			Problem.TestCase(expectation: "xyzxyx", arguments: "xyz", 3),
			Problem.TestCase(expectation: "", arguments: "", 0),
			Problem.TestCase(expectation: "SwiftSwifSwiSwS", arguments: "Swift", 5),
			Problem.TestCase(expectation: "S", arguments: "Swift", 1)
		],
		eulerMode: false
	),
	Problem(
		title: "repeatSeparator",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "word", type: String.self),
			Problem.Parameter(name: "sep", type: String.self),
			Problem.Parameter(name: "count", type: Int.self)
		],
		prompt: "Given two strings, word and a separator sep, return a big string made of count occurrences of the word, separated by the separator string.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "WordXWordXWord", arguments: "Word", "X", 3),
			Problem.TestCase(expectation: "ThisAndThis", arguments: "This", "And", 2),
			Problem.TestCase(expectation: "This", arguments: "This", "And", 1),
			Problem.TestCase(expectation: "Hi-n-Hi", arguments: "Hi", "-n-", 2),
			Problem.TestCase(expectation: "AAA", arguments: "AAA", "", 1),
			Problem.TestCase(expectation: "", arguments: "AAA", "", 0),
			Problem.TestCase(expectation: "ABABABABA", arguments: "A", "B", 5),
			Problem.TestCase(expectation: "abcXXabcXXabc", arguments: "abc", "XX", 3),
			Problem.TestCase(expectation: "abcXXabc", arguments: "abc", "XX", 2),
			Problem.TestCase(expectation: "abc", arguments: "abc", "XX", 1),
			Problem.TestCase(expectation: "XYZaXYZ", arguments: "XYZ", "a", 2)
		],
		eulerMode: false
	),
	Problem(
		title: "prefixAgain",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "n", type: Int.self)
		],
		prompt: "Given a string, consider the prefix string made of the first N characters of the string. Does that prefix string appear somewhere else in the string? Assume that the string is not empty and that N is in the range 1..<str.count.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "abXYabc", 1),
			Problem.TestCase(expectation: true, arguments: "abXYabc", 2),
			Problem.TestCase(expectation: false, arguments: "abXYabc", 3),
			Problem.TestCase(expectation: true, arguments: "xyzxyxyxy", 2),
			Problem.TestCase(expectation: false, arguments: "xyzxyxyxy", 3),
			Problem.TestCase(expectation: true, arguments: "Hi12345Hi6789Hi10", 1),
			Problem.TestCase(expectation: true, arguments: "Hi12345Hi6789Hi10", 2),
			Problem.TestCase(expectation: true, arguments: "Hi12345Hi6789Hi10", 3),
			Problem.TestCase(expectation: false, arguments: "Hi12345Hi6789Hi10", 4),
			Problem.TestCase(expectation: false, arguments: "a", 1),
			Problem.TestCase(expectation: true, arguments: "aa", 1),
			Problem.TestCase(expectation: false, arguments: "ab", 1)
		],
		eulerMode: false
	),
	Problem(
		title: "xyzMiddle",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, does \"xyz\" appear in the middle of the string? To define middle, we'll say that the number of characters to the left and right of the \"xyz\" must differ by at most one. This problem is harder than it looks.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "AAxyzBB"),
			Problem.TestCase(expectation: true, arguments: "AxyzBB"),
			Problem.TestCase(expectation: false, arguments: "AxyzBBB"),
			Problem.TestCase(expectation: false, arguments: "AxyzBBBB"),
			Problem.TestCase(expectation: false, arguments: "AAAxyzB"),
			Problem.TestCase(expectation: true, arguments: "AAAxyzBB"),
			Problem.TestCase(expectation: false, arguments: "AAAAxyzBB"),
			Problem.TestCase(expectation: false, arguments: "AAAAAxyzBBB"),
			Problem.TestCase(expectation: true, arguments: "1x345xyz12x4"),
			Problem.TestCase(expectation: true, arguments: "xyzAxyzBBB"),
			Problem.TestCase(expectation: true, arguments: "xyzAxyzBxyz"),
			Problem.TestCase(expectation: true, arguments: "xyzxyzAxyzBxyzxyz"),
			Problem.TestCase(expectation: true, arguments: "xyzxyzxyzBxyzxyz"),
			Problem.TestCase(expectation: true, arguments: "xyzxyzAxyzxyzxyz"),
			Problem.TestCase(expectation: false, arguments: "xyzxyzAxyzxyzxy"),
			Problem.TestCase(expectation: false, arguments: "AxyzxyzBB"),
			Problem.TestCase(expectation: false, arguments: ""),
			Problem.TestCase(expectation: false, arguments: "x"),
			Problem.TestCase(expectation: false, arguments: "xy"),
			Problem.TestCase(expectation: true, arguments: "xyz"),
			Problem.TestCase(expectation: true, arguments: "xyzz")
		],
		eulerMode: false
	),
	Problem(
		title: "getSandwich",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "A sandwich is two pieces of bread with something in between. Return the string that is between the first and last appearance of \"bread\" in the given string, or return the empty string \"\" if there are not two pieces of bread.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "jam", arguments: "breadjambread"),
			Problem.TestCase(expectation: "jam", arguments: "xxbreadjambreadyy"),
			Problem.TestCase(expectation: "", arguments: "xxbreadyy"),
			Problem.TestCase(expectation: "breadjam", arguments: "xxbreadbreadjambreadyy"),
			Problem.TestCase(expectation: "A", arguments: "breadAbread"),
			Problem.TestCase(expectation: "", arguments: "breadbread"),
			Problem.TestCase(expectation: "", arguments: "abcbreaz"),
			Problem.TestCase(expectation: "", arguments: "xyz"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "breax", arguments: "breadbreaxbread"),
			Problem.TestCase(expectation: "y", arguments: "breaxbreadybread"),
			Problem.TestCase(expectation: "breadbread", arguments: "breadbreadbreadbread")
		],
		eulerMode: false
	),
	Problem(
		title: "sameStarChar",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Returns true if for every '*' (star) in the string, if there are characters both immediately before and after the star, they are the same.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "xy*yzz"),
			Problem.TestCase(expectation: false, arguments: "xy*zzz"),
			Problem.TestCase(expectation: true, arguments: "*xa*az"),
			Problem.TestCase(expectation: false, arguments: "*xa*bz"),
			Problem.TestCase(expectation: true, arguments: "*xa*a*"),
			Problem.TestCase(expectation: true, arguments: ""),
			Problem.TestCase(expectation: true, arguments: "*xa*a*a"),
			Problem.TestCase(expectation: false, arguments: "*xa*a*b"),
			Problem.TestCase(expectation: true, arguments: "*12*2*2"),
			Problem.TestCase(expectation: false, arguments: "12*2*3*"),
			Problem.TestCase(expectation: true, arguments: "abcDEF"),
			Problem.TestCase(expectation: false, arguments: "XY*YYYY*Z*"),
			Problem.TestCase(expectation: true, arguments: "XY*YYYY*Y*"),
			Problem.TestCase(expectation: false, arguments: "12*2*3*"),
			Problem.TestCase(expectation: true, arguments: "*"),
			Problem.TestCase(expectation: true, arguments: "**")
		],
		eulerMode: false
	),
	Problem(
		title: "oneTwo",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, compute a new string by moving the first char to come after the next two characters, so \"abc\" yields \"bca\". Repeat this process for each subsequent group of 3 characters, so \"abcdef\" yields \"bcaefd\". Ignore any group of fewer than 3 characters at the end.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "bca", arguments: "abc"),
			Problem.TestCase(expectation: "cat", arguments: "tca"),
			Problem.TestCase(expectation: "catdog", arguments: "tcagdo"),
			Problem.TestCase(expectation: "hocolctea", arguments: "chocolate"),
			Problem.TestCase(expectation: "231564897", arguments: "1234567890"),
			Problem.TestCase(expectation: "abxabxabxabxabxabxabx", arguments: "xabxabxabxabxabxabxab"),
			Problem.TestCase(expectation: "bcaefd", arguments: "abcdefx"),
			Problem.TestCase(expectation: "bcaefd", arguments: "abcdefxy"),
			Problem.TestCase(expectation: "bcaefdyzx", arguments: "abcdefxyz"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "", arguments: "x"),
			Problem.TestCase(expectation: "", arguments: "xy"),
			Problem.TestCase(expectation: "yzx", arguments: "xyz"),
			Problem.TestCase(expectation: "bcaefdhigkljmnkpqostrvwuyzx231564897", arguments: "abcdefghijklkmnopqrstuvwxyz1234567890"),
			Problem.TestCase(expectation: "bcaefdhigkljmnkpqostrvwuyzx231564897", arguments: "abcdefghijklkmnopqrstuvwxyz123456789"),
			Problem.TestCase(expectation: "bcaefdhigkljmnkpqostrvwuyzx231564", arguments: "abcdefghijklkmnopqrstuvwxyz12345678")
		],
		eulerMode: false
	),
	Problem(
		title: "zipZap",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Look for patterns like \"zip\" and \"zap\" in the string -- length-3, starting with 'z' and ending with 'p'. Return a string where for all such words, the middle letter is gone, so \"zipXzap\" yields \"zpXzp\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "zpXzp", arguments: "zipXzap"),
			Problem.TestCase(expectation: "zpzp", arguments: "zopzop"),
			Problem.TestCase(expectation: "zzzpzp", arguments: "zzzopzop"),
			Problem.TestCase(expectation: "zibzp", arguments: "zibzap"),
			Problem.TestCase(expectation: "zp", arguments: "zip"),
			Problem.TestCase(expectation: "zi", arguments: "zi"),
			Problem.TestCase(expectation: "z", arguments: "z"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "zp", arguments: "zzp"),
			Problem.TestCase(expectation: "abcppp", arguments: "abcppp"),
			Problem.TestCase(expectation: "azbcppp", arguments: "azbcppp"),
			Problem.TestCase(expectation: "azbcpzp", arguments: "azbcpzpp")
		],
		eulerMode: false
	),
	Problem(
		title: "starOut",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Return a version of the given string, where for every star (*) in the string the star and the characters immediately to its left and right are gone. So \"ab*cd\" yields \"ad\" and \"ab**cd\" also yields \"ad\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ad", arguments: "ab*cd"),
			Problem.TestCase(expectation: "ad", arguments: "ab**cd"),
			Problem.TestCase(expectation: "silly", arguments: "sm*eilly"),
			Problem.TestCase(expectation: "siy", arguments: "sm*eil*ly"),
			Problem.TestCase(expectation: "siy", arguments: "sm**eil*ly"),
			Problem.TestCase(expectation: "siy", arguments: "sm***eil*ly"),
			Problem.TestCase(expectation: "string", arguments: "stringy*"),
			Problem.TestCase(expectation: "tringy", arguments: "*stringy"),
			Problem.TestCase(expectation: "ty", arguments: "*str*in*gy"),
			Problem.TestCase(expectation: "abc", arguments: "abc"),
			Problem.TestCase(expectation: "c", arguments: "a*bc"),
			Problem.TestCase(expectation: "ab", arguments: "ab"),
			Problem.TestCase(expectation: "", arguments: "a*b"),
			Problem.TestCase(expectation: "a", arguments: "a"),
			Problem.TestCase(expectation: "", arguments: "a*"),
			Problem.TestCase(expectation: "", arguments: "*a"),
			Problem.TestCase(expectation: "", arguments: "*"),
			Problem.TestCase(expectation: "", arguments: "")
		],
		eulerMode: false
	),
	Problem(
		title: "plusOut",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "word", type: String.self)
		],
		prompt: "Given a string and a non-empty word string, return a version of the original String where all characters have been replaced by pluses (\"+\"), except for appearances of the word string which are preserved unchanged.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "++xy++", arguments: "12xy34", "xy"),
			Problem.TestCase(expectation: "1+++++", arguments: "12xy34", "1"),
			Problem.TestCase(expectation: "++xy++xy+++xy", arguments: "12xy34xyabcxy", "xy"),
			Problem.TestCase(expectation: "ab++ab++++", arguments: "abXYabcXYZ", "ab"),
			Problem.TestCase(expectation: "++++abc+++", arguments: "abXYabcXYZ", "abc"),
			Problem.TestCase(expectation: "++XY+++XY+", arguments: "abXYabcXYZ", "XY"),
			Problem.TestCase(expectation: "+++++++XYZ", arguments: "abXYxyzXYZ", "XYZ"),
			Problem.TestCase(expectation: "++++++", arguments: "--++ab", "++"),
			Problem.TestCase(expectation: "++xxxx++", arguments: "aaxxxxbb", "xx"),
			Problem.TestCase(expectation: "++3++3", arguments: "123123", "3")
		],
		eulerMode: false
	),
	Problem(
		title: "wordEnds",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self),
			Problem.Parameter(name: "word", type: String.self)
		],
		prompt: "Given a string and a non-empty word string, return a string made of each char just before and just after every appearance of the word in the string. Ignore cases where there is no char before or after the word, and a char may be included twice if it is between two words.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "c13i", arguments: "abcXY123XYijk", "XY"),
			Problem.TestCase(expectation: "13", arguments: "XY123XY", "XY"),
			Problem.TestCase(expectation: "11", arguments: "XY1XY", "XY"),
			Problem.TestCase(expectation: "XY", arguments: "XYXY", "XY"),
			Problem.TestCase(expectation: "", arguments: "XY", "XY"),
			Problem.TestCase(expectation: "", arguments: "Hi", "XY"),
			Problem.TestCase(expectation: "", arguments: "", "XY"),
			Problem.TestCase(expectation: "cxziij", arguments: "abc1xyz1i1j", "1"),
			Problem.TestCase(expectation: "cxz", arguments: "abc1xyz1", "1"),
			Problem.TestCase(expectation: "cxz11", arguments: "abc1xyz11", "1"),
			Problem.TestCase(expectation: "11", arguments: "abc1xyz1abc", "abc"),
			Problem.TestCase(expectation: "acac", arguments: "abc1xyz1abc", "b"),
			Problem.TestCase(expectation: "1111", arguments: "abc1abc1abc", "abc")
		],
		eulerMode: false
	)

]

// MARK: String-3
fileprivate let codingBatString3Problems: [Problem] = [
	Problem(
		title: "countYZ",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, count the number of words ending in 'y' or 'z' -- so the 'y' in \"heavy\" and the 'z' in \"fez\" count, but not the 'y' in \"yellow\" (not case sensitive). We'll say that a y or z is at the end of a word if there is not an alphabetic letter immediately following it.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 2, arguments: "fez day"),
			Problem.TestCase(expectation: 2, arguments: "day fez"),
			Problem.TestCase(expectation: 2, arguments: "day fyyyz"),
			Problem.TestCase(expectation: 1, arguments: "day yak"),
			Problem.TestCase(expectation: 1, arguments: "day:yak"),
			Problem.TestCase(expectation: 2, arguments: "!!day--yaz!!"),
			Problem.TestCase(expectation: 0, arguments: "yak zak"),
			Problem.TestCase(expectation: 2, arguments: "DAY abc XYZ"),
			Problem.TestCase(expectation: 3, arguments: "aaz yyz my"),
			Problem.TestCase(expectation: 2, arguments: "y2bz"),
			Problem.TestCase(expectation: 0, arguments: "zxyx")
		],
		eulerMode: false
	),
	Problem(
		title: "withoutString",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "base", type: String.self),
			Problem.Parameter(name: "remove", type: String.self)
		],
		prompt: "Given two strings, base and remove, return a version of the base string where all instances of the remove string have been removed (not case sensitive). You may assume that the remove string is length 1 or more. Remove only non-overlapping instances, so with \"xxx\" removing \"xx\" leaves \"x\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "He there", arguments: "Hello there", "llo"),
			Problem.TestCase(expectation: "Hllo thr", arguments: "Hello there", "e"),
			Problem.TestCase(expectation: "Hello there", arguments: "Hello there", "x"),
			Problem.TestCase(expectation: "Th a FH", arguments: "This is a FISH", "IS"),
			Problem.TestCase(expectation: "TH a FH", arguments: "THIS is a FISH", "is"),
			Problem.TestCase(expectation: "TH a FH", arguments: "THIS is a FISH", "iS"),
			Problem.TestCase(expectation: "abab", arguments: "abxxxxab", "xx"),
			Problem.TestCase(expectation: "abxab", arguments: "abxxxab", "xx"),
			Problem.TestCase(expectation: "abab", arguments: "abxxxab", "x"),
			Problem.TestCase(expectation: "", arguments: "xxx", "x"),
			Problem.TestCase(expectation: "x", arguments: "xxx", "xx"),
			Problem.TestCase(expectation: "xzz", arguments: "xyzzy", "Y"),
			Problem.TestCase(expectation: "", arguments: "", "x"),
			Problem.TestCase(expectation: "acac", arguments: "abcabc", "b"),
			Problem.TestCase(expectation: "AAbb", arguments: "AA22bb", "2"),
			Problem.TestCase(expectation: "", arguments: "1111", "1"),
			Problem.TestCase(expectation: "", arguments: "1111", "11"),
			Problem.TestCase(expectation: "jtx", arguments: "MkjtMkx", "Mk"),
			Problem.TestCase(expectation: "Hi ", arguments: "Hi HoHo", "Ho")
		],
		eulerMode: false
	),
	Problem(
		title: "equalIsNot",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return true if the number of appearances of \"is\" anywhere in the string is equal to the number of appearances of \"not\" anywhere in the string (case sensitive).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: false, arguments: "This is not"),
			Problem.TestCase(expectation: true, arguments: "This is notnot"),
			Problem.TestCase(expectation: true, arguments: "noisxxnotyynotxisi"),
			Problem.TestCase(expectation: false, arguments: "noisxxnotyynotxsi"),
			Problem.TestCase(expectation: true, arguments: "xxxyyyzzzintint"),
			Problem.TestCase(expectation: true, arguments: ""),
			Problem.TestCase(expectation: true, arguments: "isisnotnot"),
			Problem.TestCase(expectation: false, arguments: "isisnotno7Not"),
			Problem.TestCase(expectation: false, arguments: "isnotis"),
			Problem.TestCase(expectation: false, arguments: "mis3notpotbotis")
		],
		eulerMode: false
	),
	Problem(
		title: "gHappy",
		returnType: Bool.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "We'll say that a lowercase 'g' in a string is \"happy\" if there is another 'g' immediately to its left or right. Return true if all the g's in the given string are happy.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: true, arguments: "xxggxx"),
			Problem.TestCase(expectation: false, arguments: "xxgxx"),
			Problem.TestCase(expectation: false, arguments: "xxggyygxx"),
			Problem.TestCase(expectation: false, arguments: "g"),
			Problem.TestCase(expectation: true, arguments: "gg"),
			Problem.TestCase(expectation: true, arguments: ""),
			Problem.TestCase(expectation: true, arguments: "xxgggxyz"),
			Problem.TestCase(expectation: false, arguments: "xxgggxyg"),
			Problem.TestCase(expectation: true, arguments: "xxgggxygg"),
			Problem.TestCase(expectation: false, arguments: "mgm"),
			Problem.TestCase(expectation: true, arguments: "mggm"),
			Problem.TestCase(expectation: true, arguments: "yyygggxyy")
		],
		eulerMode: false
	),Problem(
		title: "countTriple",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "We'll say that a \"triple\" in a string is a char appearing three times in a row. Return the number of triples in the given string. The triples may overlap.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 1, arguments: "abcXXXabc"),
			Problem.TestCase(expectation: 3, arguments: "xxxabyyyycd"),
			Problem.TestCase(expectation: 0, arguments: "a"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 1, arguments: "XXXabc"),
			Problem.TestCase(expectation: 2, arguments: "XXXXabc"),
			Problem.TestCase(expectation: 3, arguments: "XXXXXabc"),
			Problem.TestCase(expectation: 3, arguments: "222abyyycdXXX"),
			Problem.TestCase(expectation: 4, arguments: "abYYYabXXXXXab"),
			Problem.TestCase(expectation: 0, arguments: "abYYXabXXYXXab"),
			Problem.TestCase(expectation: 0, arguments: "abYYXabXXYXXab"),
			Problem.TestCase(expectation: 1, arguments: "122abhhh2")
		],
		eulerMode: false
	),Problem(
		title: "sumDigits",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return the sum of the digits 0-9 that appear in the string, ignoring all other characters. Return 0 if there are no digits in the string. (Note: Int(str) converts a string to an int.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 6, arguments: "aa1bc2d3"),
			Problem.TestCase(expectation: 8, arguments: "aa11b33"),
			Problem.TestCase(expectation: 0, arguments: "Chocolate"),
			Problem.TestCase(expectation: 7, arguments: "5hoco1a1e"),
			Problem.TestCase(expectation: 12, arguments: "123abc123"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 0, arguments: "Hello"),
			Problem.TestCase(expectation: 12, arguments: "X1z9b2"),
			Problem.TestCase(expectation: 14, arguments: "5432a")
		],
		eulerMode: false
	),Problem(
		title: "sameEnds2",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "string", type: String.self)
		],
		prompt: "Given a string, return the longest substring that appears at both the beginning and end of the string without overlapping. For example, sameEnds2(string: \"abXab\") is \"ab\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ab", arguments: "abXYab"),
			Problem.TestCase(expectation: "x", arguments: "xx"),
			Problem.TestCase(expectation: "x", arguments: "xxx"),
			Problem.TestCase(expectation: "xx", arguments: "xxxx"),
			Problem.TestCase(expectation: "swift", arguments: "swiftXYZswift"),
			Problem.TestCase(expectation: "swift", arguments: "swiftswift"),
			Problem.TestCase(expectation: "", arguments: "xwiftXYZswift"),
			Problem.TestCase(expectation: "Hello!", arguments: "Hello! and Hello!"),
			Problem.TestCase(expectation: "", arguments: "x"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "", arguments: "abcb"),
			Problem.TestCase(expectation: "my", arguments: "mymmy")
		],
		eulerMode: false
	),
	  Problem(
		title: "mirrorEnds",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "string", type: String.self)
		],
		prompt: "Given a string, look for a mirror image (backwards) string at both the beginning and end of the given string. In other words, zero or more characters at the very begining of the given string, and at the very end of the string in reverse order (possibly overlapping). For example, the string \"abXYZba\" has the mirror end \"ab\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "ab", arguments: "abXYZba"),
			Problem.TestCase(expectation: "a", arguments: "abca"),
			Problem.TestCase(expectation: "aba", arguments: "aba"),
			Problem.TestCase(expectation: "", arguments: "abab"),
			Problem.TestCase(expectation: "xxx", arguments: "xxx"),
			Problem.TestCase(expectation: "xxYxx", arguments: "xxYxx"),
			Problem.TestCase(expectation: "Hi ", arguments: "Hi and iH"),
			Problem.TestCase(expectation: "x", arguments: "x"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "123", arguments: "123and then 321"),
			Problem.TestCase(expectation: "ba", arguments: "band andab")
		],
		eulerMode: false
	),
	  Problem(
		title: "maxBlock",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return the length of the largest \"block\" in the string. A block is a run of adjacent characters that are the same.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 2, arguments: "hoopla"),
			Problem.TestCase(expectation: 3, arguments: "abbCCCddBBBxx"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 1, arguments: "xyz"),
			Problem.TestCase(expectation: 2, arguments: "xxyz"),
			Problem.TestCase(expectation: 2, arguments: "xyzz"),
			Problem.TestCase(expectation: 3, arguments: "abbbcbbbxbbbx"),
			Problem.TestCase(expectation: 3, arguments: "XXBBBbbxx"),
			Problem.TestCase(expectation: 4, arguments: "XXBBBBbbxx"),
			Problem.TestCase(expectation: 4, arguments: "XXBBBbbxxXXXX"),
			Problem.TestCase(expectation: 4, arguments: "XX2222BBBbbXX2222")
		],
		eulerMode: false
	),
	  Problem(
		title: "sumNumbers",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return the sum of the numbers appearing in the string, ignoring all other characters. A number is a series of 1 or more digit characters in a row. (Note: Int(string) converts a string to an int.)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: 123, arguments: "abc123xyz"),
			Problem.TestCase(expectation: 44, arguments: "aa11b33"),
			Problem.TestCase(expectation: 18, arguments: "7 11"),
			Problem.TestCase(expectation: 0, arguments: "Chocolate"),
			Problem.TestCase(expectation: 7, arguments: "5hoco1a1e"),
			Problem.TestCase(expectation: 7, arguments: "5$$1;;1!!"),
			Problem.TestCase(expectation: 1245, arguments: "a1234bb11"),
			Problem.TestCase(expectation: 0, arguments: ""),
			Problem.TestCase(expectation: 25, arguments: "a22bbb3")
		],
		eulerMode: false
	),
	  Problem(
		title: "notReplace",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a string where every appearance of the lowercase word \"is\" has been replaced with \"is not\". The word \"is\" should not be immediately preceeded or followed by a letter -- so for example the \"is\" in \"this\" does not count.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "is not test", arguments: "is test"),
			Problem.TestCase(expectation: "is not-is not", arguments: "is-is"),
			Problem.TestCase(expectation: "This is not right", arguments: "This is right"),
			Problem.TestCase(expectation: "This is not isabell", arguments: "This is isabell"),
			Problem.TestCase(expectation: "", arguments: ""),
			Problem.TestCase(expectation: "is not", arguments: "is"),
			Problem.TestCase(expectation: "isis", arguments: "isis"),
			Problem.TestCase(expectation: "Dis is not bliss is not", arguments: "Dis is bliss is"),
			Problem.TestCase(expectation: "is not his", arguments: "is his"),
			Problem.TestCase(expectation: "xis yis", arguments: "xis yis"),
			Problem.TestCase(expectation: "AAAis is not", arguments: "AAAis is")
		],
		eulerMode: false
	)

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
		prompt: "Given a number n, create and return a new int array of length n, containing the numbers 0, 1, 2, ... n-1. The given n may be 0, in which case just return a length 0 array. You do not need a separate if-statement for the length-0 case; the for-loop should naturally execute 0 times in that case, so it just works.",
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
		prompt: "Given a number n, create and return a new string array of length n, containing the strings \"0\", \"1\" \"2\" .. through n-1. N may be 0, in which case just return a length 0 array. Note: String(xxx) will make the String form of an Int.",
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
		prompt: "Given arrays nums1 and nums2 of the same length, for every element in nums1, consider the corresponding element in nums2 (at the same index). Return the count of the number of times that the two elements differ by 2 or less, but are not equal.",
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
		prompt: "Given an array of ints, return true if the array contains two 7's next to each other, or there are two 7's separated by one element, such as with [7, 1, 7].",
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
		prompt: "Return true if the group of N numbers at the start and end of the array are the same. For example, with [5, 6, 45, 99, 13, 5, 6], the ends are the same for n=0 and n=2, and false for n=1 and n=3. You may assume that n is in the range 0...nums.count.",
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
		prompt: "For each multiple of 10 in the given array, change all the values following it to be that multiple of 10, until encountering another multiple of 10. So [2, 10, 3, 4, 20, 5] yields [2, 10, 10, 10, 20, 20].",
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
		prompt: "Return an array that contains the exact same numbers as the given array, but rearranged so that all the zeros are grouped at the start of the array. The order of the non-zero numbers does not matter. So [1, 0, 0, 1] becomes [0 ,0, 1, 1]. You may modify and return the given array or make a new array.",
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
		prompt: "Return a version of the given array where all the 10's have been removed. The remaining elements should shift left towards the start of the array as needed, and the empty spaces a the end of the array should be 0. So [1, 10, 10, 2] yields [1, 2, 0, 0].",
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

// MARK: Array-3
fileprivate let codingBatArray3Problems: [Problem] = [
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

// MARK: Dictionary-1

fileprivate let codingBatDictionary1Problems: [Problem] = [
	Problem(
		title: "dictionaryBully",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "dictionary", type: [String: String].self)
		],
		prompt: "Given a dictionary, return a copy with the following changes: if the key \"a\" has a value, set the key \"b\" to have that value, and set the key \"a\" to have the value \"\". Basically \"b\" is a bully, taking the value and replacing it with the empty string.",
		solution: """
		func dictionaryBully(dictionary: [String : String]) -> [String : String] {
			var result = dictionary
			
			if let a = dictionary["a"] {
				result["b"] = a
				result["a"] = ""
			}
			
			return result
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a": "", "b": "candy"], arguments: ["a": "candy", "b": "dirt"]),
			Problem.TestCase(expectation: ["a": "", "b": "candy"], arguments: ["a": "candy"]),
			Problem.TestCase(expectation: ["a": "", "b": "candy", "c": "meh"], arguments: ["a": "candy", "b": "carrot", "c": "meh"]),
			Problem.TestCase(expectation: ["b": "carrot"], arguments: ["b": "carrot"]),
			Problem.TestCase(expectation: ["c": "meh"], arguments: ["c": "meh"]),
			Problem.TestCase(expectation: ["a": "", "b": "sparkle", "c": "meh"], arguments: ["a": "sparkle", "c": "meh"])
		],
		eulerMode: false
	),
	Problem(
		title: "dictionaryShare",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "dictionary", type: [String: String].self)
		],
		prompt: "Given a dictionary, return a copy with the following changes: if the key \"a\" has a value, set the key \"b\" to have that same value. In all cases remove the key \"c\", leaving the rest of the dictionary unchanged.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a": "aaa", "b": "aaa"], arguments: ["a": "aaa", "b": "bbb", "c": "ccc"]),
			Problem.TestCase(expectation: ["b": "xyz"], arguments: ["b": "xyz", "c": "ccc"]),
			Problem.TestCase(expectation: ["a": "aaa", "b": "aaa", "d": "hi"], arguments: ["a": "aaa", "c": "meh", "d": "hi"]),
			Problem.TestCase(expectation: ["a": "xyz", "b": "xyz", "z": "zzz"], arguments: ["a": "xyz", "b": "1234", "c": "yo", "z": "zzz"]),
			Problem.TestCase(expectation: ["a": "xyz", "b": "xyz", "d": "ddd", "e": "everything"], arguments: ["a": "xyz", "b": "1234", "c": "yo", "d": "ddd", "e": "everything"])
		],
		eulerMode: false
	),
	Problem(
		title: "dictionaryAB",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "dictionary", type: [String: String].self)
		],
		prompt: "Given a dictionary, return a copy with the following changes: for this problem the dictionary may or may not contain the \"a\" and \"b\" keys. If both keys are present, append their 2 string values together and store the result under the key \"ab\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a": "Hi", "ab": "HiThere", "b": "There"], arguments: ["a": "Hi", "b": "There"]),
			Problem.TestCase(expectation: ["a": "Hi"], arguments: ["a": "Hi"]),
			Problem.TestCase(expectation: ["b": "There"], arguments: ["b": "There"]),
			Problem.TestCase(expectation: ["c": "meh"], arguments: ["c": "meh"]),
			Problem.TestCase(expectation: ["a": "aaa", "ab": "aaabbb", "b": "bbb", "c": "ccc"], arguments: ["a": "aaa", "ab": "nope", "b": "bbb", "c": "ccc"]),
			Problem.TestCase(expectation: ["ab": "nope", "b": "bbb", "c": "ccc"], arguments: ["ab": "nope", "b": "bbb", "c": "ccc"])
		],
		eulerMode: false
	),
	Problem(
		title: "topping1",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "dictionary", type: [String: String].self)
		],
		prompt: "Given a dictionary of food keys and topping values, return a copy of the dictionary with the following changes: if the key \"ice cream\" is present, set its value to \"cherry\". In all cases, set the key \"bread\" to have the value \"butter\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["bread": "butter", "ice cream": "cherry"], arguments: ["ice cream": "peanuts"]),
			Problem.TestCase(expectation: ["bread": "butter"], arguments: [String: String]()),
			Problem.TestCase(expectation: ["bread": "butter", "pancake": "syrup"], arguments: ["pancake": "syrup"]),
			Problem.TestCase(expectation: ["bread": "butter", "ice cream": "cherry"], arguments: ["bread": "dirt", "ice cream": "strawberries"]),
			Problem.TestCase(expectation: ["bread": "butter", "ice cream": "cherry", "salad": "oil"], arguments: ["bread": "jam", "ice cream": "strawberries", "salad": "oil"])
		],
		eulerMode: false
	),
	Problem(
		title: "topping2",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "dictionary", type: [String: String].self)
		],
		prompt: "Given a dictionary of food keys and their topping values, return a copy of the dictionary with the following changes: if the key \"ice cream\" has a value, set that as the value for the key \"yogurt\" also. If the key \"spinach\" has a value, change that value to \"nuts\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["yogurt": "cherry", "ice cream": "cherry"], arguments: ["ice cream": "cherry"]),
			Problem.TestCase(expectation: ["yogurt": "cherry", "spinach": "nuts", "ice cream": "cherry"], arguments: ["spinach": "dirt", "ice cream": "cherry"]),
			Problem.TestCase(expectation: ["yogurt": "salt"], arguments: ["yogurt": "salt"]),
			Problem.TestCase(expectation: ["yogurt": "salt", "bread": "butter"], arguments: ["yogurt": "salt", "bread": "butter"]),
			Problem.TestCase(expectation: [String: String](), arguments: [String: String]()),
			Problem.TestCase(expectation: ["yogurt": "air", "ice cream": "air", "salad": "oil"], arguments: ["ice cream": "air", "salad": "oil"])
		],
		eulerMode: false
	),
	Problem(
		title: "topping3",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "dictionary", type: [String: String].self)
		],
		prompt: "Given a dictionary of food keys and topping values, return a copy of the dictionary with the following changes: if the key \"potato\" has a value, set that as the value for the key \"fries\". If the key \"salad\" has a value, set that as the value for the key \"spinach\".",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["potato": "ketchup", "fries": "ketchup"], arguments: ["potato": "ketchup"]),
			Problem.TestCase(expectation: ["potato": "butter", "fries": "butter"], arguments: ["potato": "butter"]),
			Problem.TestCase(expectation: ["spinach": "oil", "salad": "oil", "potato": "ketchup", "fries": "ketchup"], arguments: ["salad": "oil", "potato": "ketchup"]),
			Problem.TestCase(expectation: ["toast": "butter", "spinach": "oil", "salad": "oil", "potato": "ketchup", "fries": "ketchup"], arguments: ["toast": "butter", "salad": "oil", "potato": "ketchup"]),
			Problem.TestCase(expectation: [String: String](), arguments: [String: String]()),
			Problem.TestCase(expectation: ["spinach": "pepper", "salad": "pepper", "fries": "salt"], arguments: ["salad": "pepper", "fries": "salt"])
		],
		eulerMode: false
	),
	Problem(
		title: "dictionaryAB2",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "dictionary", type: [String: String].self)
		],
		prompt: "Given a dictionary, return a copy with the following changes: if the keys \"a\" and \"b\" are both in the dictionary and have equal values, remove them both.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["c": "cake"], arguments: ["a": "aaa", "b": "aaa", "c": "cake"]),
			Problem.TestCase(expectation: ["a": "aaa", "b": "bbb"], arguments: ["a": "aaa", "b": "bbb"]),
			Problem.TestCase(expectation: ["a": "aaa", "b": "bbb", "c": "aaa"], arguments: ["a": "aaa", "b": "bbb", "c": "aaa"]),
			Problem.TestCase(expectation: ["a": "aaa"], arguments: ["a": "aaa"]),
			Problem.TestCase(expectation: ["b": "bbb"], arguments: ["b": "bbb"]),
			Problem.TestCase(expectation: ["c": "ccc"], arguments: ["a": "", "b": "", "c": "ccc"]),
			Problem.TestCase(expectation: [String: String](), arguments: [String: String]()),
			Problem.TestCase(expectation: ["a": "a", "b": "b", "z": "zebra"], arguments: ["a": "a", "b": "b", "z": "zebra"])
		],
		eulerMode: false
	),
	Problem(
		title: "dictionaryAB3",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "dictionary", type: [String: String].self)
		],
		prompt: "Given a dictionary, return a copy with the following changes: if exactly one of the keys \"a\" or \"b\" has a value in the dictionary (but not both), set the other to have that same value in the dictionary.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a": "aaa", "b": "aaa", "c": "cake"], arguments: ["a": "aaa", "c": "cake"]),
			Problem.TestCase(expectation: ["a": "bbb", "b": "bbb", "c": "cake"], arguments: ["b": "bbb", "c": "cake"]),
			Problem.TestCase(expectation: ["a": "aaa", "b": "bbb", "c": "cake"], arguments: ["a": "aaa", "b": "bbb", "c": "cake"]),
			Problem.TestCase(expectation: ["ccc": "ccc"], arguments: ["ccc": "ccc"]),
			Problem.TestCase(expectation: ["c": "a", "d": "b"], arguments: ["c": "a", "d": "b"]),
			Problem.TestCase(expectation: [String: String](), arguments: [String: String]()),
			Problem.TestCase(expectation: ["a": "", "b": ""], arguments: ["a": ""]),
			Problem.TestCase(expectation: ["a": "", "b": ""], arguments: ["b": ""]),
			Problem.TestCase(expectation: ["a": "", "b": ""], arguments: ["a": "", "b": ""]),
			Problem.TestCase(expectation: ["aa": "aa", "a": "apple", "b": "apple", "z": "zzz"], arguments: ["aa": "aa", "a": "apple", "z": "zzz"])
		],
		eulerMode: false
	),
	Problem(
		title: "dictionaryAB4",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "dictionary", type: [String: String].self)
		],
		prompt: "Given a dictionary, return a copy with the following changes: if the keys \"a\" and \"b\" have values that have different lengths, then set \"c\" to have the longer value. If the values exist and have the same length, change them both to the empty string in the dictionary.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a": "aaa", "b": "bb", "c": "aaa"], arguments: ["a": "aaa", "b": "bb", "c": "cake"]),
			Problem.TestCase(expectation: ["a": "aa", "b": "bbb", "c": "bbb"], arguments: ["a": "aa", "b": "bbb", "c": "cake"]),
			Problem.TestCase(expectation: ["a": "aa", "b": "bbb", "c": "bbb"], arguments: ["a": "aa", "b": "bbb"]),
			Problem.TestCase(expectation: ["a": "aaa"], arguments: ["a": "aaa"]),
			Problem.TestCase(expectation: ["b": "bbb"], arguments: ["b": "bbb"]),
			Problem.TestCase(expectation: ["a": "", "b": "", "c": "cake"], arguments: ["a": "aaa", "b": "bbb", "c": "cake"]),
			Problem.TestCase(expectation: ["a": "", "b": "", "c": "cake"], arguments: ["a": "a", "b": "b", "c": "cake"]),
			Problem.TestCase(expectation: ["a": "", "b": "b", "c": "b"], arguments: ["a": "", "b": "b", "c": "cake"]),
			Problem.TestCase(expectation: ["a": "a", "b": "", "c": "a"], arguments: ["a": "a", "b": "", "c": "cake"]),
			Problem.TestCase(expectation: ["c": "cat", "d": "dog"], arguments: ["c": "cat", "d": "dog"]),
			Problem.TestCase(expectation: ["ccc": "ccc"], arguments: ["ccc": "ccc"]),
			Problem.TestCase(expectation: ["c": "a", "d": "b"], arguments: ["c": "a", "d": "b"]),
			Problem.TestCase(expectation: [String: String](), arguments: [String: String]()),
			Problem.TestCase(expectation: ["a": "", "z": "z"], arguments: ["a": "", "z": "z"]),
			Problem.TestCase(expectation: ["b": "", "z": "z"], arguments: ["b": "", "z": "z"])
		],
		eulerMode: false
	)
]

// MARK: Dictionary-2

fileprivate let codingBatDictionary2Problems: [Problem] = [
	Problem(
		title: "word0",
		returnType: [String: Int].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return a [String : Int] dictionary containing a key for every different string in the array, always with the value 0. For example the string \"hello\" makes the pair \"hello\":0. We'll do more complicated counting later, but for this problem the value is simply 0.",
		solution: """
		func word0(strings: [String]) -> [String : Int] {
			var dictionary: [String: Int] = [:]
			
			for string in strings {
				dictionary[string] = 0
			}
			
			return dictionary
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a": 0, "b": 0], arguments: ["a", "b", "a", "b"]),
			Problem.TestCase(expectation: ["a": 0, "b": 0, "c": 0], arguments: ["a", "b", "a", "c", "b"]),
			Problem.TestCase(expectation: ["a": 0, "b": 0, "c": 0], arguments: ["c", "b", "a"]),
			Problem.TestCase(expectation: ["c": 0], arguments: ["c", "c", "c", "c"]),
			Problem.TestCase(expectation: [String: Int](), arguments: [String]())
		],
		eulerMode: false
	),
	Problem(
		title: "wordLen",
		returnType: [String: Int].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return a [String: Int] dictionary containing a key for every different string in the array, and the value is that string's length.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["bb": 2, "a": 1], arguments: ["a", "bb", "a", "bb"]),
			Problem.TestCase(expectation: ["that": 4, "and": 3, "this": 4], arguments: ["this", "and", "that", "and"]),
			Problem.TestCase(expectation: ["code": 4, "bug": 3], arguments: ["code", "code", "code", "bug"]),
			Problem.TestCase(expectation: [String: Int](), arguments: [String]()),
			Problem.TestCase(expectation: ["z": 1], arguments: ["z"])
		],
		eulerMode: false
	),
	Problem(
		title: "pairs",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of non-empty strings, create and return a [String: String] dictionary as follows: for each string add its first character as a key with its last character as the value.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["b": "g", "c": "e"], arguments: ["code", "bug"]),
			Problem.TestCase(expectation: ["m": "n"], arguments: ["man", "moon", "main"]),
			Problem.TestCase(expectation: ["g": "d", "m": "n", "n": "t"], arguments: ["man", "moon", "good", "night"]),
			Problem.TestCase(expectation: [String: String](), arguments: [String]()),
			Problem.TestCase(expectation: ["a": "a", "b": "b"], arguments: ["a", "b"]),
			Problem.TestCase(expectation: ["a": "d", "c": "s"], arguments: ["are", "codes", "and", "cods"]),
			Problem.TestCase(expectation: ["a": "e", "b": "a", "c": "e", "t": "a"], arguments: ["apple", "banana", "tea", "coffee"])
		],
		eulerMode: false
	),
	Problem(
		title: "wordCount",
		returnType: [String: Int].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "The classic word-count algorithm: given an array of strings, return a [String: Int] dictionary with a key for each different string, with the value the number of times that string appears in the array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a": 2, "b": 2, "c": 1], arguments: ["a", "b", "a", "c", "b"]),
			Problem.TestCase(expectation: ["a": 1, "b": 1, "c": 1], arguments: ["c", "b", "a"]),
			Problem.TestCase(expectation: ["c": 4], arguments: ["c", "c", "c", "c"]),
			Problem.TestCase(expectation: [String: Int](), arguments: [String]()),
			Problem.TestCase(expectation: ["": 1, "and": 1, "this": 2], arguments: ["this", "and", "this", ""]),
			Problem.TestCase(expectation: ["x": 2, "X": 1, "y": 1, "Y": 1], arguments: ["x", "y", "x", "Y", "X"]),
			Problem.TestCase(expectation: ["0": 1, "1": 1, "123": 2], arguments: ["123", "0", "123", "1"]),
			Problem.TestCase(expectation: ["a": 4, "b": 5, "d": 3, "e": 1, "f": 1, "one": 1, "x": 2, "z": 2, "two": 2], arguments: ["d", "a", "e", "d", "a", "d", "b", "b", "z", "a", "a", "b", "z", "x", "b", "f", "x", "two", "b", "one", "two"]),
			Problem.TestCase(expectation: ["banana": 2, "apple": 3, "tea": 1, "coffee": 1], arguments: ["apple", "banana", "apple", "apple", "tea", "coffee", "banana"])
		],
		eulerMode: false
	),
	Problem(
		title: "firstChar",
		returnType: [String: String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of non-empty strings, return a [String: String] dictionary with a key for every different first character seen, with the value of all the strings starting with that character appended together in the order they appear in the array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["s": "saltsoda", "t": "teatoast"], arguments: ["salt", "tea", "soda", "toast"]),
			Problem.TestCase(expectation: ["a": "aaaAA", "b": "bb", "c": "cccCC", "d": "d"], arguments: ["aa", "bb", "cc", "aAA", "cCC", "d"]),
			Problem.TestCase(expectation: [String: String](), arguments: [String]()),
			Problem.TestCase(expectation: ["a": "appleaardvark", "b": "bellsbellsbells", "s": "saltsun", "z": "zen"], arguments: ["apple", "bells", "salt", "aardvark", "bells", "sun", "zen", "bells"])
		],
		eulerMode: false
	),
	Problem(
		title: "wordAppend",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Loop over the given array of strings to build a result string like this: when a string appears the 2nd, 4th, 6th, etc. time in the array, append the string to the result. Return the empty string if no string appears a 2nd time.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: "a", arguments: ["a", "b", "a"]),
			Problem.TestCase(expectation: "aa", arguments: ["a", "b", "a", "c", "a", "d", "a"]),
			Problem.TestCase(expectation: "a", arguments: ["a", "", "a"]),
			Problem.TestCase(expectation: "", arguments: [String]()),
			Problem.TestCase(expectation: "ba", arguments: ["a", "b", "b", "a", "a"]),
			Problem.TestCase(expectation: "baa", arguments: ["a", "b", "b", "b", "a", "c", "a", "a"]),
			Problem.TestCase(expectation: "baaba", arguments: ["a", "b", "b", "b", "a", "c", "a", "a", "a", "b", "a"]),
			Problem.TestCase(expectation: "andornot", arguments: ["not", "and", "or", "and", "this", "and", "or", "that", "not"]),
			Problem.TestCase(expectation: "", arguments: ["a", "b", "c"]),
			Problem.TestCase(expectation: "thisandthat", arguments: ["this", "or", "that", "and", "this", "and", "that"]),
			Problem.TestCase(expectation: "xxyyzzxx", arguments: ["xx", "xx", "yy", "xx", "zz", "yy", "zz", "xx"])
		],
		eulerMode: false
	),
	Problem(
		title: "wordMultiple",
		returnType: [String: Bool].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return a [String: Bool] dictionary where each different string is a key and its value is true if that string appears 2 or more times in the array.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a": true, "b": true, "c": false], arguments: ["a", "b", "a", "c", "b"]),
			Problem.TestCase(expectation: ["a": false, "b": false, "c": false], arguments: ["c", "b", "a"]),
			Problem.TestCase(expectation: ["c": true], arguments: ["c", "c", "c", "c"]),
			Problem.TestCase(expectation: [String: Bool](), arguments: [String]()),
			Problem.TestCase(expectation: ["and": false, "this": true], arguments: ["this", "and", "this"]),
			Problem.TestCase(expectation: ["a": true, "b": true, "d": true, "e": false, "x": false, "z": true], arguments: ["d", "a", "e", "d", "a", "d", "b", "b", "z", "a", "a", "b", "z", "x"])
		],
		eulerMode: false
	),
	Problem(
		title: "allSwap",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "We'll say that 2 strings \"match\" if they are non-empty and their first chars are the same. Loop over and then return the given array of non-empty strings as follows: if a string matches an earlier string in the array, swap the 2 strings in the array. When a position in the array has been swapped, it no longer matches anything. Using a dictionary, this can be solved making just one pass over the array. More difficult than it looks.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["ac", "ab"], arguments: ["ab", "ac"]),
			Problem.TestCase(expectation: ["ay", "by", "cy", "cx", "bx", "ax", "azz", "aaa"], arguments: ["ax", "bx", "cx", "cy", "by", "ay", "aaa", "azz"]),
			Problem.TestCase(expectation: ["ay", "by", "ax", "bx", "aj", "ai", "by", "bx"], arguments: ["ax", "bx", "ay", "by", "ai", "aj", "bx", "by"]),
			Problem.TestCase(expectation: ["ay", "bx", "cy", "ax", "cx", "abb", "aaa"], arguments: ["ax", "bx", "cx", "ay", "cy", "aaa", "abb"]),
			Problem.TestCase(expectation: ["every", "does", "ice", "easy", "it", "eaten"], arguments: ["easy", "does", "it", "every", "ice", "eaten"]),
			Problem.TestCase(expectation: ["lily", "over", "water", "swims", "of", "list", "words", "wait"], arguments: ["list", "of", "words", "swims", "over", "lily", "water", "wait"]),
			Problem.TestCase(expectation: ["42", "8", "16", "15", "23", "4"], arguments: ["4", "8", "15", "16", "23", "42"]),
			Problem.TestCase(expectation: ["aaa"], arguments: ["aaa"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["a", "b", "c", "xx", "yy", "zz"], arguments: ["a", "b", "c", "xx", "yy", "zz"])
		],
		eulerMode: false
	),
	Problem(
		title: "firstSwap",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "We'll say that 2 strings \"match\" if they are non-empty and their first chars are the same. Loop over and then return the given array of non-empty strings as follows: if a string matches an earlier string in the array, swap the 2 strings in the array. A particular first character can only cause 1 swap, so once a character has caused a swap, its later swaps are disabled. Using a dictionary, this can be solved making just one pass over the array. More difficult than it looks.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["ac", "ab"], arguments: ["ab", "ac"]),
			Problem.TestCase(expectation: ["ay", "by", "cy", "cx", "bx", "ax", "aaa", "azz"], arguments: ["ax", "bx", "cx", "cy", "by", "ay", "aaa", "azz"]),
			Problem.TestCase(expectation: ["ay", "by", "ax", "bx", "ai", "aj", "bx", "by"], arguments: ["ax", "bx", "ay", "by", "ai", "aj", "bx", "by"]),
			Problem.TestCase(expectation: ["ay", "bx", "cy", "ax", "cx", "aaa", "abb"], arguments: ["ax", "bx", "cx", "ay", "cy", "aaa", "abb"]),
			Problem.TestCase(expectation: ["every", "does", "ice", "easy", "it", "eaten"], arguments: ["easy", "does", "it", "every", "ice", "eaten"]),
			Problem.TestCase(expectation: ["lily", "over", "water", "swims", "of", "list", "words", "wait"], arguments: ["list", "of", "words", "swims", "over", "lily", "water", "wait"]),
			Problem.TestCase(expectation: ["42", "8", "16", "15", "23", "4"], arguments: ["4", "8", "15", "16", "23", "42"]),
			Problem.TestCase(expectation: ["aaa"], arguments: ["aaa"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["a", "b", "c", "xx", "yy", "zz"], arguments: ["a", "b", "c", "xx", "yy", "zz"])
		],
		eulerMode: false
	)

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
		hint: "First, detect the \"base case\", a case so simple that the answer can be returned immediately (here when n==1). Otherwise make a recursive call of factorial(n: n-1) (towards the base case). Assume the recursive call returns a correct value, and fix that value up to make our result.",
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
		hint: "First detect the base case (bunnies == 0), and in that case just return 0. Otherwise, make a recursive call to bunnyEars(bunnies: bunnies-1). Trust that the recursive call returns the correct value, and fix it up by adding 2.",
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

// MARK: Recursion-2

fileprivate let codingBatRecursion2Problems: [Problem] = [
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
		hint: "The base case is when start>=nums.count. In that case, return true if target==0. Otherwise, consider the element at nums[start]. The key idea is that there are only 2 possibilities -- nums[start] is chosen or it is not. Make one recursive call to see if a solution is possible if nums[start] is chosen (subtract nums[start] from target in that call). Make another recursive call to see if a solution is possible if nums[start] is not chosen. Return true if either of the two recursive calls returns true.",
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

// MARK: Functional-1

fileprivate let codingBatFunctional1Problems: [Problem] = [
	Problem(
		title: "doubling",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of integers, return an array where each integer is multiplied by 2.",
		solution: """
		func doubling(nums: [Int]) -> [Int] {
			return nums.map { n in n * 2 }
		}
		""",
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [2, 4, 6], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [12, 16, 12, 16, -2], arguments: [6, 8, 6, 8, -1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [10], arguments: [5]),
			Problem.TestCase(expectation: [10, 20], arguments: [5, 10]),
			Problem.TestCase(expectation: [16, -10, 14, 6, 218], arguments: [8, -5, 7, 3, 109]),
			Problem.TestCase(expectation: [12, -6, 24, 46, 8, 2, 38, 22, 4, 6, 4], arguments: [6, -3, 12, 23, 4, 1, 19, 11, 2, 3, 2]),
			Problem.TestCase(expectation: [6, 2, 8, 2, 10, 18], arguments: [3, 1, 4, 1, 5, 9])
		],
		eulerMode: false
	),
	Problem(
		title: "square",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of integers, return an array where each integer is multiplied with itself.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 4, 9], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [36, 64, 36, 64, 1], arguments: [6, 8, -6, -8, 1]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [144], arguments: [12]),
			Problem.TestCase(expectation: [25, 100], arguments: [5, 10]),
			Problem.TestCase(expectation: [36, 9, 144, 529, 16, 1, 361, 121, 4, 9, 4], arguments: [6, -3, 12, 23, 4, 1, 19, 11, 2, 3, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "addStar",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string has \"*\" added at its end.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a*", "bb*", "ccc*"], arguments: ["a", "bb", "ccc"]),
			Problem.TestCase(expectation: ["hello*", "there*"], arguments: ["hello", "there"]),
			Problem.TestCase(expectation: ["**"], arguments: ["*"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["kittens*", "and*", "chocolate*", "and*"], arguments: ["kittens", "and", "chocolate", "and"]),
			Problem.TestCase(expectation: ["empty*", "string*", "*"], arguments: ["empty", "string", ""])
		],
		eulerMode: false
	),
	Problem(
		title: "copies3",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string is replaced by 3 copies of the string concatenated together.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["aaa", "bbbbbb", "ccccccccc"], arguments: ["a", "bb", "ccc"]),
			Problem.TestCase(expectation: ["242424", "aaa", ""], arguments: ["24", "a", ""]),
			Problem.TestCase(expectation: ["hellohellohello", "theretherethere"], arguments: ["hello", "there"]),
			Problem.TestCase(expectation: ["nonono"], arguments: ["no"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["thisthisthis", "andandand", "thatthatthat", "andandand"], arguments: ["this", "and", "that", "and"])
		],
		eulerMode: false
	),
	Problem(
		title: "moreY",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string has \"y\" added at its start and end.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["yay", "yby", "ycy"], arguments: ["a", "b", "c"]),
			Problem.TestCase(expectation: ["yhelloy", "ytherey"], arguments: ["hello", "there"]),
			Problem.TestCase(expectation: ["yyayy"], arguments: ["yay"]),
			Problem.TestCase(expectation: ["yy", "yay", "yxxy"], arguments: ["", "a", "xx"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["yxxy", "yyyy", "yzzy"], arguments: ["xx", "yy", "zz"])
		],
		eulerMode: false
	),
	Problem(
		title: "math1",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of integers, return an array where each integer is added to 1 and the result is multiplied by 10.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [20, 30, 40], arguments: [1, 2, 3]),
			Problem.TestCase(expectation: [70, 90, 70, 90, 20], arguments: [6, 8, 6, 8, 1]),
			Problem.TestCase(expectation: [110], arguments: [10]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [60, 110], arguments: [5, 10]),
			Problem.TestCase(expectation: [0, -10, -20, -10, 0], arguments: [-1, -2, -3, -2, -1]),
			Problem.TestCase(expectation: [70, -20, 130, 240, 50, 20, 200, 120, 30, 40, 30], arguments: [6, -3, 12, 23, 4, 1, 19, 11, 2, 3, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "rightDigit",
		returnType: [Int].self,
		parameters: [
			Problem.Parameter(name: "nums", type: [Int].self)
		],
		prompt: "Given an array of non-negative integers, return an integer array of the rightmost digits. (Note: use %)",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: [1, 2, 3], arguments: [1, 22, 93]),
			Problem.TestCase(expectation: [6, 8, 6, 8, 1], arguments: [16, 8, 886, 8, 1]),
			Problem.TestCase(expectation: [0, 0], arguments: [10, 0]),
			Problem.TestCase(expectation: [Int](), arguments: [Int]()),
			Problem.TestCase(expectation: [5, 0], arguments: [5, 10]),
			Problem.TestCase(expectation: [5, 0, 0, 0, 0], arguments: [5, 50, 500, 5000, 5000]),
			Problem.TestCase(expectation: [6, 3, 2, 3, 4, 1, 9, 9, 2, 3, 2], arguments: [6, 23, 12, 23, 4, 1, 19, 1119, 2, 3, 2])
		],
		eulerMode: false
	),
	Problem(
		title: "lower",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string is converted to lower case (Note: String lowercased() method).",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["hello", "hi"], arguments: ["Hello", "Hi"]),
			Problem.TestCase(expectation: ["aaa", "bbb", "ccc"], arguments: ["AAA", "BBB", "ccc"]),
			Problem.TestCase(expectation: ["kitten", "chocolate"], arguments: ["KitteN", "ChocolaTE"]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["empty", ""], arguments: ["EMPTY", ""]),
			Problem.TestCase(expectation: ["aax", "byb", "ycc", "zzz"], arguments: ["aaX", "bYb", "Ycc", "ZZZ"])
		],
		eulerMode: false
	),
	Problem(
		title: "noX2",
		returnType: [String].self,
		parameters: [
			Problem.Parameter(name: "strings", type: [String].self)
		],
		prompt: "Given an array of strings, return an array where each string has all its \"x\" removed.",
		solution: nil,
		hint: nil,
		testCases: [
			Problem.TestCase(expectation: ["a", "bb", "c"], arguments: ["ax", "bb", "cx"]),
			Problem.TestCase(expectation: ["a", "bb", "c"], arguments: ["xxax", "xbxbx", "xxcx"]),
			Problem.TestCase(expectation: [""], arguments: ["x"]),
			Problem.TestCase(expectation: [""], arguments: [""]),
			Problem.TestCase(expectation: [String](), arguments: [String]()),
			Problem.TestCase(expectation: ["the", "tai"], arguments: ["the", "taxi"]),
			Problem.TestCase(expectation: ["the", "tai"], arguments: ["the", "xxtxaxixxx"]),
			Problem.TestCase(expectation: ["this", "is", "the", ""], arguments: ["this", "is", "the", "x"])
		],
		eulerMode: false
	)
]

// MARK: Functional-2

fileprivate let codingBatFunctional2Problems: [Problem] = [
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

// MARK: - Project Euler
fileprivate let eulerProblems: [Problem] = [
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
