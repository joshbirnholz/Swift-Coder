//
//  CodingBatLogic1Problems.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/20/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

let codingBatLogic1Problems: [Problem] = [
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
