//
//  RoundedBackgroundLayoutManager.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 5/8/19.
//  Copyright © 2019 Josh Birnholz. All rights reserved.
//

import Cocoa

// https://stackoverflow.com/questions/21857408/how-to-set-nsstrings-background-cornerradius-on-ios7

class RoundedBackgroundLayoutManager: NSLayoutManager {

	override func fillBackgroundRectArray(_ rectArray: UnsafePointer<CGRect>, count rectCount: Int, forCharacterRange charRange: NSRange, color: NSColor) {
		
		let cornerRadius:CGFloat = 5
		let path = CGMutablePath.init()
		
		if rectCount == 1 || (rectCount == 2 && (rectArray[1].maxX < rectArray[0].maxX)) {
			
			path.addRect(rectArray[0].insetBy(dx: cornerRadius, dy: cornerRadius))
			
			if rectCount == 2 {
				path.addRect(rectArray[1].insetBy(dx: cornerRadius, dy: cornerRadius))
			}
			
		} else {
			
			let lastRect = rectCount - 1
			
			path.move(to: CGPoint(x: rectArray[0].minX + cornerRadius, y: rectArray[0].maxY + cornerRadius))
			
			path.addLine(to: CGPoint(x: rectArray[0].minX + cornerRadius, y: rectArray[0].minY + cornerRadius))
			path.addLine(to: CGPoint(x: rectArray[0].maxX - cornerRadius, y: rectArray[0].minY + cornerRadius))
			
			path.addLine(to: CGPoint(x: rectArray[0].maxX - cornerRadius, y: rectArray[lastRect].minY - cornerRadius))
			path.addLine(to: CGPoint(x: rectArray[lastRect].maxX - cornerRadius, y: rectArray[lastRect].minY - cornerRadius))
			
			path.addLine(to: CGPoint(x: rectArray[lastRect].maxX - cornerRadius, y: rectArray[lastRect].maxY - cornerRadius))
			path.addLine(to: CGPoint(x: rectArray[lastRect].minX + cornerRadius, y: rectArray[lastRect].maxY - cornerRadius))
			
			path.addLine(to: CGPoint(x: rectArray[lastRect].minX + cornerRadius, y: rectArray[0].maxY + cornerRadius))
			
			path.closeSubpath()
			
		}
		
		color.set()
		
		let ctx = NSGraphicsContext.current!.cgContext
		ctx.setLineWidth(cornerRadius * 2.0)
		ctx.setLineJoin(.round)
		
		ctx.setAllowsAntialiasing(true)
		ctx.setShouldAntialias(true)
		
		ctx.addPath(path)
		ctx.drawPath(using: .fillStroke)
	}
	
}
