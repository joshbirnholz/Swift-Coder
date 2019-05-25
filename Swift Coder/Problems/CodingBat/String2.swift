//
//  CodingBatString2Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatString2Problems: [Problem] = [
	Problem(
		title: "doubleChar",
		returnType: String.self,
		parameters: [
			Problem.Parameter(name: "str", type: String.self)
		],
		prompt: "Given a string, return a string where for every char in the original, there are two characters.",
		solution: """
func doubleChar(str: String) -> String {
	var result = ""
	for character in str {
		result = result + String(character) + String(character)
	}
	return result
}
""",
		hidesSolutionUntilSolved: true,
		hint: #"Declare a local String result variable, starting with the empty string "". The standard loop over every character in a string is: "`for character in str`". Inside the loop, use "`character`" to get each character, and add them to the result string with "`=`" and "`+`"."#,
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
		prompt: "Given two strings, return true if either of the strings appears at the very end of the other string, ignoring upper/lower case differences (in other words, the computation should not be \"case sensitive\"). Note: `str.lowercased()` returns the lowercase version of a string.",
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
		solution: """
func xyBalance(str: String) -> Bool {
	// Find the rightmost y
	var y = -1
	for (i, c) in str.enumerated() {
		if c == "y" {
			y = i
		}
	}
	
	// Look at the x's, return false if one is after y
	for (i, c) in str.enumerated() {
		if c == "x" && i > y {
			return false
		}
	}
	
	return true
	
	// Solution notes: this solution uses two loops, using
	// enumerated() to get quick access to the indices.
	// You could do it with a single reverse loop, noticing
	// if you see an x before a y. Or use lastIndex(of:).
}
""",
		hidesSolutionUntilSolved: true,
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
		prompt: "Given two strings, `a` and `b`, create a bigger string made of the first character of a, the first character of `b`, the second character of `a`, the second character of `b`, and so on. Any leftover characters go at the end of the result.",
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
		prompt: "Given a string and an int `n`, return a string made of `n` repetitions of the last `n` characters of the string. You may assume that `n` is between 0 and the length of the string, inclusive.",
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
		prompt: "Given a string and an int `n`, return a string made of the first n characters of the string, followed by the first `n-1` characters of the string, and so on. You may assume that n is between 0 and the length of the string, inclusive (i.e. `n` >= 0 and `n` <= str.count).",
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
		prompt: "Given two strings, `word` and a separator `sep`, return a big string made of `count` occurrences of the word, separated by the separator string.",
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
		solution: """
func sameStarChar(str: String) -> Bool {
	for (i, c) in str.enumerated().dropFirst().dropLast() {
		if c == "*" {
			let previous = str[str.index(str.startIndex, offsetBy: i-1)]
			let next = str[str.index(str.startIndex, offsetBy: i+1)]
			if previous != next {
				return false
			}
		}
	}
	
	return true
}
""",
		hidesSolutionUntilSolved: true,
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
		prompt: "Given a string and a non-empty word string, return a string made of each char just before and just after every appearance of the word in the string. Ignore cases where there is no character before or after the word, and a character may be included twice if it is between two words.",
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
