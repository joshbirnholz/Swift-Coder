//
//  CodeController.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 4/23/19.
//  Copyright © 2019 Josh Birnholz. All rights reserved.
//

import Foundation

protocol CodeController {
	func saveCode(_ code: String, for problem: Problem) throws
	func loadCode(for problem: Problem) -> String
	func saveAndTest(_ code: String, for problem: Problem, completion: @escaping (CompilationResult) -> ()) throws
	func setActiveUsername(_ username: String?)
	func getActiveUserName() -> String?
	func swiftVersionString() -> String?
	func getUsernames() -> [String]
	func deleteUser(_ username: String)
	func validateUsername(_ username: String) -> Bool
	func setShouldIncludeStringSubscriptAPI(_ shouldInclude: Bool)
	func shouldIncludeStringSubscriptAPI() -> Bool
	func user(_ username: String?, hasSolved problem: Problem) -> Bool
	func user(_ username: String?, didSolve problem: Problem)
	func deleteUserRecords(forUser username: String?, problem: Problem) throws
}
