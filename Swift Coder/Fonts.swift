//
//  Fonts.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 5/3/19.
//  Copyright © 2019 Josh Birnholz. All rights reserved.
//

import Cocoa

extension NSFont {
	static func codingFont(ofSize size: CGFloat) -> NSFont! {
		return NSFont(name: "Menlo", size: size) ?? NSFont.userFixedPitchFont(ofSize: size)
	}
}
