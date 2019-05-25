//
//  NCRAutocompleteTextView.swift
//  Example
//
//  Created by Josh Birnholz on 5/8/19.
//  Copyright © 2019 Null Creature. All rights reserved.
//

import Cocoa

// MARK: -

public protocol NCRAutocompleteTextViewDelegate: class {
	func textView(_ textView: NCRAutocompleteTextView, completionsFor word: Substring, forPartialWordRange charRange: NSRange) -> (candidates: [NCRAutocompletionCandidate], indexOfSelectedItem: Int)
	func textView(_ textView: NCRAutocompleteTextView, shouldShowImagesFor candidates: [NCRAutocompletionCandidate]) -> Bool
}

extension NCRAutocompleteTextViewDelegate {
	func textView(_ textView: NCRAutocompleteTextView, shouldShowImagesFor autocompletionCandidates: [NCRAutocompletionCandidate]) -> Bool {
		return false
	}
}

// MARK: -

private class NCRAutocompleteTableRowView: NSTableRowView {
	
	fileprivate var highlightColor: NSColor = {
		if #available(OSX 10.14, *) {
			return NSColor.controlAccentColor
		} else {
			return NSColor.selectedMenuItemColor
		}
	}()
	
	override func drawSelection(in dirtyRect: NSRect) {
		guard selectionHighlightStyle != .none else { return }
		
		let selectionRect = NSInsetRect(self.bounds, 0.5, 0.5)
		highlightColor.setStroke()
		highlightColor.setFill()
		let selectionPath = NSBezierPath(roundedRect: selectionRect, xRadius: 0, yRadius: 0)
		selectionPath.fill()
		selectionPath.stroke()
	}
	
	override var interiorBackgroundStyle: NSView.BackgroundStyle {
		return isSelected ? .emphasized : .normal
	}
}

public protocol NCRAutocompletionCandidate {
	var autocompletionDisplayString: String { get }
	var autocompletionInsertionString: String { get }
	var autocomplationDescriptionString: String? { get }
	var autocompletionSecondaryDescriptionString: String? { get }
	var autocompletionImage: NSImage? { get }
}

extension NCRAutocompletionCandidate {
	public var autocompletionDisplayString: String {
		return autocompletionInsertionString
	}
	
	public var autocomplationDescriptionString: String? {
		return nil
	}
	
	public var autocompletionImage: NSImage? {
		return nil
	}
	
	public var autocompletionSecondaryDescriptionString: String? {
		return nil
	}
}

extension String: NCRAutocompletionCandidate {
	public var autocompletionInsertionString: String {
		return self
	}
}

// MARK: -

open class NCRAutocompleteTextView: NSTextView, NSTableViewDelegate, NSTableViewDataSource {

	// MARK: Public properties
	
	public enum AutocompletionInsertionMode {
		/// Text suggestions are completed.
		case complete
		/// Text suggestions are fully inserted over the selected range.
		case insert
	}
	
	/// The autocompletion mode. The default value is `AutocompletionInsertionMode.complete`.
	open var autocompletionInsertionMode: AutocompletionInsertionMode = .complete
	
//	open var showsAutoCompletionImages: Bool = false
	
	open var autocompletesWhileTyping = true
	
	open var deleteClosesAutocompletionPopover = true
	
	/// The maximum number of results to display before the list scrolls. The default value is 8.
	open var autocompletionMaximumResultCount = 8
	
	/// The color used to highlight selected autocompletion suggestions in the list.
	open var autocompletionHighlightColor: NSColor = {
		if #available(OSX 10.14, *) {
			return NSColor.controlAccentColor
		} else {
			return NSColor.selectedMenuItemColor
		}
	}()
	
	/// A character set representing valid characters to continue completing a given word. The default value is `CharacterSet.alphanumerics.inverted`.
	open var autocompletionWordBoundaryCharacterSet = CharacterSet.alphanumerics.inverted
	
	/// The minimum width for the autocompletion popover.
	open var autocompletionPopoverMinimumWidth: CGFloat = 200.0
	
	/// The width for the autocompletion popover.
	open var autocompletionPopoverMaximumWidth: CGFloat = 700.0
	
	/// The maximum number of characters displayed for a candidate's secondary description.
	open var autocompletionSecondaryDescriptionMaximumLength: Int = 25
	
	/// The attributes to be applied to the text in the autocompletion popover.
	open var autocompletionAttributes: [NSAttributedString.Key: Any] = [
		.font: NSFont.systemFont(ofSize: 13),
		.foregroundColor: NSColor.labelColor
	]
	
	/// The further attributes to be applied to highlighted text in the autocompletion popver.
	open var autocompletionHighlightedAttributes: [NSAttributedString.Key: Any] = [
		.backgroundColor: NSColor(white: 1, alpha: 0.225),
		.underlineStyle: NSUnderlineStyle.single.rawValue
	]
	
	open weak var autocompletionDelegate: NCRAutocompleteTextViewDelegate?
	
	open var autocompletionPopoverIsShown: Bool {
		return autocompletePopover.isShown
	}
	
	// MARK: Private properties
	
	private var autocompletePopover: NSPopover!
	private var autocompleteTableView: NSTableView!
	private var descriptionLabel: NSTextField!
	
	private var showsAutoCompletionImages: Bool = false
	
	private var candidates: [NCRAutocompletionCandidate] = [] {
		didSet {
			maxSecondaryDescriptionLength = min(autocompletionSecondaryDescriptionMaximumLength, candidates.reduce(0) { previous, current in
				max(previous, current.autocompletionSecondaryDescriptionString?.count ?? 0)
			})
			
			showsAutoCompletionImages = autocompletionDelegate?.textView(self, shouldShowImagesFor: candidates) ?? false
			
			func displayString(for candidate: NCRAutocompletionCandidate) -> String {
				var displayString = candidate.autocompletionDisplayString
				
				var space = showsAutoCompletionImages ? " " : ""
				
				if var secondaryDescription = candidate.autocompletionSecondaryDescriptionString {
					if secondaryDescription.count > maxSecondaryDescriptionLength {
						let firstHalf = secondaryDescription[secondaryDescription.startIndex ..< secondaryDescription.index(secondaryDescription.startIndex, offsetBy: maxSecondaryDescriptionLength/2)]
						let secondHalf = secondaryDescription[secondaryDescription.index(secondaryDescription.endIndex, offsetBy: maxSecondaryDescriptionLength / -2)...]
						secondaryDescription = "\(firstHalf)…\(secondHalf)"
					}
					
					space += Array(repeating: " ", count: max(0, maxSecondaryDescriptionLength-secondaryDescription.count)).joined()
					displayString = space + secondaryDescription + " " + displayString
				} else if maxSecondaryDescriptionLength > 0 {
					space += Array(repeating: " ", count: max(0, maxSecondaryDescriptionLength+1)).joined()
					displayString = space + displayString
				}
				
				return displayString
			}
			
			candidateDisplayStrings = candidates.map { displayString(for: $0) }
		}
	}
	
	// Used to highlight typed characters and insert text
	private var substring: Substring!
	// Used to keep track of when the insert cursor has moved so we
	// can close the popover. See didChangeSelection(_:)
	private var lastPos: Int = -1
	
	private var maxSecondaryDescriptionLength = 0
	
	private var candidateDisplayStrings: [String] = []
	
	public override init(frame frameRect: NSRect, textContainer container: NSTextContainer?) {
		super.init(frame: frameRect, textContainer: container)
		initialize()
	}
	
	required public init?(coder: NSCoder) {
		super.init(coder: coder)
		initialize()
	}
	
	fileprivate func initialize() {
		// Make a table view with 1 column and enclosing scroll view. It doesn't
		// matter what the frames are here because they are set when the popover
		// is displayed
		let column1 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "text"))
		column1.isEditable = false
		column1.width = autocompletionPopoverMinimumWidth - 1 * 0
		
		let tableView = NSTableView(frame: .zero)
		tableView.selectionHighlightStyle = .regular
		tableView.backgroundColor = .clear
		tableView.rowSizeStyle = .small
		tableView.intercellSpacing = NSSize(width: 20.0, height: 3.0)
		tableView.headerView = nil
		tableView.refusesFirstResponder = true
		tableView.target = self
		tableView.doubleAction = #selector(insert(_:))
		tableView.addTableColumn(column1)
		tableView.delegate = self
		tableView.dataSource = self
		self.autocompleteTableView = tableView
		
		let tableScrollView = NSScrollView(frame: .zero)
		tableScrollView.drawsBackground = false
		tableScrollView.documentView = tableView
		tableScrollView.hasVerticalScroller = true
		tableScrollView.horizontalScrollElasticity = .none
		
		let contentView = NSView(frame: .zero)
		contentView.addSubview(tableScrollView)
		
		let contentViewController = NSViewController()
		contentViewController.view = contentView
		
		self.autocompletePopover = NSPopover()
		self.autocompletePopover.animates = false
		self.autocompletePopover.contentViewController = contentViewController
		self.autocompletePopover.behavior = .transient
		self.autocompletePopover.appearance = effectiveAppearance
		
		self.descriptionLabel = NSTextField(frame: .zero)
		self.descriptionLabel.isEditable = false
		self.descriptionLabel.isSelectable = false
		self.descriptionLabel.drawsBackground = false
		self.descriptionLabel.backgroundColor = .clear
		self.descriptionLabel.isBordered = false
		self.descriptionLabel.cell?.truncatesLastVisibleLine = true
		self.descriptionLabel.font = NSFont.systemFont(ofSize: 13)
		contentView.addSubview(self.descriptionLabel)
		
		NotificationCenter.default.addObserver(self, selector: #selector(didChangeSelection(_:)), name: NSTextView.didChangeSelectionNotification, object: nil)
	}
	
	open override func viewDidChangeEffectiveAppearance() {
		self.autocompletePopover.appearance = effectiveAppearance
	}
	
	open override func awakeFromNib() {
		initialize()
	}
	
	open override func keyDown(with event: NSEvent) {
		let row = self.autocompleteTableView.selectedRow
		var shouldComplete = autocompletesWhileTyping
		
		switch event.keyCode {
		case 51 where deleteClosesAutocompletionPopover:
			// Delete
			autocompletePopover.close()
			shouldComplete = false
		case 53:
			// Esc
			autocompletePopover.animates = true
			if autocompletePopover.isShown {
				autocompletePopover.close()
			} else {
				complete(self)
			}
			autocompletePopover.animates = false
			return // Skip default behavior
		case 125:
			// Down
			if autocompletePopover.isShown {
				let rowToSelect = row == candidates.count-1 ? 0 : row+1
				autocompleteTableView.selectRowIndexes(IndexSet(integer: rowToSelect), byExtendingSelection: false)
				autocompleteTableView.scrollRowToVisible(autocompleteTableView.selectedRow)
				return // Skip default behavior
			}
		case 126:
			// Up
			if autocompletePopover.isShown {
				let rowToSelect = row == 0 ? candidates.count-1 : row-1
				autocompleteTableView.selectRowIndexes(IndexSet(integer: rowToSelect), byExtendingSelection: false)
				autocompleteTableView.scrollRowToVisible(autocompleteTableView.selectedRow)
				return // Skip default behavior
			}
		case 36, 48:
			// Return or tab
			if autocompletePopover.isShown {
				insert(self)
				return // Skip default behavior
			}
			fallthrough
		case 49 where characterIsWordBoundary(Character(unicodeScalarLiteral: " ")):
			// Space
			if self.autocompletePopover.isShown {
				autocompletePopover.close()
			}
		default:
			break
		}
		
		super.keyDown(with: event)
		
		if shouldComplete {
			self.complete(self)
		}
	}
	
	@objc func insert(_ sender: Any) {
		defer {
			autocompletePopover.close()
		}
		
		guard autocompleteTableView.selectedRow >= 0 && autocompleteTableView.selectedRow < candidates.count else {
			return
		}
		
		let string = candidates[autocompleteTableView.selectedRow].autocompletionInsertionString
		
		let beginningOfWord = selectedRange.location - substring.count
		let range = autocompletionInsertionMode == .complete ? NSRange(location: beginningOfWord, length: substring.count) : selectedRange
		if shouldChangeText(in: range, replacementString: string) {
			replaceCharacters(in: range, with: string)
			didChangeText()
		}
		
	}
	
	@objc func didChangeSelection(_ notification: NSNotification) {
		if labs(selectedRange.location - lastPos) > 1 {
			autocompletePopover.close()
		}
	}
	
	private func characterIsWordBoundary(_ character: Character) -> Bool {
		return autocompletionWordBoundaryCharacterSet.isSuperset(of: CharacterSet.init(charactersIn: String(character)))
	}
	
	open override func complete(_ sender: Any?) {
		guard let window = window else { return }
		
		let startIndex = string.prefix(selectedRange.location).lastIndex {
			characterIsWordBoundary($0)
			}.flatMap { string.index(after: $0) } ?? string.startIndex
		
		let endIndex = string[startIndex...].firstIndex {
			characterIsWordBoundary($0)
			} ?? string.endIndex
		
		let substringRange = startIndex ..< endIndex
		substring = string[substringRange]
		
		guard !substring.isEmpty else {
			// This happens when we just started a new word or if we have already typed the entire word
			autocompletePopover.close()
			return
		}
		
		var index = 0
		
		if let delegate = autocompletionDelegate ?? delegate as? NCRAutocompleteTextViewDelegate {
			let completions = delegate.textView(self, completionsFor: substring, forPartialWordRange: NSRange(substringRange, in: string))
			self.candidates = completions.candidates
			index = completions.indexOfSelectedItem
		} else if let complete = delegate?.textView(_:completions:forPartialWordRange:indexOfSelectedItem:) {
			candidates = complete(self, [String(substring)], NSRange(substringRange, in: string), &index)
		} else {
			candidates = self.completions(forPartialWordRange: NSRange(substringRange, in: string), indexOfSelectedItem: &index) ?? []
		}
		
		guard !candidates.isEmpty else {
			autocompletePopover.close()
			return
		}
		
		lastPos = selectedRange.location
		autocompleteTableView.reloadData()
		
		autocompleteTableView.selectRowIndexes(IndexSet(integer: index), byExtendingSelection: false)
		autocompleteTableView.scrollRowToVisible(index)
		
		configureFramesAndDescription(recalculatingWidth: true)
		
		// We want to find the middle of the first character to show the popover.
		// firstRect(forCharacterRange: actualRange:) will give us the rect at the
		// beginning of the word, and then we need to find the half-width of the
		// first characterto add to it.
		var rect = firstRect(forCharacterRange: NSRange(substringRange, in: string), actualRange: nil)
		rect = window.convertFromScreen(rect)
		rect = convert(rect, from: nil)
		let firstChar = (substring as NSString).substring(to: 1) as NSString
		let firstCharSize = firstChar.size(withAttributes: [.font: self.font as Any])
		rect.size.width = firstCharSize.width
		
		autocompletePopover.show(relativeTo: rect, of: self, preferredEdge: .maxY)
	}
	
	func configureFramesAndDescription(recalculatingWidth: Bool = false) {
		// Make the frame for the popover. We want it to shrink with a small number
		// of items to autocomplete but never grow above a certain limit when there
		// are a lot of items. The limit is set by autocompletionMaximumResultCount
		let numberOfRows = min(autocompleteTableView.numberOfRows, autocompletionMaximumResultCount)
		let height: CGFloat = (autocompleteTableView.rowHeight + autocompleteTableView.intercellSpacing.height) * CGFloat(numberOfRows) + 2 * 0
		let width: CGFloat = {
			if recalculatingWidth {
				let maxTitleWidth: CGFloat = candidateDisplayStrings.reduce(0.0) { previous, current in
					let w = (current as NSString).size(withAttributes: self.autocompletionAttributes).width
					return max(previous, w)
				}
				let maxDescriptionWidth: CGFloat = candidates.reduce(0.0) { previous, current in
					guard let c = current.autocomplationDescriptionString else { return previous }
					let w = (c as NSString).size(withAttributes: [.font: descriptionLabel!.font as Any]).width + 20
					return max(previous, w)
				}
				
				return max(autocompletionPopoverMinimumWidth, min(autocompletionPopoverMaximumWidth, max(maxTitleWidth, maxDescriptionWidth)))
			}
			return autocompletePopover.contentSize.width
		}()
		
		let description = candidates[autocompleteTableView.selectedRow].autocomplationDescriptionString
		
		var descriptionHeight: CGFloat = description.flatMap {
			descriptionLabel.stringValue = $0
			return descriptionLabel.cell!.cellSize(forBounds: NSMakeRect(CGFloat(0.0), CGFloat(0.0), width, .greatestFiniteMagnitude)).height
			} ?? 0.0
		
		if descriptionHeight > 0 {
			descriptionHeight += 2
			descriptionLabel.isHidden = false
			let frame = CGRect(x: 0,
							   y: 1,
							   width: width,
							   height: descriptionHeight)
			descriptionLabel.frame = NSInsetRect(frame, 4, 0)
		} else {
			descriptionLabel.isHidden = true
		}
		
		autocompleteTableView.enclosingScrollView?.frame = CGRect(x: 0,
																  y: descriptionHeight,
																  width: width,
																  height: height)
		autocompletePopover.contentSize = NSSize(width: width,
												 height: height + descriptionHeight)
	}
	
	public func tableViewSelectionDidChange(_ notification: Notification) {
		configureFramesAndDescription()
	}
	
	public func numberOfRows(in tableView: NSTableView) -> Int {
		return candidates.count
	}
	
	private var imageViews: [NSImageView] = []
	
	private func makeImageView() -> NSImageView {
		let imageView = NSImageView(frame: .zero)
		imageView.imageFrameStyle = .none
		imageView.imageScaling = .scaleNone
		return imageView
	}
	
	public func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
		let cellView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("MyView"), owner: self) as? NSTableCellView ?? {
			let cellView = NSTableCellView(frame: .zero)
			
			let textField = NSTextField(frame: .zero)
			textField.isBezeled = false
			textField.drawsBackground = false
			textField.isEditable = false
			textField.isSelectable = false
			cellView.addSubview(textField)
			cellView.textField = textField
			
			cellView.identifier = NSUserInterfaceItemIdentifier("MyView")
			
			return cellView
		}()
		
		let candidate = candidates[row]
		
		let displayString = candidateDisplayStrings[row]
		
		let attributedString = NSMutableAttributedString(string: displayString, attributes: autocompletionAttributes)
		
		if !autocompletionHighlightedAttributes.isEmpty,
			let substring = substring,
			let range = candidate.autocompletionDisplayString.range(of: substring, options: [.anchored, .caseInsensitive]) {
			let nsRange = NSRange(range, in: candidate.autocompletionDisplayString)
			let adjustedRange = NSRange(location: nsRange.location + (displayString.count - candidate.autocompletionDisplayString.count), length: nsRange.length)
			attributedString.addAttributes(autocompletionHighlightedAttributes, range: adjustedRange)
		}
		
		let range = NSRange(location: showsAutoCompletionImages ? 1 : 0, length: maxSecondaryDescriptionLength)
		attributedString.addAttribute(.foregroundColor, value: NSColor.secondaryLabelColor, range: range)
		
		cellView.textField?.attributedStringValue = attributedString
		cellView.textField?.toolTip = candidate.autocomplationDescriptionString
		
		if showsAutoCompletionImages {
			if cellView.imageView == nil {
				let imageView = imageViews.popLast() ?? makeImageView()
				cellView.addSubview(imageView)
				cellView.imageView = imageView
			}
			
			cellView.imageView?.image = candidates[row].autocompletionImage
		} else if let imageView = cellView.imageView {
			imageView.image = nil
			cellView.imageView = nil
			cellView.removeFromSuperview()
			self.imageViews.append(imageView)
		}
		
		return cellView
	}
	
	public func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
		let rowView = NCRAutocompleteTableRowView()
		rowView.highlightColor = self.autocompletionHighlightColor
		return rowView
	}
	
}
