//
//  CodingBatString1Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatString1Problems: [Problem] = [
	Problem(
		title: "helloName",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "name", type: String.self)
		],
		prompt: "Given a string name, e.g. \"Bob\", return a greeting of the form \"Hello Bob!\".",
		solution: """
func helloName(name: String) -> String {
	return "Hello " + name + "!"
}

// Could also use string interpolation:
// return "Hello \\(name)!"
""",
		hidesSolutionUntilSolved: true,
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
		prompt: "Given two strings, `a` and `b`, return the result of putting them together in the order abba, e.g. \"Hi\" and \"Bye\" returns \"HiByeByeHi\".",
		solution: #"""
func makeAbba(a: String, b: String) -> String {
	return a+b+b+a;
}

// Could also use string interpolation:
// return "\(a)\(b)\(b)\(a)"
"""#,
		hidesSolutionUntilSolved: true,
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
		prompt: "The web is built with HTML strings like \"`<i>Yay</i>`\" which draws Yay as italic text. In this example, the \"i\" tag makes `<i>` and `</i>` which surround the word \"Yay\". Given tag and word strings, create the HTML string with tags around the word, e.g. \"`<i>Yay</i>`\".",
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
		prompt: "Given an \"out\" string length 4, such as \"<<>>\", and a word, return a new string where the word is in the middle of the out string, e.g. \"<<word>>\". Note: `str.prefix(2)` will give you the first two characters of a String, and `str.suffix(2)` will give you the last two characters.",
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
		prompt: "Given a string, return a new string made of 3 copies of the last 2 characters of the original string. The string length will be at least 2. Note: use `String(str.suffix(2))` to get the last two characters of a string.",
		solution: """
func extraEnd(str: String) -> String {
	let end = String(str.suffix(2))
	return end + end + end
	
	// Solution notes: Here we store the last two
	// characters in a local variable, which makes
	// the code longer but simpler.
}
""",
		hidesSolutionUntilSolved: true,
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
		prompt: "Given a string, return the string made of its first two characters, so the String \"Hello\" yields \"He\". If the string is shorter than length 2, return whatever there is, so \"X\" yields \"X\", and the empty string \"\" yields the empty string \"\". Note: use `String(str.prefix(2))` to get the first two characters of a string.",
		solution: """
func firstTwo(str: String) -> String {
	return String(str.prefix(2))
}
""",
		hidesSolutionUntilSolved: true,
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
		prompt: "Given a string, return a version without the first and last character, so \"Hello\" yields \"ell\". The string length will be at least 2.",
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
		prompt: "Given 2 strings, `a` and `b`, return a string of the form short+long+short, with the shorter string on the outside and the longer string on the inside. The strings will not be the same length, but they may be empty (length 0).",
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
		prompt: "Given 2 strings, return their concatenation, except omit the first character of each. The strings will be at least length 1.",
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
		prompt: "Given a string, return a \"rotated left 2\" version where the first 2 characters are moved to the end. The string length will be at least 2. Note: Use `String(str.dropFirst(2))` to get all but the first two characters of a string.",
		solution: """
func left2(str: String) -> String {
	let start = String(str.prefix(2))
	let rest = (str.dropFirst(2))
	return rest + start
}
""",
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
		prompt: "Given a string, return a \"rotated right 2\" version where the last 2 characters are moved to the start. The string length will be at least 2. Note: use `String(str.dropLast(2))` to get the last two characters of a string.",
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
		solution: """
func withouEnd2(str: String) -> String {
	return String(str.dropFirst().dropLast())
}
""",
		hidesSolutionUntilSolved: true,
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
		prompt: "Given a string and an int `n`, return a string made of the first and last `n` characters from the string. The string length will be at least `n`.",
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
		prompt: "Given a string, return a string length 2 made of its first 2 characters. If the string length is less than 2, use \"@\" for the missing characters.",
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
		prompt: "Given 2 strings, `a` and `b`, return a new string made of the first character of a and the last character of b, so \"yo\" and \"swift\" yields \"yt\". If either string is length 0, use \"@\" for its missing character.",
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
		solution: """
func frontAgain(str: String) -> Bool {
	return str.count >= 2 && str.prefix(2) == str.suffix(2)
}
""",
		hidesSolutionUntilSolved: true,
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
		prompt: "Given a string and a second \"`word`\" string, we'll say that the word matches the string if it appears at the front of the string, except its first character does not need to match exactly. On a match, return the front of the string, or otherwise return the empty string. So, so with the string \"hippo\" the word \"hi\" returns \"hi\" and \"xip\" returns \"hip\". The word will be at least length 1.",
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
		solution: """
func withoutX(str: String) -> String {
	var result = str
	
	if str.hasPrefix("x") {
		result = String(result.dropFirst())
	}
	
	if str.hasSuffix("x") {
		result = String(result.dropLast())
	}
	
	return result
}
""",
		hidesSolutionUntilSolved: true,
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
