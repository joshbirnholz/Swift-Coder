//
//  Colors.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 5/1/19.
//  Copyright © 2019 Josh Birnholz. All rights reserved.
//

import Cocoa

extension NSColor {
	
	static let successGreen: NSColor = {
		if #available(OSX 10.13, *) {
			if let namedColor = NSColor(named: NSColor.Name("successGreen")) {
				return namedColor
			}
		}
		
		return #colorLiteral(red: 0.09411764706, green: 0.631372549, blue: 0.1098039216, alpha: 1)
	}()
	
	static let errorRed: NSColor = {
		if #available(OSX 10.13, *) {
			if let namedColor = NSColor(named: NSColor.Name("errorRed")) {
				return namedColor
			}
		}
		
		return .red
	}()
	
	static let border: NSColor = {
		if #available(OSX 10.13, *) {
			if let namedColor = NSColor(named: NSColor.Name("borderColor")) {
				return namedColor
			}
		}
		
		return #colorLiteral(red: 0.7725490196, green: 0.7725490196, blue: 0.7725490196, alpha: 1)
	}()
	
}
