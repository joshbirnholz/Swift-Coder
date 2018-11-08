//
//  ViewController.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 4/16/16.
//  Copyright © 2016 Josh Birnholz. All rights reserved.
//

import Cocoa
import SavannaKit
import SourceEditor

class SwiftCoderViewController: NSViewController {
	
	let codeController: CodeController = LocalCodeController.shared
	let lexer = SwiftLexer()
	
	enum AssistantView: CaseIterable {
		case tableView
		case textField
	}
	
	func view(for assistantView: AssistantView) -> NSView {
		switch assistantView {
		case .tableView:
			return tableScrollView
		case .textField:
			return outputField
		}
	}
	
	/// This changes whether the textfield is shown (for errors, hints, solutions) or the table is shown (test results)
	var assistantView: AssistantView = .textField {
		didSet {
			AssistantView.allCases.forEach {
				view(for: $0).isHidden = $0 != assistantView
			}
		}
	}
	
	@IBOutlet weak var outputStatusTextField: NSTextField!
	@IBOutlet weak var titleTextField: NSTextField!
	@IBOutlet var outputField: NSTextView!
	@IBOutlet weak var inputTextView: SyntaxTextView!
	@IBOutlet weak var nextButton: NSButton!
	@IBOutlet weak var previousButton: NSButton!
	@IBOutlet weak var promptTextField: NSTextField!
	@IBOutlet weak var showSolutionButton: NSButton!
	@IBOutlet weak var outputTableView: NSTableView!
	@IBOutlet weak var tableScrollView: NSScrollView!
	@IBOutlet weak var helpButton: NSButton!
	
	var untypedProblemScrubber: NSView? {
		didSet {
			if #available(macOS 10.12.2, *) {
				updateScrubber()
			}
		}
	}
	
	@available(macOS 10.12.2, *)
	var problemScrubber: NSScrubber? {
		return untypedProblemScrubber as? NSScrubber
	}
	
	lazy var maxScrubberItemWidth: CGFloat = 0
	
	var scrubberShouldAffectProblemIndex = true
	
	var problemList: ProblemSet! {
		didSet {
			if oldValue != nil {
				problemIndex = 0
			}
			
			userDefaults.set(problemList?.rawValue, forKey: "problemList")
			
			setupProblemMenuAndScrubber()
			
			if #available(macOS 10.12.2, *) {
				updateScrubber()
			}
		}
	}
	
	var testResults: [CompilationResult.TestResult] = []
	
	var problems: [Problem] {
		return problemList.problems
	}
	
	@objc var problemIndex: Int = 0 {
		willSet {
			guard let problem = problem else { return }
			do {
				try codeController.saveCode(inputTextView.text, for: problem)
			} catch {
				NSAlert(error: error).runModal()
			}
		}
		didSet {
			userDefaults.set(problemIndex, forKey: "problemIndex")
			nextButton.isEnabled = problemIndex + 1 < problems.count
			previousButton.isEnabled = problemIndex - 1 >= 0
			
			showSolutionButton.isHidden = problem.solution == nil
			helpButton.isHidden = problem.hint == nil
			
			titleTextField.stringValue = problem.title
			
			outputStatusTextField.stringValue = ""
			outputField.string = ""
			
			assistantView = .textField
			
			promptTextField.stringValue = [problem.prompt, problem.testCases.prefix(problem.eulerMode ? 0 : 3).enumerated().map( { index, _ in
				problem.expectationString(testCaseIndex: index)
			}).joined(separator: "\n")].compactMap { $0 != "" ? $0 : nil }.joined(separator: "\n\n")
			
			inputTextView.text = codeController.loadCode(for: problem)
		}
	}
	
	var problem: Problem! {
		get {
			if let problemList = problemList, problemList.problems.indices.contains(problemIndex) {
				return problemList.problems[problemIndex]
			} else {
				return problemList.problems.last
			}
		}
	}
	
	let userDefaults = UserDefaults.standard
	let problemMenu: NSMenu = NSMenu(title: "Problems")
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let key = userDefaults.string(forKey: "problemList"), let list = ProblemSet(rawValue: key) {
			problemList = list
		} else {
			problemList = ProblemSet.allCases.first
		}
		
		var index = userDefaults.integer(forKey: "problemIndex")
		
		if index > problems.count {
			index = problems.count - 1
		}
		
		problemIndex = index
		
		inputTextView.needsDisplay = true
		
		let font = NSFont(name: "Menlo", size: 13)!
		let attributes: [NSAttributedString.Key : Any] = [.font : font, .foregroundColor: NSColor.labelColor]
		
		outputField.typingAttributes = attributes
		
		inputTextView.delegate = self
		inputTextView.theme = SourceCodeThemes.swiftBook
		inputTextView.scrollView.scrollerKnobStyle = NSScroller.KnobStyle.default
		inputTextView.wantsLayer = true
		inputTextView.layer?.borderWidth = 1
		if #available(OSX 10.14, *) {
			inputTextView.borderColor = NSColor(named: NSColor.Name("borderColor"))!
		} else {
			inputTextView.borderColor = #colorLiteral(red: 0.7725490196, green: 0.7725490196, blue: 0.7725490196, alpha: 1)
		}
		if #available(OSX 10.12.2, *) {
			inputTextView.contentTextView.isAutomaticTextCompletionEnabled = false
		}
		inputTextView.contentTextView.isAutomaticQuoteSubstitutionEnabled = false
		inputTextView.contentTextView.isAutomaticDataDetectionEnabled = false
		inputTextView.contentTextView.isAutomaticLinkDetectionEnabled = false
		inputTextView.contentTextView.isAutomaticTextReplacementEnabled = false
		inputTextView.contentTextView.isAutomaticDashSubstitutionEnabled = false
		inputTextView.contentTextView.isAutomaticSpellingCorrectionEnabled = false
		inputTextView.contentTextView.isRichText = false
		
		setupCodeMenu()
		
	}
	
	override func viewWillDisappear() {
		super.viewWillDisappear()
		
		do {
			// Save code
			try self.codeController.saveCode(self.inputTextView.text, for: self.problem)
		} catch {
			NSLog("Error: Could not save code: \(error)")
		}
		
		do {
			// Delete temporary files
			try FileManager.default.removeItem(at: LocalCodeController.shared.tempDirectory)
		} catch {
			NSLog("Error: Could not delete contents of \(LocalCodeController.shared.tempDirectory.path): \(error)")
		}
	}
	
	@objc @available(OSX 10.14, *)
	func setDefaultAppearance() {
		NSApp.appearance = nil
	}
	
	@objc @available(OSX 10.14, *)
	func setLightAppearance() {
		NSApp.appearance = NSAppearance(named: .aqua)
	}
	
	@objc @available(OSX 10.14, *)
	func setDarkAppearance() {
		NSApp.appearance = NSAppearance(named: .darkAqua)
	}
	
	func setupCodeMenu() {
		let codeMenu = NSMenu(title: "Code")
		codeMenu.addItem(withTitle: "Save and Run", action: #selector(goButtonPressed(sender:)), keyEquivalent: "\u{000d}")
		//		codeMenu.addItem(withTitle: "Run With…", action: #selector(runTestWithCustomParameters), keyEquivalent: "")
		codeMenu.addItem(withTitle: "Start Over", action: #selector(startOver(sender:)), keyEquivalent: "")
		codeMenu.addItem(.separator())
		codeMenu.addItem(withTitle: "Comment/Uncomment", action: #selector(commentUncommentSelectedLines(_:)), keyEquivalent: "/")
		
		if #available(OSX 10.14, *) {
			let appearanceMenu = NSMenu(title: "Appearance")
			appearanceMenu.addItem(withTitle: "Default", action: #selector(setDefaultAppearance), keyEquivalent: "")
			appearanceMenu.addItem(withTitle: "Light", action: #selector(setLightAppearance), keyEquivalent: "")
			appearanceMenu.addItem(withTitle: "Dark", action: #selector(setDarkAppearance), keyEquivalent: "")
			let appearanceMenuItem = NSMenuItem(title: "Appearance", action: nil, keyEquivalent: "")
			appearanceMenuItem.submenu = appearanceMenu
			let windowMenu = NSApp.mainMenu?.item(withTitle: "Window")
			windowMenu?.submenu?.insertItem(appearanceMenuItem, at: 0)
			windowMenu?.submenu?.insertItem(.separator(), at: 1)
		}
		
		let codeMenuItem = NSMenuItem(title: "Code", action: nil, keyEquivalent: "")
		codeMenuItem.submenu = codeMenu
		NSApp.mainMenu?.insertItem(codeMenuItem, at: NSApp.mainMenu!.items.count-1)
		//		NSApp.mainMenu?.addItem(codeMenuItem)
	}
	
	func setupProblemMenuAndScrubber() {
		
		// Setup problem menu
		
		problemMenu.removeAllItems()
		problemMenu.addItem(withTitle: "Previous", action: #selector(previousButtonPressed(sender:)), keyEquivalent: "\u{001c}")
		problemMenu.addItem(withTitle: "Next", action: #selector(nextButtonPressed(sender:)), keyEquivalent: "\u{001d}")
		problemMenu.addItem(withTitle: "Random", action: #selector(randomButtonPressed(sender:)), keyEquivalent: "")
		problemMenu.addItem(.separator())
		
		let problemSetMenu = NSMenu(title: "Problem Set")
		let setItems: [NSMenuItem] = ProblemSet.allCases.map {
			let item = NSMenuItem(title: $0.rawValue, action: #selector(problemSetMenuItemSelected), keyEquivalent: "")
			item.representedObject = $0
			return item
		}
		setItems.forEach(problemSetMenu.addItem)
		let problemSetMenuItem = NSMenuItem(title: "Problem Sets", action: nil, keyEquivalent: "")
		problemSetMenuItem.submenu = problemSetMenu
		problemMenu.addItem(problemSetMenuItem)
		
		problemMenu.addItem(.separator())
		
		let items: [NSMenuItem] = problems.enumerated().map { index, problem in
			let item = NSMenuItem(title: problem.title, action: #selector(problemMenuItemSelected), keyEquivalent: "")
			item.representedObject = index
			return item
		}
		items.forEach(problemMenu.addItem)
		
		if !NSApp.mainMenu!.items.contains(where: { $0.title == "Problems" }) {
			let problemMenuItem = NSMenuItem(title: "Problems", action: nil, keyEquivalent: "")
			problemMenuItem.submenu = problemMenu
			NSApp.mainMenu?.insertItem(problemMenuItem, at: NSApp.mainMenu!.items.count-1)
		}
		
	}
	
	@available(macOS 10.12.2, *)
	func updateScrubber() {
		guard let scrubber = problemScrubber else {
			return
		}
		
		maxScrubberItemWidth = problems.enumerated().map { width(forItemAt: $0.offset) }.max() ?? 0
		scrubber.reloadData()
		scrubber.selectedIndex = problemIndex
	}
	
	/// Comments or uncomments all selected lines.
	@objc @IBAction func commentUncommentSelectedLines(_ sender: Any?) {
		let selectedRange = Range(inputTextView.contentTextView.selectedRange())!
		let firstSelectedLineNumber = inputTextView.text[inputTextView.text.startIndex ..< inputTextView.text.index(inputTextView.text.startIndex, offsetBy: selectedRange.lowerBound)].components(separatedBy: "\n").count

		let selectedLineCount: Int = {
			var lines = 1
			if selectedRange.lowerBound != selectedRange.upperBound {
				let selectedText = inputTextView.text[inputTextView.text.index(inputTextView.text.startIndex, offsetBy: selectedRange.lowerBound) ..< inputTextView.text.index(inputTextView.text.startIndex, offsetBy: selectedRange.upperBound)]
				lines = selectedText.components(separatedBy: "\n").count
				
				if selectedText.last == "\n" {
					lines -= 1
				}
				
			}
			return lines
		}()
		
		let lastSelectedLineNumber = firstSelectedLineNumber+selectedLineCount
		
		// An array of whether or not each line is already commented
		let commentStatuses = inputTextView.text.components(separatedBy: "\n").map { $0.trimmingCharacters(in: .whitespacesAndNewlines).hasPrefix("//") }
		let allCommentStatuesesEqual = Set(commentStatuses[firstSelectedLineNumber-1 ..< lastSelectedLineNumber-1]).count == 1
		
		for lineNumber in firstSelectedLineNumber ..< lastSelectedLineNumber {
			// If multiple lines are selected and their comment status is not all the same, only add comments; don't uncomment
			if selectedLineCount > 1 && !allCommentStatuesesEqual {
				if !commentStatuses[lineNumber-1] {
					commentUncomment(line: lineNumber)
				}
			} else {
				commentUncomment(line: lineNumber)
			}
			
		}
		
		if selectedRange.count > 0 {
			let lines = inputTextView.text.components(separatedBy: "\n")
			let untilFirstSelectedLine = lines[0..<firstSelectedLineNumber-1]
			let startIndex = untilFirstSelectedLine.map { $0.count }.reduce(firstSelectedLineNumber-1, +)
			
			let untilLastSelectedLine = lines[0..<lastSelectedLineNumber-1]
			let endIndex = untilLastSelectedLine.map { $0.count }.reduce(firstSelectedLineNumber+selectedLineCount-2, +)
			
			inputTextView.contentTextView.setSelectedRange(NSRange(startIndex ... endIndex))
		}
		
		// Code highlighting doesn't update when text is removed, only when added. So "add" an empty string at the beginning to ensure that the source code highlighting updates.
		inputTextView.contentTextView.insertText("", replacementRange: NSRange(0 ..< 0))
		
	}
	
	/// Comments or uncomments a specific line.
	///
	/// - Parameter lineNumber: The line to (un)comment.
	/// - Returns: `true` if the line was commented, `false` if the line was uncommented.
	@discardableResult func commentUncomment(line lineNumber: Int) -> Bool {
		let commented: Bool
		
		let lines = inputTextView.text.components(separatedBy: "\n")
		let line = lines[lineNumber-1]
		
		let beginningOfLineIndex = lines.prefix(lineNumber-1).map { $0.count }.reduce(lineNumber-1, +)
		let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
		
		if let range = line.range(of: "//"), let trimmedRange = trimmedLine.range(of: "//"), trimmedRange.lowerBound == trimmedLine.startIndex {
			let start = beginningOfLineIndex + line.distance(from: line.startIndex, to: range.lowerBound)
			let end = start + 2
			
			let replacementRange = NSRange(start ..< end)
			inputTextView.contentTextView.replaceCharacters(in: replacementRange, with: "")
			commented = false
		} else {
			let replacementRange = NSRange(beginningOfLineIndex ..< beginningOfLineIndex)
			inputTextView.contentTextView.insertText("//", replacementRange: replacementRange)
			
			commented = true
		}
		
		return commented
	}
	
	func updateProblemIndex(to newValue: Int) {
		scrubberShouldAffectProblemIndex = false
		problemIndex = newValue
		if #available(OSX 10.12.2, *) {
			problemScrubber?.animator().scrollItem(at: problemIndex, to: .center)
		}
		scrubberShouldAffectProblemIndex = true
	}
	
	@IBAction func nextButtonPressed(sender: AnyObject) {
		updateProblemIndex(to: problemIndex + 1)
	}
	
	@IBAction func previousButtonPressed(sender: AnyObject) {
		updateProblemIndex(to: problemIndex - 1)
	}
	
	@objc func randomButtonPressed(sender: AnyObject) {
		updateProblemIndex(to: problems.indices.randomElement() ?? 0)
	}
	
	@objc func problemMenuItemSelected(_ sender: NSMenuItem) {
		guard let index = sender.representedObject as? Int else { return }
		updateProblemIndex(to: index)
	}
	
	@objc func problemSetMenuItemSelected(_ sender: NSMenuItem) {
		if let selectedSet = sender.representedObject as? ProblemSet {
			self.problemList = selectedSet
		}
	}
	
	@IBAction func goButtonPressed(sender: AnyObject) {
		
		outputField.string = ""
		outputStatusTextField.textColor = .labelColor
		outputStatusTextField.stringValue =  "Compiling…"
		assistantView = .textField
		
		let code = self.inputTextView.text
		let startedProblemIndex = self.problemIndex
		
		do {
			try self.codeController.saveCode(code, for: self.problem)
			
			self.codeController.test(code, for: self.problem) { (result) in
				
				print("Ended")
				guard self.problemIndex == startedProblemIndex else {
					return
				}
				DispatchQueue.main.async {
					switch result {
					case .internalError(let error):
						self.assistantView = .textField
						if #available(OSX 10.13, *) {
							self.outputStatusTextField.textColor = NSColor(named: NSColor.Name("errorRed"))
						} else {
							self.outputStatusTextField.textColor = .red
						}
						self.outputStatusTextField.stringValue =  "Unable to test your code:"
						
						if let error = error as? CompilationError {
							switch error {
							case .error(let output):
								self.outputField.string = output
							case .timeout:
								self.outputField.string = "It took too long to test your code."
							}
						} else {
							self.outputField.string = error.localizedDescription
						}
						
					case .failure(let compilationError):
						self.assistantView = .textField
						if #available(OSX 10.13, *) {
							self.outputStatusTextField.textColor = NSColor(named: NSColor.Name("errorRed"))
						} else {
							self.outputStatusTextField.textColor = .red
						}
						self.outputStatusTextField.stringValue =  "Compile problems:"
						switch compilationError {
						case .error(let output):
							self.outputField.string = output
						case .timeout:
							self.outputField.string = "Your code took too long to compile."
						}
					case .success(let testResults):
						self.testResults = testResults
						let numSuccesses = testResults.filter { $0.success == .ok }.count
						
						if numSuccesses == testResults.count {
							if #available(OSX 10.13, *) {
								self.outputStatusTextField.textColor = NSColor(named: NSColor.Name("successGreen"))
							} else {
								self.outputStatusTextField.textColor = NSColor(red:0.095, green:0.627, blue:0.109, alpha:1)
							}
							
							self.outputStatusTextField.stringValue = "✓ All correct"
						} else if numSuccesses > testResults.count / 2 {
							if #available(OSX 10.13, *) {
								self.outputStatusTextField.textColor = NSColor(named: NSColor.Name("successGreen"))
							} else {
								self.outputStatusTextField.textColor = NSColor(red:0.095, green:0.627, blue:0.109, alpha:1)
							}
							self.outputStatusTextField.stringValue = "Correct for more than half the tests"
						} else {
							self.outputStatusTextField.textColor = .labelColor
							self.outputStatusTextField.stringValue = ""
						}
						
						self.assistantView = .tableView
						self.outputTableView.reloadData()
						self.outputTableView.noteHeightOfRows(withIndexesChanged: IndexSet(integersIn: 0 ..< self.outputTableView.numberOfRows))
					}
				}
			}
			
		} catch {
			print("Error")
			DispatchQueue.main.async {
				self.assistantView = .textField
				if #available(OSX 10.13, *) {
					self.outputStatusTextField.textColor = NSColor(named: NSColor.Name("errorRed"))
				} else {
					self.outputStatusTextField.textColor = .red
				}
				self.outputStatusTextField.stringValue =  "Error saving your code:"
				self.outputField.string = error.localizedDescription
			}
		}
		
	}
	
	// This has problems, but also is completely unnecessary
	@objc func runTestWithCustomParameters() {
		let alert = NSAlert()
		alert.messageText = problem.title
		
		alert.addButton(withTitle: "Run")
		alert.addButton(withTitle: "Cancel")
		
		let templateFrame = NSRect(x: 0, y: 0, width: 250, height: 24)
		
		var views: [NSView] = []
		
//		let runStackView = NSStackView(frame: frame)
//
//		let outputTF = NSTextField(labelWithString: "")
//		let runButton = NSButton(title: "Run", target: nil, action: nil)
//
//		outputTF.setContentHuggingPriority(NSLayoutConstraint.Priority(rawValue: 10), for: .horizontal)
//
//		runStackView.addArrangedSubview(outputTF)
//		runStackView.addArrangedSubview(runButton)
//
//		views.append(runStackView)
		
		let initialCount = views.count
		
		views.append(contentsOf: problem.parameters.reversed().enumerated().map { (index, parameter) in
			switch parameter.type {
			case "String":
				let tf = NSTextField(frame: templateFrame)
				tf.placeholderString = parameter.name
				return tf
			case "Bool":
				let checkbox = NSButton(checkboxWithTitle: parameter.name, target: nil, action: nil)
				checkbox.frame = templateFrame
				return checkbox
			case "Int":
				return TextFieldStepperView(frame: templateFrame, name: parameter.name)
			default:
				return NSTextField(frame: templateFrame)
			}
		})
		
		let spacing = 6
		
		let stackView = NSStackView(frame: NSRect(x: 0, y: 0, width: 250, height: views.reduce(CGFloat(spacing*(views.count-1)), {
			return $0 + $1.frame.height
		})))
		views.reversed().forEach(stackView.addArrangedSubview)
		
		stackView.orientation = .vertical
		stackView.spacing = CGFloat(spacing)
		stackView.alignment = .left
		
		alert.accessoryView = stackView
		alert.beginSheetModal(for: NSApp.mainWindow!) { response in
			guard response == NSApplication.ModalResponse.alertFirstButtonReturn else {
				return
			}
			
			// Get parameters
			
			let parameters: [String] = self.problem.parameters.reversed().enumerated().map { (index, parameter) in
				let view = views[index+initialCount]
				switch parameter.type {
				case "String":
					return (view as! NSTextField).stringValue
				case "Bool":
					return (view as! NSButton).state == NSControl.StateValue.on ? "true" : "false"
				case "Int":
					return String(describing: (view as! TextFieldStepperView).value)
				default:
					return ""
				}
			}.reversed()
			
			print(parameters)
			
			// Run code
			
			let code = self.inputTextView.text
			
			do {
				try self.codeController.saveCode(code, for: self.problem)
			} catch {
				let alert = NSAlert(error: error)
				alert.runModal()
				return
			}
			
			self.codeController.run(code, for: self.problem, with: parameters) { (result) in
				DispatchQueue.main.async {
					do {
						let output = try result.unwrap()
						
						let alert = NSAlert()
						alert.messageText = self.problem.functionCall(with: parameters)
						alert.informativeText = output
						alert.runModal()
					} catch let error as CompilationError {
						let alert = NSAlert()
						alert.messageText = "There was an error running your code."
//						alert.informativeText = error.localizedDescription
						let label = NSTextField(wrappingLabelWithString: error.localizedDescription)
						label.font = NSFont(name: "Menlo", size: 12)!
						alert.accessoryView = label
						
						alert.runModal()
					} catch {
						let alert = NSAlert(error: error)
						alert.runModal()
					}
				}
			}

			
		}
		
	}
	
	@IBAction func showSolution(sender: AnyObject) {
		outputStatusTextField.textColor = .labelColor
		outputStatusTextField.stringValue = "Solution:"
		self.assistantView = .textField
		
		outputField.string = problem.solution ?? "The solution isn't available for this problem."
		
	}
	
	@IBAction func showHint(sender: AnyObject) {
		if let hint = problem.hint, let url = URL(string: hint) {
			NSWorkspace.shared.open(url)
		} else {
			outputStatusTextField.textColor = .labelColor
			outputStatusTextField.stringValue = "Hint:"
			self.assistantView = .textField
			
			outputField.string = problem.hint ?? "There is no hint for this problem."
		}
	}
	
	@IBAction func startOver(sender: AnyObject) {
		
		let alert = NSAlert()
		alert.messageText = "Are you sure you want to start over?"
		alert.informativeText = "This will delete all of your code for this problem."
		alert.addButton(withTitle: "Cancel")
		alert.addButton(withTitle: "Start Over")
		
		switch alert.runModal() {
		case NSApplication.ModalResponse.alertSecondButtonReturn:
			inputTextView.text = problem.startingCode
			try? codeController.saveCode(inputTextView.text, for: problem)
		default:
			break
		}
		
	}
	
	func applicationShouldTerminateAfterLastWindowClosed(app: NSApplication) -> Bool {
		return true
	}
	
	@available(OSX 10.12.2, *)
	override func makeTouchBar() -> NSTouchBar? {
		let mainBar = NSTouchBar()
		mainBar.delegate = self
		mainBar.defaultItemIdentifiers = [.go, .commentUncomment, .problems]
		mainBar.customizationAllowedItemIdentifiers = [.go, .commentUncomment, .problems]
		mainBar.customizationRequiredItemIdentifiers = [.go]
		mainBar.principalItemIdentifier = .problems
		mainBar.customizationIdentifier = "com.josh.birnholz.SwiftCoder.main-touch-bar"
		
		return mainBar
	}
	
}

@available(OSX 10.12.2, *)
extension NSTouchBarItem.Identifier {
	static let go = NSTouchBarItem.Identifier("com.josh.birnholz.Swift-Coder.go")
	static let commentUncomment = NSTouchBarItem.Identifier("com.josh.birnholz.Swift-Coder.comment-uncommon")
	static let problems = NSTouchBarItem.Identifier("com.josh.birnholz.Swift-Coder.problems")
}

@available(OSX 10.12.2, *)
extension SwiftCoderViewController: NSTouchBarDelegate {

	func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
		switch identifier {
		case .commentUncomment:
			let item = NSCustomTouchBarItem(identifier: identifier)
			item.view = NSButton(title: "//", target: self, action: #selector(commentUncommentSelectedLines(_:)))
			item.customizationLabel = "Comment/Uncomment"
			item.visibilityPriority = .low
			return item
		case .go:
			let item = NSCustomTouchBarItem(identifier: identifier)
			item.view = NSButton(image: NSImage(named: NSImage.touchBarPlayTemplateName)!, target: self, action: #selector(goButtonPressed(sender:)))
			item.customizationLabel = "Go"
			item.visibilityPriority = .high
			return item
		case .problems:
			let item = NSCustomTouchBarItem(identifier: identifier)
			let scrubber = NSScrubber()
			scrubber.scrubberLayout = NSScrubberFlowLayout()
			scrubber.register(NSScrubberTextItemView.self, forItemIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ProblemScrubberItemIdentifier"))
			scrubber.mode = .free
			scrubber.isContinuous = true
			scrubber.backgroundColor = .controlColor
			scrubber.selectionOverlayStyle = .outlineOverlay
			scrubber.floatsSelectionViews = true
			scrubber.delegate = self
			scrubber.dataSource = self
			scrubber.showsArrowButtons = false
			scrubber.showsAdditionalContentIndicators = true
			scrubber.itemAlignment = .center
			item.view = scrubber
			item.visibilityPriority = .high
			item.customizationLabel = "Problems"
			self.untypedProblemScrubber = scrubber
			return item
		default:
			return nil
		}
	}

}

@available(OSX 10.12.2, *)
extension SwiftCoderViewController: NSScrubberDelegate {
	func scrubber(_ scrubber: NSScrubber, didSelectItemAt selectedIndex: Int) {
		guard scrubberShouldAffectProblemIndex else { return }
		problemIndex = selectedIndex
	}
}

@available(OSX 10.12.2, *)
extension SwiftCoderViewController: NSScrubberDataSource {

	func numberOfItems(for scrubber: NSScrubber) -> Int {
		return problemList.problems.count
	}

	func scrubber(_ scrubber: NSScrubber, viewForItemAt index: Int) -> NSScrubberItemView {
		let itemView = scrubber.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ProblemScrubberItemIdentifier"), owner: self) as! NSScrubberTextItemView
		itemView.title = problemList.problems[index].title
		return itemView
	}

}

@available(OSX 10.12.2, *)
extension SwiftCoderViewController: NSScrubberFlowLayoutDelegate {

	// Helper method, not actually a delegate method
	func width(forItemAt itemIndex: Int) -> CGFloat {
		let font = NSFont.systemFont(ofSize: 0)
		let title = problems[itemIndex].title as NSString
		return title.size(withAttributes: [.font: font]).width + 48
	}
	
	func scrubber(_ scrubber: NSScrubber, layout: NSScrubberFlowLayout, sizeForItemAt itemIndex: Int) -> NSSize {
		//		let width = self.width(forItemAt: itemIndex)
		let width = maxScrubberItemWidth
		return NSSize(width: width, height: 30)
	}

}


extension SwiftCoderViewController: NSTableViewDataSource {
	
	func numberOfRows(in tableView: NSTableView) -> Int {
		return testResults.isEmpty ? 0 : testResults.count
	}
	
}

class BackgroundColorTableCellView: NSTableCellView {
	var backgroundColor: NSColor? {
		didSet {
			updateLayer()
		}
	}
	
	override func updateLayer() {
		super.updateLayer()
		
		layer?.backgroundColor = backgroundColor?.cgColor
	}
	
}

extension SwiftCoderViewController: NSTableViewDelegate {
	
	func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
		
		let result = testResults[row]
		
		if tableColumn == tableView.tableColumns[0] {
			let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ExpectedCellID"), owner: nil) as! NSTableCellView
			cell.textField?.stringValue = problem.expectationString(testCaseIndex: row)
			
			return cell
		} else if tableColumn == tableView.tableColumns[1] {
			let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "RunCellID"), owner: nil) as! NSTableCellView
			cell.textField?.stringValue = result.run
			
			return cell
		} else if tableColumn == tableView.tableColumns[2] {
			let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "OkayCellID"), owner: nil) as! NSTableCellView
			cell.textField?.stringValue = result.success.rawValue
			
			return cell
		} else if tableColumn == tableView.tableColumns[3] {
			let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ColorCellID"), owner: nil) as! BackgroundColorTableCellView
			cell.wantsLayer = true
			if #available(OSX 10.13, *) {
				cell.backgroundColor = result.success == .ok ? NSColor(named: NSColor.Name("successGreen")) : NSColor(named: NSColor.Name("errorRed"))
			} else {
				cell.backgroundColor = result.success == .ok ? NSColor(red:0.095, green:0.627, blue:0.109, alpha:1) : .red
			}
			return cell
		}
		
		return nil
		
		
	}
	
	func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
		return false
	}
	
	func tableView(_ tableView: NSTableView, shouldSelect tableColumn: NSTableColumn?) -> Bool {
		return false
	}
	
}

extension SwiftCoderViewController: NSMenuItemValidation {
	func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
		if menuItem.action == #selector(previousButtonPressed(sender:)) {
			return problemIndex - 1 >= 0
		}
		
		if menuItem.action == #selector(nextButtonPressed(sender:)) {
			return problemIndex + 1 < problems.count
		}
		
		if menuItem.action == #selector(problemMenuItemSelected(_:)) {
			menuItem.state = (menuItem.representedObject as? Int) == problemIndex ? .on : .off
		}
		
		if menuItem.action == #selector(problemSetMenuItemSelected(_:)) {
			if let problemSet = menuItem.representedObject as? ProblemSet {
				menuItem.state = problemSet == problemList ? .on : .off
				if problemSet.problems.isEmpty {
					return false
				}
			}
		}
		
		if menuItem.action == #selector(runTestWithCustomParameters) {
			return problem.parameters.count > 0
		}
		
		if #available(OSX 10.14, *) {
			if menuItem.action == #selector(setDefaultAppearance) {
				menuItem.state = NSApp.appearance == nil ? .on : .off
			}
			
			if menuItem.action == #selector(setLightAppearance) {
				menuItem.state = NSApp.appearance == NSAppearance(named: .aqua) ? .on : .off
			}
			
			if menuItem.action == #selector(setDarkAppearance) {
				menuItem.state = NSApp.appearance == NSAppearance(named: .darkAqua) ? .on : .off
			}
		}
		
		
		return true
	}
}

extension SwiftCoderViewController: SyntaxTextViewDelegate {
	func lexerForSource(_ source: String) -> Lexer {
		return lexer
	}
	
}
