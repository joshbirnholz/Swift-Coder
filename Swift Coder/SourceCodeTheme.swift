//
//  SourceCodeTheme.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 8/15/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation
import SavannaKit
import SourceEditor

public struct SourceCodeThemes {
	static let `default`: SourceCodeTheme = DefaultSourceCodeTheme()
	static let codingBat: SourceCodeTheme = SwiftCoderTheme()
	static let swiftBook: SourceCodeTheme = SwiftBookColorTheme()
}

private struct SwiftCoderTheme: SourceCodeTheme {
	
	public init() {
		
	}
	
	private static var lineNumbersColor: Color {
		return Color(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
	}
	
	public let lineNumbersStyle: LineNumbersStyle? = LineNumbersStyle(font: Font(name: "SF Mono Medium", size: 12)!, textColor: lineNumbersColor)
	
	public let gutterStyle: GutterStyle = GutterStyle(backgroundColor: NSColor.controlColor, minimumWidth: 32)
	
	public let font = Font(name: "Monaco", size: 12)!
	
	public let backgroundColor = Color.white
	
	public func color(for syntaxColorType: SourceCodeTokenType) -> Color {
		
		switch syntaxColorType {
		case .plain:
			return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
			
		case .number:
			return #colorLiteral(red: 0, green: 0.09019607843, blue: 0.7725490196, alpha: 1)
			
		case .string:
			return #colorLiteral(red: 0.09411764706, green: 0.1333333333, blue: 0.6235294118, alpha: 1)
			
		case .identifier:
			return #colorLiteral(red: 0.2470588235, green: 0.2980392157, blue: 0.4352941176, alpha: 1)
			
		case .keyword:
			return #colorLiteral(red: 0.5333333333, green: 0.1411764706, blue: 0.4862745098, alpha: 1)
			
		case .comment:
			return #colorLiteral(red: 0.2196078431, green: 0.4235294118, blue: 0.1803921569, alpha: 1)
			
		case .editorPlaceholder:
			return backgroundColor
		}
		
	}
	
	public func globalAttributes() -> [NSAttributedString.Key: Any] {
		
		var attributes = [NSAttributedString.Key: Any]()
		
		attributes[.font] = font
		attributes[.foregroundColor] = Color.black
		
		return attributes
	}
	
}

private struct SwiftBookColorTheme: SourceCodeTheme {
	
	public init() {
		
	}
	
	private static let lineNumbersColor: Color = {
		if #available(OSX 10.13, *) {
			return NSColor(named: NSColor.Name("lineNumbersColor"))!
		} else {
			return Color(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
		}
	}()
	
	public let lineNumbersStyle: LineNumbersStyle? = LineNumbersStyle(font: Font(name: "SF Mono Medium", size: 13)!, textColor: lineNumbersColor)
	
	private static let gutterColor: Color = {
		if #available(OSX 10.13, *) {
			return NSColor(named: NSColor.Name("gutterColor"))!
		} else {
			return .controlColor
		}
	}()
	
	public let gutterStyle: GutterStyle = GutterStyle(backgroundColor: SwiftBookColorTheme.gutterColor, minimumWidth: 32)
	
	public let font = Font(name: "Menlo", size: 13)!
	
	public let backgroundColor: Color = {
		if #available(OSX 10.13, *) {
			return NSColor(named: NSColor.Name("backgroundColor"))!
		} else {
			return .white
		}
	}()
	
	public func color(for syntaxColorType: SourceCodeTokenType) -> Color {
		
		switch syntaxColorType {
		case .plain:
			if #available(OSX 10.13, *) {
				return NSColor(named: NSColor.Name("plainColor"))!
			} else {
				return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
			}
		case .number:
			if #available(OSX 10.13, *) {
				return NSColor(named: NSColor.Name("numberColor"))!
			} else {
				return #colorLiteral(red: 0.08235294118, green: 0.09411764706, blue: 0.7803921569, alpha: 1)
			}
		case .string:
			if #available(OSX 10.13, *) {
				return NSColor(named: NSColor.Name("stringColor"))!
			} else {
				return #colorLiteral(red: 0.7098039216, green: 0.1843137255, blue: 0.1411764706, alpha: 1)
			}
		case .identifier:
			if #available(OSX 10.13, *) {
				return NSColor(named: NSColor.Name("identifierColor"))!
			} else {
				return #colorLiteral(red: 0.2862745098, green: 0.4274509804, blue: 0.4509803922, alpha: 1)
			}
		case .keyword:
			if #available(OSX 10.13, *) {
				return NSColor(named: NSColor.Name("keywordColor"))!
			} else {
				return #colorLiteral(red: 0.6156862745, green: 0.1568627451, blue: 0.5529411765, alpha: 1)
			}
		case .comment:
			if #available(OSX 10.13, *) {
				return NSColor(named: NSColor.Name("commentColor"))!
			} else {
				return #colorLiteral(red: 0.1882352941, green: 0.4431372549, blue: 0.1176470588, alpha: 1)
			}
		case .editorPlaceholder:
			return backgroundColor
		}
		
	}
	
	public func globalAttributes() -> [NSAttributedString.Key: Any] {
		
		var attributes = [NSAttributedString.Key: Any]()
		
		attributes[.font] = font
		
		if #available(OSX 10.13, *) {
			attributes[.foregroundColor] = NSColor(named: NSColor.Name("foregroundColor"))!
		} else {
			attributes[.foregroundColor] = Color.black
		}
		
		return attributes
	}
	
}
