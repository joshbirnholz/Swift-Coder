//
//  ProblemSet.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 4/16/16.
//  Copyright © 2016 Josh Birnholz. All rights reserved.
//

import Foundation

public class ProblemSet: CaseIterable, Codable, Equatable, Hashable {
	
	public static func == (lhs: ProblemSet, rhs: ProblemSet) -> Bool {
		return lhs.title == rhs.title
	}
	
	public func hash(into hasher: inout Hasher) {
		title.hash(into: &hasher)
		author.hash(into: &hasher)
		version.hash(into: &hasher)
	}
	
	private init(name: String, problems: [Problem]) {
		self.title = name
		self.problems = problems
		self.author = "Josh Birnholz"
		self.version = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? "1.0"
	}
	
	var title: String
	var author: String
	var version: String?
	var problems: [Problem]
	
	private static let builtInProblemLists: KeyValuePairs<String, [Problem]> = [
		"CodingBat: Warmup-1": codingBatWarmup1Problems,
		"CodingBat: Warmup-2": codingBatWarmup2Problems,
		"CodingBat: String-1": codingBatString1Problems,
		"CodingBat: Array-1": codingBatArray1Problems,
		"CodingBat: Logic-1": codingBatLogic1Problems,
		"CodingBat: Logic-2": codingBatLogic2Problems,
		"CodingBat: String-2": codingBatString2Problems,
		"CodingBat: String-3": codingBatString3Problems,
		"CodingBat: Array-2": codingBatArray2Problems,
		"CodingBat: Array-3": codingBatArray3Problems,
		"CodingBat: AP-1": codingBatAP1Problems,
		"CodingBat: Recursion-1": codingBatRecursion1Problems,
		"CodingBat: Recursion-2": codingBatRecursion2Problems,
		"CodingBat: Dictionary-1": codingBatDictionary1Problems,
		"CodingBat: Dictionary-2": codingBatDictionary2Problems,
		"CodingBat: Functional-1": codingBatFunctional1Problems,
		"CodingBat: Functional-2": codingBatFunctional2Problems,
		"Optionals": optionalsProblems,
		"Project Euler": eulerProblems,
		"Unwrap": unwrapFreeCodingProblems
	]
	
	public static var allCases: [ProblemSet] = builtInProblemLists.map {
		ProblemSet(name: $0.key, problems: $0.value)
		} + loadAllFromProblemsDirectory()
	
	private static var decoder = PropertyListDecoder()
	
	public static func load(from fileURL: URL) throws -> ProblemSet {
		let data = try Data(contentsOf: fileURL)
		return try decoder.decode(ProblemSet.self, from: data)
	}
	
	private static func loadAllFromProblemsDirectory() -> [ProblemSet] {
		let problemsDirectory = LocalCodeController.shared.applicationSupportDirectory.appendingPathComponent("Problems", isDirectory: true)
		
		do {
			let contents = try FileManager.default.contentsOfDirectory(at: problemsDirectory, includingPropertiesForKeys: [.typeIdentifierKey]).filter {
				guard let typeIdentifier = try? $0.resourceValues(forKeys: [.typeIdentifierKey]).typeIdentifier else {
					return false
				}
				
				return typeIdentifier == "com.josh.birnholz.scproblemset"
				
			}
			
			return contents.compactMap { url in
				do {
					let problemSet = try load(from: url)
					return problemSet
				} catch {
					print("Error loading problem set from \(url)")
					return nil
				}
			}
		} catch {
			print("Error reading contents of \(problemsDirectory):\n\(error)")
			return []
		}
		
	}
	
	public typealias AllCases = [ProblemSet]
}
