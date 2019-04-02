//
//  AppDelegate.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 4/16/16.
//  Copyright © 2016 Josh Birnholz. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	
	func applicationDidFinishLaunching(_ notification: Notification) {
		
		if #available(OSX 10.12.2, *) {
			NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
		}
		
		var allProblemTypes: [String: String] = [:]
		let allProblems = ProblemSet.allCases.map { $0.problems }.joined()
		
		for problem in allProblems {
			allProblemTypes[problem.actualReturnType.convertibleTypeName] = String(describing: problem.actualReturnType) + ".self"
			for parameter in problem.parameters {
				allProblemTypes[parameter.actualType.convertibleTypeName] = String(describing: parameter.actualType) + ".self"
			}
		}
		
		print(allProblemTypes)

		
	}
	
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}
	
}
