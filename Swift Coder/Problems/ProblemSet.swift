//
//  ProblemSet.swift
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
	case optionals = "Optionals"
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
		case .projectEuler:
			return eulerProblems
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
		case .optionals:
			return optionalsProblems
		
		}
	}
}
