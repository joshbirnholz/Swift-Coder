//
//  SyntaxTextView+TextViewDelegate.swift
//  SavannaKit
//
//  Created by Louis D'hauwe on 17/02/2018.
//  Copyright © 2018 Silver Fox. All rights reserved.
//

import Foundation

#if os(macOS)
	import AppKit
#else
	import UIKit
#endif

extension SyntaxTextView: InnerTextViewDelegate {
	
	func didUpdateCursorFloatingState() {
		
		selectionDidChange()
		
	}
	
}

extension SyntaxTextView {

	func isEditorPlaceholderSelected(selectedRange: NSRange, tokenRange: NSRange) -> Bool {
		
		var intersectionRange = tokenRange
		intersectionRange.location += 1
		intersectionRange.length -= 1
		
		return selectedRange.intersection(intersectionRange) != nil
	}
	
	func updateSelectedRange(_ range: NSRange) {
		textView.selectedRange = range
		
		#if os(macOS)		
		self.textView.scrollRangeToVisible(range)
		#endif
		
		self.delegate?.didChangeSelectedRange(self, selectedRange: range)
	}
	
	func selectionDidChange() {
		
		guard let delegate = delegate else {
			return
		}
		
		if let cachedTokens = cachedTokens {
			
			#if os(iOS)
				if !textView.isCursorFloating {
					updateEditorPlaceholders(cachedTokens: cachedTokens)
				}
			#else
				updateEditorPlaceholders(cachedTokens: cachedTokens)
			#endif
			
		}
		
		colorTextView(lexerForSource: { (source) -> Lexer in
			return delegate.lexerForSource(source)
		})
		
		previousSelectedRange = textView.selectedRange
		
	}
	
	func updateEditorPlaceholders(cachedTokens: [CachedToken]) {
		
		for cachedToken in cachedTokens {
			
			let range = cachedToken.nsRange
			
			if cachedToken.token.isEditorPlaceholder {
				
				var forceInsideEditorPlaceholder = true
				
				let currentSelectedRange = textView.selectedRange
				
				if let previousSelectedRange = previousSelectedRange {
					
					if isEditorPlaceholderSelected(selectedRange: currentSelectedRange, tokenRange: range) {
						
						// Going right.
						if previousSelectedRange.location + 1 == currentSelectedRange.location {
							
							if isEditorPlaceholderSelected(selectedRange: previousSelectedRange, tokenRange: range) {
								updateSelectedRange(NSRange(location: range.location+range.length, length: 0))
							} else {
								updateSelectedRange(NSRange(location: range.location + 1, length: 0))
							}
							
							forceInsideEditorPlaceholder = false
							break
						}
						
						// Going left.
						if previousSelectedRange.location - 1 == currentSelectedRange.location {
							
							if isEditorPlaceholderSelected(selectedRange: previousSelectedRange, tokenRange: range) {
								updateSelectedRange(NSRange(location: range.location, length: 0))
							} else {
								updateSelectedRange(NSRange(location: range.location + 1, length: 0))
							}
							
							forceInsideEditorPlaceholder = false
							break
						}
						
					}
					
				}
				
				if forceInsideEditorPlaceholder {
					if isEditorPlaceholderSelected(selectedRange: currentSelectedRange, tokenRange: range) {
						
						if currentSelectedRange.location <= range.location || currentSelectedRange.upperBound >= range.upperBound {
							// Editor placeholder is part of larger selected text,
							// so don't change selection.
							break
						}
						
						updateSelectedRange(NSRange(location: range.location+1, length: 0))
						break
					}
				}
				
			}
			
		}
		
	}
	
}

#if os(macOS)

	extension SyntaxTextView: NSTextViewDelegate {
		
		open func textView(_ textView: NSTextView, shouldChangeTextIn affectedCharRange: NSRange, replacementString: String?) -> Bool {
			
			let text = replacementString ?? ""
			
			return self.shouldChangeText(insertingText: text)
		}
		
		open func textDidChange(_ notification: Notification) {
			guard let textView = notification.object as? NSTextView, textView == self.textView else {
				return
			}
			
			didUpdateText()
			
		}
		
		func didUpdateText() {
		
			self.invalidateCachedTokens()
			self.textView.invalidateCachedParagraphs()
			
			if let delegate = delegate {
				colorTextView(lexerForSource: { (source) -> Lexer in
					return delegate.lexerForSource(source)
				})
			}
			
			wrapperView.setNeedsDisplay(wrapperView.bounds)
			self.delegate?.didChangeText(self)
			
		}
		
		open func textViewDidChangeSelection(_ notification: Notification) {
			
			contentDidChangeSelection()
			
			self.delegate?.didChangeSelectedRange(self, selectedRange: self.textView.selectedRange())

		}
		
		public func textView(_ textView: NSTextView, willDisplayToolTip tooltip: String, forCharacterAt characterIndex: Int) -> String? {
			return self.delegate?.toolTip(forCharacterAt: characterIndex, source: textView.string, in: self)
		}
		
		
	}
	
#endif

#if os(iOS)
	
	extension SyntaxTextView: UITextViewDelegate {
		
		open func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
			
			return self.shouldChangeText(insertingText: text)
		}
		
		public func textViewDidBeginEditing(_ textView: UITextView) {
			// pass the message up to our own delegate
			delegate?.textViewDidBeginEditing(self)
		}
		
		open func textViewDidChange(_ textView: UITextView) {
			
			didUpdateText()
			
		}
		
		func didUpdateText() {
			
			self.invalidateCachedTokens()
			self.textView.invalidateCachedParagraphs()
			textView.setNeedsDisplay()
			
			if let delegate = delegate {
				colorTextView(lexerForSource: { (source) -> Lexer in
					return delegate.lexerForSource(source)
				})
				
				delegate.didChangeText(self)

			}
			
		}
	
		open func textViewDidChangeSelection(_ textView: UITextView) {
			
			contentDidChangeSelection()
		}
		
	}
	
#endif

extension SyntaxTextView {

	func shouldChangeText(insertingText: String) -> Bool {

		let selectedRange = textView.selectedRange

		let origInsertingText = insertingText

		var insertingText = insertingText
		var insertingSuffix = ""
		
		if insertingText == "\n" {
			
			let nsText = textView.text as NSString
			
			var currentLine = nsText.substring(with: nsText.lineRange(for: textView.selectedRange))
			
			if currentLine.hasSuffix("\n") {
				currentLine.removeLast()
			}
			
			var newLinePrefix = ""
			
			for char in currentLine {
				if char.isWhitespace {
					newLinePrefix += "\(char)"
				} else {
					break
				}
			}
			
			let (opens, closes) = textView.text.reduce((0, 0)) { previous, current in
				if current == "{" {
					return (previous.0 + 1, previous.1)
				} else if current == "}" {
					return (previous.0, previous.1 + 1)
				} else {
					return previous
				}
			}
			
			if opens != closes && currentLine.trimmingCharacters(in: .whitespacesAndNewlines).hasSuffix("{") {
				insertingSuffix = "\n" + newLinePrefix + "}"
			}
			
			if currentLine.trimmingCharacters(in: .whitespacesAndNewlines).hasSuffix("{") {
				newLinePrefix += "\t"
			}
			
			insertingText += newLinePrefix
		}
		
		let textStorage: NSTextStorage
		
		#if os(macOS)
		
		guard let _textStorage = textView.textStorage else {
			return true
		}
		
		textStorage = _textStorage
		
		#else
		
		textStorage = textView.textStorage
		#endif
		
		guard let cachedTokens = cachedTokens else {
			return true
		}
			
		for token in cachedTokens {
			
			let range = token.nsRange
			
			if token.token.isEditorPlaceholder {
				
				// Allow editorPlaceholder to be completely deleted.
				if insertingText == "", selectedRange.lowerBound == range.upperBound {
					textStorage.replaceCharacters(in: range, with: insertingText)
					
					didUpdateText()
					
					updateSelectedRange(NSRange(location: range.lowerBound, length: 0))

					return false
				}

				if isEditorPlaceholderSelected(selectedRange: selectedRange, tokenRange: range) {
					
					if insertingText == "\t" {
						
						let placeholderTokens = cachedTokens.filter({
							$0.token.isEditorPlaceholder
						})
						
						guard placeholderTokens.count > 1 else {
							return false
						}
						
						let nextPlaceholderToken = placeholderTokens.first(where: {
							
							let nsRange = $0.nsRange
							
							return nsRange.lowerBound > range.lowerBound
							
						})
						
						if let tokenToSelect = nextPlaceholderToken ?? placeholderTokens.first {
							
							updateSelectedRange(NSRange(location: tokenToSelect.nsRange.lowerBound + 1, length: 0))
							
							return false
							
						}
						
						return false
					}
					
					if selectedRange.location <= range.location || selectedRange.upperBound >= range.upperBound {
						// Editor placeholder is part of larger selected text,
						// so allow system inserting.
						return true
					}
					
//					(textView.undoManager?.prepare(withInvocationTarget: self) as? TextView).replace
					
					textStorage.replaceCharacters(in: range, with: insertingText)
					
					didUpdateText()
					
					updateSelectedRange(NSRange(location: range.lowerBound + insertingText.count, length: 0))

					return false
				}
				
			}
			
		}
		
		if origInsertingText == "\n" {

			textStorage.replaceCharacters(in: selectedRange, with: insertingText)
//			textStorage.replaceCharacters(in: NSRange(location: selectedRange.upperBound + insertingText.count, length: 0), with: insertingSuffix)

			insertText(insertingSuffix)
			
			didUpdateText()
			
			updateSelectedRange(NSRange(location: selectedRange.lowerBound + insertingText.count, length: 0))

			return false
		}
		
		return true
	}
	
	func contentDidChangeSelection() {
		
		if ignoreSelectionChange {
			return
		}
		
		ignoreSelectionChange = true
		
		selectionDidChange()
		
		ignoreSelectionChange = false
		
	}
	
}
