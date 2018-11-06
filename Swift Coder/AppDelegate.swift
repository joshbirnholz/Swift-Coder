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
	
	func applicationDidFinishLaunching(aNotification: NSNotification) {
		// Insert code here to initialize your application
		
		if #available(OSX 10.12.2, *) {
			NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
		}
		
	}
	
	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}
	
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}
	
}
