//
//  CodingBatDictionary2Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatDictionary2Problems: [Problem] = [
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
