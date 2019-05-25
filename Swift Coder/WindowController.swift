//
//  WindowController.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 5/1/19.
//  Copyright © 2019 Josh Birnholz. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
	
	@IBOutlet weak var titleLabel: NSTextField!
	@IBOutlet weak var userToolbarMenu: NSPopUpButton!
	@IBOutlet weak var assistantSegmentedControl: NSSegmentedControl!
	
	override func windowDidLoad() {
        super.windowDidLoad()
		
		assistantSegmentedControl.isHidden = LocalCodeController.shared.isSandboxed
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }	
	
	@IBAction func assistantSegmentedControl(_ sender: NSSegmentedControl) {
		guard let viewController = contentViewController as? SwiftCoderViewController else {
			return
		}
		
		viewController.assistantSegmentedControlValueChanged(sender)
	}
	//	@IBAction func quickHelpButtonPressed(_ sender: Any) {
//		guard let viewController = contentViewController as? SwiftCoderViewController else {
//			return
//		}
//		
//		viewController.isQuickHelpVisible.toggle()
//	}
}
