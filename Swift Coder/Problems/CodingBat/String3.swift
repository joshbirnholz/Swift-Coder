//
//  CodingBatString3Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatString3Problems: [Problem] = [
	Problem(
		title: "countYZ",
		returnType: Int.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, count the number of words ending in 'y' or 'z' -- so the 'y' in \"heavy\" and the 'z' in \"fez\" count, but not the 'y' in \"yellow\" (not case sensitive). We'll say that a y or z is at the end of a word if there is not an alphabetic letter immediately following it. (Note: `CharacterSet.letters.contains(character)` tests if a character is an alphabetic letter.)",
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
		prompt: "Given two strings, `base` and `remove`, return a version of the base string where all instances of the remove string have been removed (not case sensitive). You may assume that the remove string is length 1 or more. Remove only non-overlapping instances, so with \"xxx\" removing \"xx\" leaves \"x\".",
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
		prompt: "Given a string, return the sum of the digits 0-9 that appear in the string, ignoring all other characters. Return 0 if there are no digits in the string. (Note: `Int(str)` converts a string to an int.)",
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
		prompt: "Given a string, return the longest substring that appears at both the beginning and end of the string without overlapping. For example, `sameEnds2(string: \"abXab\")` is \"ab\".",
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
		prompt: "Given a string, return the sum of the numbers appearing in the string, ignoring all other characters. A number is a series of 1 or more digit characters in a row. (Note: `Int(string)` converts a string to an int.)",
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
