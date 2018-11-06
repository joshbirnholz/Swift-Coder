//
//  TextFieldStepperContainerStackView.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 8/24/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import AppKit

fileprivate class OnlyIntegerValueFormatter: NumberFormatter {
	
	override func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
		
		// Ability to reset your field (otherwise you can't delete the content)
		// You can check if the field is empty later
		if partialString.isEmpty {
			return true
		}
		
		// Optional: limit input length
		/*
		if partialString.characters.count>3 {
		return false
		}
		*/
		
		if partialString == "-" {
			return true
		}
		
		// Actual check
		return Int(partialString) != nil
	}
}

class TextFieldStepperView: NSStackView, NSTextFieldDelegate {
	private let numberTextField = NSTextField(string: "0")
	private let stepper = NSStepper(frame: NSRect(x: 0, y: 0, width: 250, height: 24))
	
	private static let formatter = OnlyIntegerValueFormatter()
	
	@objc dynamic var value: Int = 0
	
	private func setupContainedItems(name: String?, defaultValue: Int? = nil) {
		numberTextField.delegate = self
		numberTextField.formatter = TextFieldStepperView.formatter
		stepper.minValue = Double(Int32.min)
		stepper.maxValue = Double(Int32.max)
		if let defaultValue = defaultValue {
			value = defaultValue
		}
		if let name = name {
			addArrangedSubview(NSTextField(labelWithString: name))
		}
		
		stepper.bind(.value, to: self, withKeyPath: "value", options: nil)
		numberTextField.bind(.value, to: self, withKeyPath: "value", options: nil)
		
		addArrangedSubview(numberTextField)
		addArrangedSubview(stepper)
	}
	
	init(frame: NSRect, name: String?, defaultValue: Int? = nil) {
		super.init(frame: frame)
		setupContainedItems(name: name, defaultValue: defaultValue)
	}
	
	required init?(coder decoder: NSCoder) {
		super.init(coder: decoder)
		setupContainedItems(name: nil, defaultValue: nil)
	}
	
}
