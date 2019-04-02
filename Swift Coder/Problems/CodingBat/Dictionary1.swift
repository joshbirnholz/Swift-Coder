//
//  CodingBatDictionary1Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatDictionary1Problems: [Problem] = [
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
