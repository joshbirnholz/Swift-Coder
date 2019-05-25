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
		
	}
	
	func applicationWillTerminate(_ notification: Notification) {
		LocalCodeController.shared.cleanupTemporaryFiles()
	}
	
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}
	
	func application(_ sender: NSApplication, openFiles filenames: [String]) {
		print(#function)
		let urls = filenames.map{ URL(fileURLWithPath: $0) }
		
		let fm = FileManager.default
		let problemsDirectory = LocalCodeController.shared.applicationSupportDirectory.appendingPathComponent("Problems", isDirectory: true)
		
		var loadedProblemSets: [ProblemSet] = []
		
		for url in urls {
			do {
				let problemSet = try ProblemSet.load(from: url)
				
				guard !problemSet.problems.isEmpty else { continue }
				
				let destinationURL = problemsDirectory.appendingPathComponent(url.lastPathComponent)
				
				try fm.copyItem(at: url, to: destinationURL)
				loadedProblemSets.append(problemSet)
			} catch {
				let alert = NSAlert(error: error)
				
				if let decodingError = error as? DecodingError {
					alert.informativeText += "\(decodingError)"
				}
				
				alert.runModal()
			}
		}
		
		ProblemSet.allCases.append(contentsOf: loadedProblemSets)
		
		if let problemSet = loadedProblemSets.first,
			let vc = NSApplication.shared.mainWindow?.contentViewController as? SwiftCoderViewController {
			vc.problemIndexPath = ProblemIndexPath(list: problemSet, index: 0)
			vc.configureProblemMenu()
		}
	}
	
}
