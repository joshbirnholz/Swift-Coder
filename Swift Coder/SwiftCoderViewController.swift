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
import SourceKittenFramework


struct ProblemIndexPath: Equatable {
	var list: ProblemSet
	var index: Int
}

class SwiftCoderViewController: NSViewController {
	
	let codeController: CodeController = LocalCodeController.shared
	let sourceKitten = SourceKitten()
	let lexer = { SwiftLexer() }()
	
	var isAutomaticCodeCompletionEnabled: Bool {
		get {
			return userDefaults.bool(forKey: #function)
		}
		set {
			userDefaults.set(newValue, forKey: #function)
		}
	}
	
	enum AssistantView: Int, CaseIterable {
		case tableView
		case textView
	}
	
	func view(for assistantView: AssistantView) -> NSView {
		switch assistantView {
		case .tableView:
			return tableScrollView
		case .textView:
			return outputTextView
		}
	}
	
	fileprivate func configureQuickHelpButton() {
		for segmentedControl in [(view.window?.windowController as? WindowController)?.assistantSegmentedControl, touchBarAssistantSegmentedControl] {
			segmentedControl?.selectedSegment = isQuickHelpVisible ? 1 : 0
		}
		
	}
	
	var _isQuickHelpVisible: Bool = false
	var isQuickHelpVisible: Bool {
		get {
			if LocalCodeController.shared.isSandboxed {
				return false
			}
			return _isQuickHelpVisible
		}
		set {
			guard !LocalCodeController.shared.isSandboxed else {
				return
			}
			
			_isQuickHelpVisible = newValue
			
			if isQuickHelpVisible {
				updateQuickHelp()
				
				AssistantView.allCases.forEach {
					view(for: $0).isHidden = true
				}
				
			} else {
				AssistantView.allCases.forEach {
					view(for: $0).isHidden = $0 != assistantView
				}
			}
			
			quickHelpTextView.isHidden = !isQuickHelpVisible
			
			configureQuickHelpButton()
			configureOutputStatus()
		}
	}
	
	/// This changes whether the textfield is shown (for errors, hints, solutions) or the table is shown (test results)
	var assistantView: AssistantView = .textView {
		didSet {
			AssistantView.allCases.forEach {
				view(for: $0).isHidden = $0 != assistantView
			}
			
			isQuickHelpVisible = false
		}
	}
	
	fileprivate func configureOutputStatus() {
		if isQuickHelpVisible {
			outputStatusTextField.stringValue = "Quick Help"
			outputStatusTextField.textColor = .labelColor
		} else {
			outputStatusTextField.stringValue = outputStatus.string
			outputStatusTextField.textColor = outputStatus.textColor
		}
	}
	
	var outputStatus: (string: String, textColor: NSColor?) = ("", .labelColor) {
		didSet {
			configureOutputStatus()
		}
	}
	
	@IBOutlet weak var outputStatusTextField: NSTextField!
	@IBOutlet weak var titleTextView: NSTextField!
	@IBOutlet var outputTextView: NSTextView!
	@IBOutlet weak var inputTextView: SyntaxTextView!
	@IBOutlet weak var nextButton: NSButton!
	@IBOutlet weak var previousButton: NSButton!
	@IBOutlet weak var promptTextField: NSTextField!
	@IBOutlet weak var showSolutionButton: NSButton!
	@IBOutlet weak var outputTableView: NSTableView!
	@IBOutlet weak var tableScrollView: NSScrollView!
	@IBOutlet weak var helpButton: NSButton!
	@IBOutlet var quickHelpTextView: NSTextView!
	
	var _untypedProblemScrubber: NSView? {
		didSet {
			if #available(macOS 10.12.2, *) {
				updateScrubber()
			}
		}
	}
	
	@available(macOS 10.12.2, *)
	var problemScrubber: NSScrubber? {
		return _untypedProblemScrubber as? NSScrubber
	}
	
	var touchBarAssistantSegmentedControl: NSSegmentedControl?
	
	lazy var maxScrubberItemWidth: CGFloat = 0
	
	var scrubberShouldAffectProblemIndex = true
	
	var finishedLoadingView = false
	
	var testResults: [CompilationResult.TestResult] = []
	
	var allHiddenTestResultsPassed: Bool = false
	
	var problems: [Problem] {
		return problemIndexPath.list.problems
	}
	
	fileprivate func configureShowSolutionButton() {
		if problem.solution != nil {
			if problem.hidesSolutionUntilSolved {
				showSolutionButton.isHidden = !codeController.user(codeController.getActiveUserName(), hasSolved: problem)
			} else {
				showSolutionButton.isHidden = false
			}
		} else {
			showSolutionButton.isHidden = true
		}
		
		showSolutionButton.title = problem.hidesSolutionUntilSolved ? "See Our Solution" : "Show Solution"
	}
	
	var problemIndexPath: ProblemIndexPath! {
		willSet {
			guard finishedLoadingView else { return }
			guard let problem = problem else { return }
			do {
				try codeController.saveCode(inputTextView.text, for: problem)
			} catch {
				NSAlert(error: error).runModal()
			}
		}
		didSet {
			if problemIndexPath.list != oldValue?.list {
				configureProblemMenu()
				
				if #available(macOS 10.12.2, *) {
					updateScrubber()
				}
			}
			
			userDefaults.set(problemIndexPath.list.title, forKey: "problemList")
			userDefaults.set(problemIndexPath.index, forKey: "problemIndex")
			nextButton.isEnabled = problemIndexPath.index + 1 < problems.count
			previousButton.isEnabled = problemIndexPath.index - 1 >= 0
			
			configureShowSolutionButton()
			
			helpButton.isHidden = problem.hint == nil
			
			titleTextView.stringValue = problem.title
			updateWindowTitle()
			
			outputStatus = ("", .labelColor)
			outputTextView.string = ""
			
			testResults.removeAll()
			outputTableView.reloadData()
			
			let prompt = attributedStringForCodeMarkdown(from: problem.prompt)
			
			if !problem.testCases.isEmpty {
				let testCasesString = problem.testCases.prefix(problem.eulerMode ? 0 : 3).map { problem.expectationString(testCase: $0) }.joined(separator: "\n")
				
				let testCasesAttributedString = NSAttributedString(string: "\n\n" + testCasesString, attributes: [.font: NSFont.systemFont(ofSize: 14), .foregroundColor: NSColor.labelColor])
				
				prompt.append(testCasesAttributedString)
			}
			
			promptTextField.attributedStringValue = prompt
			
			inputTextView.text = codeController.loadCode(for: problem)
			
			if isQuickHelpVisible {
				updateQuickHelp()
			} else {
				assistantView = .textView
			}
		}
	}
	
	var problem: Problem! {
		get {
			if let problemIndexPath = problemIndexPath, problemIndexPath.list.problems.indices.contains(problemIndexPath.index) {
				return problemIndexPath.list.problems[problemIndexPath.index]
			} else {
				return problemIndexPath.list.problems.first
			}
		}
	}
	
	let userDefaults = UserDefaults.standard
	let problemMenu: NSMenu = NSMenu(title: "Problems")
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		quickHelpTextView.textContainer?.replaceLayoutManager(RoundedBackgroundLayoutManager())
		outputTextView.textContainer?.replaceLayoutManager(RoundedBackgroundLayoutManager())
		
		codeController.setActiveUsername(userDefaults.string(forKey: activeUserUserDefaultsKey))
		
		let savedProblemSetTitle = userDefaults.string(forKey: "problemList")
		
		let problemSet = ProblemSet.allCases.first(where: { savedProblemSetTitle == $0.title }) ?? ProblemSet.allCases.first!
		let index = min(userDefaults.integer(forKey: "problemIndex"), problemSet.problems.count-1)
		problemIndexPath = ProblemIndexPath(list: problemSet, index: index)
		
		inputTextView.needsDisplay = true
		
		outputTextView.typingAttributes[.foregroundColor] = NSColor.labelColor
		
		inputTextView.delegate = self
		inputTextView.theme = SourceCodeThemes.dynamicSwiftBook
		inputTextView.scrollView.scrollerKnobStyle = NSScroller.KnobStyle.default
		inputTextView.wantsLayer = true
		inputTextView.layer?.borderWidth = 1
		inputTextView.borderColor = .border
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
		
		inputTextView.contentTextView.autocompletionDelegate = self
		inputTextView.contentTextView.autocompletionPopoverMinimumWidth = 250
		inputTextView.contentTextView.autocompletionAttributes[.font] = NSFont.codingFont(ofSize: 12)
		inputTextView.contentTextView.deleteClosesAutocompletionPopover = false
		inputTextView.contentTextView.autocompletionHighlightedAttributes = [:]
		inputTextView.contentTextView.autocompletesWhileTyping = false
		
		var wordCharacterSet: Set<Character> = .alphanumerics
		"()?!#@$\\`_-<>".forEach { wordCharacterSet.insert($0) }
		
		inputTextView.contentTextView.autocompletionWordCharacterSet = wordCharacterSet
		
		setupCodeMenu()
		setupHelpMenu()
		setupAppMenu()
		
		isQuickHelpVisible = true
		
		finishedLoadingView = true
		
	}
	
	private var initialUserMenuSetupCompleted = false
	
	override func viewDidAppear() {
		super.viewDidAppear()
		
		if !initialUserMenuSetupCompleted {
			setupUserMenu()
		}
		
		configureQuickHelpButton()
		
	}
	
	override func viewWillDisappear() {
		super.viewWillDisappear()
		
		do {
			// Save code
			try self.codeController.saveCode(self.inputTextView.text, for: self.problem)
		} catch {
			NSLog("Error: Could not save code: \(error)")
		}
	}
	
	override func viewWillAppear() {
		super.viewWillAppear()
		
		updateWindowTitle()
		
		if #available(OSX 10.14, *) {
			let appearance = userDefaults.string(forKey: "applicationAppearance").flatMap(NSAppearance.Name.init(rawValue:)).flatMap(NSAppearance.init(named:))
			if appearance != NSApp.appearance {
				NSApp.appearance = appearance
			}
		}
	}
	
	func updateWindowTitle() {
//		view.window?.title = problemIndexPath.list.title
		
		(view.window?.windowController as? WindowController)?.titleLabel?.stringValue = problemIndexPath.list.title
	}
	
	func setupHelpMenu() {
		guard let helpMenu = NSApp.mainMenu?.item(withTitle: "Help")?.submenu else { return }
		
		swiftVersionMenuItem = helpMenu.insertItem(withTitle: codeController.swiftVersionString() ?? "Swift Not Found", action: #selector(doNothing), keyEquivalent: "", at: helpMenu.items.count)
		
		helpMenu.insertItem(.separator(), at: helpMenu.items.count)
		
		helpMenu.insertItem(withTitle: "Glossary", action: #selector(openGlossary), keyEquivalent: "", at: helpMenu.items.count)
		helpMenu.insertItem(.separator(), at: helpMenu.items.count)
		
		helpMenu.insertItem(withTitle: "Swift Guided Tour", action: #selector(openGuidedTour), keyEquivalent: "", at: helpMenu.items.count)
		helpMenu.insertItem(withTitle: "Swift Language Guide", action: #selector(openLanguageGuide), keyEquivalent: "", at: helpMenu.items.count)
	}
	
	@objc func openGlossary() {
		guard let glossaryURL = Bundle.main.url(forResource: "glossary", withExtension: "html") else { return }
		
		NSWorkspace.shared.open(glossaryURL)
	}
	
	func setupUserMenu() {
		defer {
			initialUserMenuSetupCompleted = true
		}
		
		guard let toolbarItem = (view.window?.windowController as? WindowController)?.userToolbarMenu,
			let userMenu = toolbarItem.menu else {
				return
		}
		
		userMenu.removeAllItems()
		
		let fullUserName = NSFullUserName()
		
		let defaultUserItem = userMenu.insertItem(withTitle: fullUserName, action: #selector(userMenuItemSelected(_:)), keyEquivalent: "", at: userMenu.items.count)
		
		let users = codeController.getUsernames()
		let activeUsername = codeController.getActiveUserName()
		
		if activeUsername == nil {
			toolbarItem.select(defaultUserItem)
			toolbarItem.setTitle(fullUserName)
		}
		
		for user in users {
			let userItem = userMenu.insertItem(withTitle: user, action: #selector(userMenuItemSelected(_:)), keyEquivalent: "", at: userMenu.items.count)
			userItem.representedObject = user
			
			if let activeUsername = activeUsername, activeUsername == user {
				toolbarItem.select(userItem)
				toolbarItem.setTitle(activeUsername)
			}
		}
		
		userMenu.insertItem(.separator(), at: userMenu.items.count)
		
		userMenu.insertItem(withTitle: "New User…", action: #selector(newUserMenuItemSelected(_:)), keyEquivalent: "", at: userMenu.items.count)
		userMenu.insertItem(withTitle: "Delete User", action: #selector(deleteCurrentUserMenuItemSelected), keyEquivalent: "", at: userMenu.items.count)
		
	}
	
	@objc func userMenuItemSelected(_ sender: NSMenuItem) {
		let userName = sender.representedObject as? String
		
		setUser(to: userName)
	}
	
	func setUser(to userName: String?) {
		updateProblemIndex(to: problemIndexPath.index)
		
		codeController.setActiveUsername(userName)
		
		inputTextView.text = codeController.loadCode(for: problem)
		
		updateProblemIndex(to: problemIndexPath.index)
		
		if let userName = userName {
			userDefaults.setValue(userName, forKey: activeUserUserDefaultsKey)
		} else {
			userDefaults.removeObject(forKey: activeUserUserDefaultsKey)
		}
		
		configureProblemMenu()
		
	}
	
	let activeUserUserDefaultsKey = "activeUser"
	
	@objc func deleteCurrentUserMenuItemSelected(sender: Any?) {
		setupUserMenu()
		
		guard let userName = codeController.getActiveUserName() else { return }
		
		let alert = NSAlert()
		
		alert.messageText = "Are you sure you want to delete \(userName)'s profile?"
		alert.informativeText = "All of \(userName)'s code will be moved to the trash."
		
		alert.addButton(withTitle: "Don't Delete")
		
		alert.addButton(withTitle: "Delete")
		
		switch alert.runModal() {
		case NSApplication.ModalResponse.alertSecondButtonReturn:
			setUser(to: nil)
			
			codeController.deleteUser(userName)
			
			setupUserMenu()
		default:
			break
		}
	}
	
	@objc func newUserMenuItemSelected(_ sender: NSMenuItem) {
		func showAlert(informativeText: String? = nil, name: String? = nil) {
			let alert = NSAlert()
			
			alert.messageText = "Enter your name:"
			if let informativeText = informativeText {
				alert.informativeText = informativeText
			}
			
			let textField = NSTextField(frame: NSRect(x: 0, y: 0, width: 200, height: 24))
			textField.placeholderString = "Name"
			
			if let name = name {
				textField.stringValue = name
			}
			
			alert.accessoryView = textField
			
			alert.addButton(withTitle: "Add User")
			
			alert.addButton(withTitle: "Cancel")
			
			switch alert.runModal() {
			case NSApplication.ModalResponse.alertFirstButtonReturn:
				let userName = textField.stringValue
				if codeController.validateUsername(userName) {
					setUser(to: userName)
					setupUserMenu()
				} else {
					showAlert(informativeText: "Please choose a different name. The name you chose contains one or more characters are aren't allowed.", name: userName)
				}
			default:
				break
			}
		}
		
		setupUserMenu()
		showAlert()
	}
	
	var codeCompletionToggleMenuItem: NSMenuItem?
	var swiftVersionMenuItem: NSMenuItem?
	
	func setupAppMenu() {
		guard let appMenu = NSApp.mainMenu?.items.first?.submenu else { return }
		
		appMenu.delegate = self
		
		let index = appMenu.indexOfItem(withTitle: "Preferences…")
		
		codeCompletionToggleMenuItem = appMenu.insertItem(withTitle: "Enable Code Completion", action: #selector(toggleCodeCompletionEnabled), keyEquivalent: "", at: index)
		
		appMenu.insertItem(withTitle: "Manage Problem Sets in Finder", action: #selector(manageProblemSetsInFinder), keyEquivalent: "", at: index)
		
		appMenu.insertItem(withTitle: "Enable String Integer Subscripts", action: #selector(toggleStringIntSubscriptAPI), keyEquivalent: "", at: index)
		
		appMenu.insertItem(withTitle: "Choose Toolchain…", action: #selector(setXcodePath), keyEquivalent: "", at: index)
		
	}
	
	@objc func manageProblemSetsInFinder() {
		let url = LocalCodeController.shared.applicationSupportDirectory.appendingPathComponent("Problems", isDirectory: true)
		NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: url.path)
	}
	
	@objc func toggleCodeCompletionEnabled() {
		self.isAutomaticCodeCompletionEnabled.toggle()
	}
	
	@objc func doNothing() { }
	
	private func updateSwiftVersionMenuItemTitle() {
		self.swiftVersionMenuItem?.title = self.codeController.swiftVersionString() ?? "Swift Not Found"
	}
	
	@objc func setXcodePath() {
		func chooseFile() {
			let openPanel = NSOpenPanel()
			openPanel.canChooseDirectories = false
			openPanel.canChooseFiles = true
			openPanel.allowsMultipleSelection = false
			openPanel.allowsOtherFileTypes = false
			openPanel.allowedFileTypes = ["xctoolchain"]
			openPanel.directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.applicationDirectory, in: .systemDomainMask).first
			
			openPanel.begin { (response) in
				if let url = openPanel.url, response == .OK {
					LocalCodeController.shared.customToolchainURL = url
					self.updateSwiftVersionMenuItemTitle()
				}
			}
		}
		
		if LocalCodeController.shared.customToolchainURL != nil {
			let alert = NSAlert()
			alert.messageText = "Choose Toolchain"
			alert.addButton(withTitle: "Use Default")
			alert.addButton(withTitle: "Browse")
			alert.addButton(withTitle: "Cancel")
			
			switch alert.runModal() {
			case .alertFirstButtonReturn:
				LocalCodeController.shared.customToolchainURL = nil
				self.updateSwiftVersionMenuItemTitle()
			case .alertSecondButtonReturn:
				chooseFile()
			default:
				break
			}
		} else {
			chooseFile()
		}
		
	}
	
	@objc func toggleStringIntSubscriptAPI() {
		let shouldInclude = !codeController.shouldIncludeStringSubscriptAPI()
		codeController.setShouldIncludeStringSubscriptAPI(shouldInclude)
	}
	
	@objc func openLanguageGuide() {
		NSWorkspace.shared.open(URL(string: "https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html")!)
	}
	
	@objc func openGuidedTour() {
		NSWorkspace.shared.open(URL(string: "https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html")!)
	}
	
	@objc @available(OSX 10.14, *)
	func setDefaultAppearance() {
		setAppearance(to: nil)
	}
	
	@objc @available(OSX 10.14, *)
	func setLightAppearance() {
		setAppearance(to: NSAppearance(named: .aqua))
	}
	
	@objc @available(OSX 10.14, *)
	func setDarkAppearance() {
		setAppearance(to: NSAppearance(named: .darkAqua))
	}
	
	@available(OSX 10.14, *)
	func setAppearance(to appearance: NSAppearance?) {
		NSApp.appearance = appearance
		userDefaults.set(appearance?.name.rawValue, forKey: "applicationAppearance")
	}
	
	func setupCodeMenu() {
		let codeMenu = NSMenu(title: "Code")
		codeMenu.addItem(withTitle: "Save and Run", action: #selector(goButtonPressed(sender:)), keyEquivalent: "\u{000d}")
		codeMenu.addItem(withTitle: "Start Over", action: #selector(startOver(sender:)), keyEquivalent: "")
		codeMenu.addItem(.separator())
		codeMenu.addItem(withTitle: "Comment/Uncomment", action: #selector(commentUncommentSelectedLines(_:)), keyEquivalent: "/")
		
		if #available(OSX 10.14, *) {
			let appearanceMenu = NSMenu(title: "Appearance")
			appearanceMenu.addItem(withTitle: "Automatic", action: #selector(setDefaultAppearance), keyEquivalent: "")
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
	
	func configureProblemMenu() {
		
		problemMenu.removeAllItems()
		problemMenu.addItem(withTitle: "Previous", action: #selector(previousButtonPressed(sender:)), keyEquivalent: "\u{001c}")
		problemMenu.addItem(withTitle: "Next", action: #selector(nextButtonPressed(sender:)), keyEquivalent: "\u{001d}")
		problemMenu.addItem(withTitle: "Random", action: #selector(randomButtonPressed(sender:)), keyEquivalent: "")
		problemMenu.addItem(.separator())
		
		let activeUser = codeController.getActiveUserName()
		
		let problemSetMenu = NSMenu(title: "Problem Set")
		let setItems: [NSMenuItem] = ProblemSet.allCases.map {
			let item = NSMenuItem(title: $0.title, action: #selector(problemSetMenuItemSelected), keyEquivalent: "")
			item.representedObject = $0
			
			let allSolved = $0.problems.allSatisfy { codeController.user(activeUser, hasSolved: $0) }
			
			if allSolved {
				item.title += " ⭐️"
			}
			
			return item
		}
		setItems.forEach(problemSetMenu.addItem)
		
		let problemSetMenuItem = NSMenuItem(title: "Problem Sets", action: nil, keyEquivalent: "")
		problemSetMenuItem.submenu = problemSetMenu
		problemMenu.addItem(problemSetMenuItem)
		problemMenu.addItem(.separator())
		
//		problemSetPopupButton.menu = problemSetMenu
//		problemSetPopupButton.setTitle(problemIndexPath.list.title)
		
		let items: [NSMenuItem] = problems.enumerated().map { index, problem in
			let item = NSMenuItem(title: problem.title, action: #selector(problemMenuItemSelected), keyEquivalent: "")
			item.representedObject = index
			
			if codeController.user(activeUser, hasSolved: problem) {
				let unattributedString = "\(problem.title) ✓"
				let str = NSMutableAttributedString(string: unattributedString)
				
				let index = unattributedString.lastIndex(of: "✓")!
				let range = index ... index
				
				str.addAttributes([.foregroundColor: NSColor.successGreen], range: NSRange(range, in: unattributedString))
				
				item.attributedTitle = str
			}
			
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
		scrubber.selectedIndex = problemIndexPath.index
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
	
	/// Use this function to set the problem index and update the scrubber correctly.
	///
	/// Just changing the problem index on its own can lead to the problem index being set incorrectly, because scrolling the scrubber on the Touch Bar triggers didSelectItem, which sets the problem index again (to an incorrect value, for some reason). This method ensures that the scrubber doesn't affect the problem index by automatically setting `scrubberShouldAffectProblemIndex` to true.
	func updateProblemIndex(to newValue: Int) {
		scrubberShouldAffectProblemIndex = false
		problemIndexPath.index = newValue
		if #available(OSX 10.12.2, *) {
			problemScrubber?.animator().scrollItem(at: problemIndexPath.index, to: .center)
		}
		scrubberShouldAffectProblemIndex = true
	}
	
	@IBAction func nextButtonPressed(sender: AnyObject) {
		updateProblemIndex(to: problemIndexPath.index + 1)
	}
	
	@IBAction func previousButtonPressed(sender: AnyObject) {
		updateProblemIndex(to: problemIndexPath.index - 1)
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
			self.problemIndexPath = ProblemIndexPath(list: selectedSet, index: 0)
		}
	}
	
	@IBAction func goButtonPressed(sender: AnyObject) {
		
		outputTextView.string = ""
		outputStatus = ("Compiling…", .labelColor)
		
		testResults.removeAll()
		outputTableView.reloadData()
		
		assistantView = .textView
		
		let code = self.inputTextView.text
		let startedProblemIndex = self.problemIndexPath
		
		do {			
			try self.codeController.saveAndTest(code, for: self.problem) { (result) in
				
				print("Ended")
				guard self.problemIndexPath == startedProblemIndex else {
					return
				}
				DispatchQueue.main.async {
					switch result {
					case .internalError(let error):
						self.assistantView = .textView
						self.outputStatus = ("Unable to test your code:", .errorRed)
						
						if let error = error as? CompilationError {
							switch error {
							case .error(let contents):
								switch contents {
								case .compilerMessages(let messages):
									self.outputTextView.font = .codingFont(ofSize: 13)
									self.outputTextView.string = messages.map { $0.description }.joined(separator: "\n")
								case .text(let string):
									self.outputTextView.font = .codingFont(ofSize: 13)
									self.outputTextView.string = string
								}
							case .timeout:
								self.outputTextView.font = .systemFont(ofSize: 14)
								self.outputTextView.string = "It took too long to test your code."
							}
						} else if let error = error as? LocalCodeController.PathError {
							self.outputTextView.font = .systemFont(ofSize: 14)
							self.outputTextView.string = error.localizedDescription
						} else {
							self.outputTextView.font = .systemFont(ofSize: 14)
							self.outputTextView.string = error.localizedDescription
						}
						
					case .failure(let compilationError):
						self.assistantView = .textView
						self.outputStatus = ("Compile problems:", .errorRed)
						switch compilationError {
						case .error(let contents):
							switch contents {
							case .compilerMessages(let messages):
								// The messages array contains all of the compile-time errors produced by the user's code.
								self.outputTextView.font = .codingFont(ofSize: 13)
								self.outputTextView.string = messages.filter { $0.messageType != .note }.map { "\($0.messageType == .error ? "🛑" : "⚠️") line \($0.line): \($0.message)" }.joined(separator: "\n\n")
							case .text(let string):
								self.outputTextView.font = .codingFont(ofSize: 13)
								self.outputTextView.string = string
							}
						case .timeout:
							self.outputTextView.font = .systemFont(ofSize: 14)
							self.outputTextView.string = "Your code took too long to compile."
						}
					case .success(let testResults):
						self.testResults = testResults.enumerated().filter { index, _ in !self.problem.testCases[index].isHidden }.map { $0.element }
						self.allHiddenTestResultsPassed = testResults.enumerated().filter { index, _ in self.problem.testCases[index].isHidden }.allSatisfy{
							$1.success == .ok
						}
						
						let numSuccesses = testResults.filter { $0.success == .ok }.count
						
						if numSuccesses == testResults.count {
							let activeUsername = self.codeController.getActiveUserName()
							let allSolved = self.problemIndexPath.list.problems.allSatisfy { self.codeController.user(activeUsername, hasSolved: $0) }
							
							var message = "✓ "
							
							if allSolved {
								message = "⭐️ "
							}
							
							message += "All correct"
							
							self.outputStatus = (message, .successGreen)
							
							self.codeController.user(self.codeController.getActiveUserName(), didSolve: self.problem)
							self.configureProblemMenu()
							
							self.configureShowSolutionButton()
						} else if numSuccesses > testResults.count / 2 {
							self.outputStatus = ("Correct for more than half the tests", .successGreen)
						} else {
							self.outputStatus = ("", .labelColor)
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
				self.assistantView = .textView
				self.outputStatus = ("Error saving your code:", .errorRed)
				self.outputTextView.font = .systemFont(ofSize: 14)
				self.outputTextView.string = error.localizedDescription
			}
		}
		
	}
	
	@IBAction func showSolution(sender: AnyObject) {
		outputStatus = ("Solution:", .labelColor)
		self.assistantView = .textView
		
		if let solution = problem.solution {
			let string = solution + "\n"
			let theme = inputTextView.theme ?? SourceCodeThemes.dynamicSwiftBook
			let highlightedSolution = sourceKitten?.highlightedCode(forSource: string, theme: theme) ?? NSMutableAttributedString(source: string, tokens: lexer.getSavannaTokens(input: string), theme: theme)
			
			highlightedSolution.addAttributes([
				.font: NSFont.codingFont(ofSize: 13)!,
				.backgroundColor: theme.backgroundColor
				], range: NSRange(location: 0, length: highlightedSolution.length))
			
			outputTextView.textStorage?.setAttributedString(highlightedSolution)
		} else {
			outputTextView.font = .systemFont(ofSize: 14)
			outputTextView.string = "The solution isn't available for this problem."
		}
		
	}
	
	@IBAction func showHint(sender: AnyObject) {
		if let hint = problem.hint, let url = URL(string: hint) {
			NSWorkspace.shared.open(url)
		} else {
			outputStatus = ("Hint:", .labelColor)
			self.assistantView = .textView
			
			if let hint = problem.hint {
				let attr = attributedStringForCodeMarkdown(from: hint)
				outputTextView.textStorage?.setAttributedString(attr)
			} else {
				outputTextView.font = .systemFont(ofSize: 14)
				outputTextView.string = "There is no hint for this problem."
			}
			
		}
	}
	
	private let baseAttributes: [NSAttributedString.Key: Any] = [.font: NSFont.systemFont(ofSize: 14), .foregroundColor: NSColor.labelColor]
	
	private func attributedStringForCodeMarkdown(from string: String, baseAttributes: [NSAttributedString.Key: Any]? = nil) -> NSMutableAttributedString {
		let baseAttributes = baseAttributes ?? self.baseAttributes
		
		let attr = NSMutableAttributedString(string: string, attributes: baseAttributes)
		let codeMatches = string.matches(forRegex: #"```[a-z]*\n(.*)?\n```|`([^`]*)`|^    (.*)"#, options: [.anchorsMatchLines])
		
		for match in codeMatches.reversed() {
			let range = NSRange(match.fullMatch.range, in: string)
			attr.addAttributes([.font: NSFont.codingFont(ofSize: 14) as Any], range: range)
			attr.replaceCharacters(in: range, with: match.groups.first!.value)
		}
		
		let boldMatches = attr.string.matches(forRegex: #"\*\*(.+)\*\*"#, options: [.caseInsensitive])
		
		for match in boldMatches.reversed() {
			let range = NSRange(match.fullMatch.range, in: attr.string)
			attr.applyFontTraits([.boldFontMask], range: range)
			attr.replaceCharacters(in: range, with: match.groups.first!.value)
		}
		
		let italicMatches = attr.string.matches(forRegex: #"\*(.+)\*"#, options: [.caseInsensitive])
		
		for match in italicMatches.reversed() {
			let range = NSRange(match.fullMatch.range, in: attr.string)
			attr.applyFontTraits([.italicFontMask], range: range)
			attr.replaceCharacters(in: range, with: match.groups.first!.value)
		}
		
		return attr
	}
	
	@IBAction func startOver(sender: AnyObject) {
		
		let alert = NSAlert()
		alert.messageText = "Are you sure you want to start over?"
		alert.informativeText = "This will delete all of your code for this problem."
		alert.addButton(withTitle: "Cancel")
		alert.addButton(withTitle: "Start Over")
		
		switch alert.runModal() {
		case NSApplication.ModalResponse.alertSecondButtonReturn:
			do {
				try codeController.deleteUserRecords(forUser: codeController.getActiveUserName(), problem: problem)
				inputTextView.text = problem.startingCode
				configureProblemMenu()
				configureShowSolutionButton()
			} catch {
				NSAlert(error: error).runModal()
			}
		default:
			break
		}
		
	}
	
//	func printCompletionOptions() {
//		let options = sourceKitten.complete(source: inputTextView.text, offset: inputTextView.contentTextView.selectedRange().upperBound)
//		for option in options {
//			print([option.typeName.flatMap { "(\($0))" }, option.name].compactMap({$0}).joined(separator: " "))
//			if let docBrief = option.docBrief {
//				print(docBrief)
//			}
//			print()
//		}
//	}
	
	let noQuickHelpString: NSAttributedString = {
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.alignment = .center
		return NSAttributedString(string: "No Quick Help", attributes: [
			.font: NSFont.systemFont(ofSize: 17),
			.foregroundColor: NSColor.labelColor,
			.paragraphStyle: paragraphStyle
			])
	}()
	
	func showNoQuickHelp() {
		if Thread.isMainThread {
			self.quickHelpTextView.textStorage?.setAttributedString(self.noQuickHelpString)
			self.quickHelpTextView.isSelectable = false
			self.quickHelpTextView.alphaValue = 0.6
		} else {
			DispatchQueue.main.async {
				self.showNoQuickHelp()
			}
		}
	}
	
	func updateQuickHelp() {
		guard let sourceKitten = sourceKitten else { return }
		
		guard isQuickHelpVisible, let sdkPath = try? LocalCodeController.shared.sdkPath() else {
			return showNoQuickHelp()
		}
		
		do {
			var string: String!
			if Thread.isMainThread {
				string = self.inputTextView.text
			} else {
				DispatchQueue.main.sync {
					string = self.inputTextView.text
				}
			}
			
			try self.codeController.saveCode(string, for: self.problem)
		} catch {
			return showNoQuickHelp()
		}
		
		let offset = inputTextView.contentTextView.selectedRange().lowerBound
		
		DispatchQueue.global(qos: .userInteractive).async {
			let programFilePath = LocalCodeController.shared.baseDirectory.appendingPathComponent(self.problem.functionName + ".swift").path
			
			guard let cursorInfo = sourceKitten.cursorInfo(path: programFilePath, offset: offset, sdkPath: sdkPath) ?? sourceKitten.cursorInfo(path: programFilePath, offset: offset-1, sdkPath: sdkPath) else {
				return self.showNoQuickHelp()
			}
				
			let attributedString = self.attributedStringForCodeMarkdown(from: "**Declaration**\n\n")
			
			let declaration = sourceKitten.parse(declaration: cursorInfo.annotatedDeclaration)
			
			let theme = self.inputTextView.theme ?? SourceCodeThemes.dynamicSwiftBook
			
			let highlightedDeclaration = sourceKitten.highlightedCode(forSource: declaration + "\n", theme: theme)
			
			highlightedDeclaration.addAttributes([
				.font: NSFont.codingFont(ofSize: 13)!,
				.backgroundColor: theme.backgroundColor
				], range: NSRange(location: 0, length: highlightedDeclaration.length))
			
			attributedString.append(highlightedDeclaration)
			
			if let doc = cursorInfo.fullDocumentation() {
				let attributedDocumentation = self.attributedStringForCodeMarkdown(from: "\n\(doc)")
				attributedString.append(attributedDocumentation)
			}
			
			DispatchQueue.main.async {
				self.quickHelpTextView.isSelectable = true
				self.quickHelpTextView.alphaValue = 1
				self.quickHelpTextView.textStorage?.setAttributedString(attributedString)
			}
			
		}
	}
	
	@objc func assistantSegmentedControlValueChanged(_ sender: NSSegmentedControl) {
		isQuickHelpVisible = sender.selectedSegment == 1
	}
	
	func applicationShouldTerminateAfterLastWindowClosed(app: NSApplication) -> Bool {
		return true
	}
	
	var completionsNeedDisplay = false
	
	func shouldInclude(_ completionItem: CodeCompletionItem, word: String? = nil) -> Bool {
		if let kind = SwiftDeclarationKind(rawValue: completionItem.kind) {
			let hiddenDeclarationKinds: Set<SwiftDeclarationKind> = [/*.functionOperator,
																	 .functionOperatorInfix,
																	 .functionOperatorPrefix,
																	 .functionOperatorPostfix,*/
																	 .functionSubscript,
																	 .precedenceGroup,
			]
		
			if hiddenDeclarationKinds.contains(kind) {
				return false
			}
		}
		
		if let typeName = completionItem.typeName, (completionItem.moduleName == "Swift" && typeName.contains("_")) || (typeName == "<<error type>>" && (completionItem.descriptionKey ?? completionItem.name) == word) {
			return false
		}
		
		if completionItem.moduleName == "Swift", let name = completionItem.name, name.hasPrefix("print"), SwiftDeclarationKind(rawValue: completionItem.kind) == .functionFree {
			return false
		}
		
		return true
	}
	
	func completionItem(_ first: CodeCompletionItem, isOrderedBefore second: CodeCompletionItem) -> Bool {
		
		// Prioritize parameters and items from local scope
		let firstContextIsLocal = first.context.contains("local")
		let secondContextIsLocal = second.context.contains("local")
		
		switch (firstContextIsLocal, secondContextIsLocal) {
		case (true, false):
			return true
		case (false, true):
			return false
		default:
			break
		}
		
		let firstIsKeyword = first.kind.contains("keyword")
		let secondIsKeyword = second.kind.contains("keyword")
		
		// Prioritize `return`
		let firstIsReturn = firstIsKeyword && first.name == "return"
		let secondIsReturn = secondIsKeyword && second.name == "return"
		
		switch (firstIsReturn, secondIsReturn) {
		case (true, false):
			return true
		case (false, true):
			return false
		default:
			break
		}
		
		// Prioritize items defined by the user
		let firstContextIsFromSameModule = first.context.contains("thismodule")
		let secondContextIsFromSameModule = second.context.contains("thismodule")
		
		switch (firstContextIsFromSameModule, secondContextIsFromSameModule) {
		case (true, false):
			return true
		case (false, true):
			return false
		default:
			break
		}
		
		// Prioritize these keywords, in order
		let keywords = ["let", "var", "if", "for", "while", "func", "return"]
		
		let indexOfFirst: Int? = firstIsKeyword ? first.name.flatMap { keywords.firstIndex(of: $0) } : nil
		let indexOfSecond: Int? = secondIsKeyword ? second.name.flatMap { keywords.firstIndex(of: $0) } : nil
		
		switch (indexOfFirst, indexOfSecond) {
		case (let firstIndex?, let secondIndex?):
			return firstIndex < secondIndex
		case (_?, nil):
			return true
		case (nil, _?):
			return false
		default:
			break
		}
		
		// Deprioritize operators
		let firstIsOperator = first.kind.contains("operator")
		let secondIsOperator = second.kind.contains("operator")
		
		switch (firstIsOperator, secondIsOperator) {
		case (true, false):
			return false
		case (false, true):
			return true
		default:
			break
		}
		
		// Prioritize functions and variables
		let firstContains = first.kind.contains("function") || first.kind.contains("var")
		let secondContains = second.kind.contains("function") || second.kind.contains("var")

		switch (firstContains, secondContains) {
		case (true, false):
			return true
		case (false, true):
			return false
		default:
			break
		}
		
//		// Prioritize keywords
//		switch (firstIsKeyword, secondIsKeyword) {
//		case (true, false):
//			return true
//		case (false, true):
//			return false
//		default:
//			break
//		}
		
		// Prioritize alphabetically
		return first.autocompletionDisplayString < second.autocompletionDisplayString
	}
	
	var completionItems: [CodeCompletionItem] = []
	
	func updateCompletionOptions(source: String, offset: Int) {
		guard let sourceKitten = sourceKitten else { return }
		print(#function)
		
		guard let sdkPath = try? LocalCodeController.shared.sdkPath() else {
			completionItems.removeAll()
			return
		}
		
		
		let items = sourceKitten.complete(source: source, offset: offset, sdkPath: sdkPath).filter { shouldInclude($0) }.sorted(by: completionItem(_:isOrderedBefore:))
		
//		completionItems = items.filter { shouldInclude($0) }.sorted(by: completionItem(_:isOrderedBefore:))
//		return
		
		if !items.isEmpty {
			completionItems = items
//			inputTextView.contentTextView.complete(self)
		}
	}
	
	@available(OSX 10.12.2, *)
	override func makeTouchBar() -> NSTouchBar? {
		let mainBar = NSTouchBar()
		mainBar.delegate = self
		mainBar.defaultItemIdentifiers = [.go, .commentUncomment, .problems, .quickHelp]
		mainBar.customizationAllowedItemIdentifiers = [.go, .commentUncomment, .characterPicker, .problems, .quickHelp]
		mainBar.customizationRequiredItemIdentifiers = []
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
	static let quickHelp = NSTouchBarItem.Identifier("com.josh.birnholz.Swift-Coder.quickHelp")
}

// MARK: NSTouchBarDelegate

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
		case .quickHelp:
			let item = NSCustomTouchBarItem(identifier: identifier)
			let segmentedControl = NSSegmentedControl(images: [NSImage(named: NSImage.touchBarListViewTemplateName)!, #imageLiteral(resourceName: "HelpButton")], trackingMode: .selectOne, target: self, action: #selector(assistantSegmentedControlValueChanged(_:)))
			segmentedControl.selectedSegment = isQuickHelpVisible ? 1 : 0
			item.view = segmentedControl
			item.customizationLabel = "Quick Help"
//			item.visibilityPriority = .high
			self.touchBarAssistantSegmentedControl = segmentedControl
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
			self._untypedProblemScrubber = scrubber
			return item
		default:
			return nil
		}
	}

}

// MARK: NSScrubberDelegate

@available(OSX 10.12.2, *)
extension SwiftCoderViewController: NSScrubberDelegate {
	func scrubber(_ scrubber: NSScrubber, didSelectItemAt selectedIndex: Int) {
		guard scrubberShouldAffectProblemIndex else { return }
		problemIndexPath.index = selectedIndex
	}
}

// MARK: NSScrubberDataSource

@available(OSX 10.12.2, *)
extension SwiftCoderViewController: NSScrubberDataSource {

	func numberOfItems(for scrubber: NSScrubber) -> Int {
		return problemIndexPath.list.problems.count
	}

	func scrubber(_ scrubber: NSScrubber, viewForItemAt index: Int) -> NSScrubberItemView {
		let itemView = scrubber.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ProblemScrubberItemIdentifier"), owner: self) as! NSScrubberTextItemView
		itemView.title = problemIndexPath.list.problems[index].title
		return itemView
	}

}

// MARK: NSScrubberFlowLayoutDelegate

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

// MARK: NSTableViewDataSource

extension SwiftCoderViewController: NSTableViewDataSource {
	
	func numberOfRows(in tableView: NSTableView) -> Int {
		guard !testResults.isEmpty else { return 0 }
		
		if problem.testCases.contains(where: { $0.isHidden }) {
			return testResults.count + 1
		} else {
			return testResults.count
		}
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

// MARK: NSTableViewDelegate

extension SwiftCoderViewController: NSTableViewDelegate {
	
	func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
		
		let isHiddenRow = row == testResults.count
		var result: CompilationResult.TestResult {
			return testResults[row]
		}
		
		if tableColumn == tableView.tableColumns[0] {
			let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ExpectedCellID"), owner: nil) as! NSTableCellView
			if isHiddenRow {
				cell.textField?.stringValue = "other tests"
			} else {
				cell.textField?.stringValue = problem.expectationString(testCase: problem.testCases[row])
			}
			
			return cell
		} else if tableColumn == tableView.tableColumns[1] {
			let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "RunCellID"), owner: nil) as! NSTableCellView
			if isHiddenRow {
				cell.textField?.stringValue = ""
			} else {
				cell.textField?.stringValue = result.run
			}
			
			return cell
		} else if tableColumn == tableView.tableColumns[2] {
			let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "OkayCellID"), owner: nil) as! NSTableCellView
			let successful: CompilationResult.TestResult.Successful = isHiddenRow ? (allHiddenTestResultsPassed ? .ok : .failure) : result.success
			
			cell.textField?.stringValue = successful.rawValue
			
			return cell
		} else if tableColumn == tableView.tableColumns[3] {
			let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ColorCellID"), owner: nil) as! BackgroundColorTableCellView
			cell.wantsLayer = true
			
			let successful: CompilationResult.TestResult.Successful = isHiddenRow ? (allHiddenTestResultsPassed ? .ok : .failure) : result.success
			
			cell.backgroundColor = successful == .ok ? .successGreen : .errorRed
			
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

// MARK: NSMenuItemValidation

extension SwiftCoderViewController: NSMenuItemValidation {
	func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
		if menuItem.action == #selector(previousButtonPressed(sender:)) {
			return problemIndexPath.index - 1 >= 0
		}
		
		if menuItem.action == #selector(toggleCodeCompletionEnabled) {
			menuItem.state = isAutomaticCodeCompletionEnabled ? .on : .off
		}
		
		if menuItem.action == #selector(nextButtonPressed(sender:)) {
			return problemIndexPath.index + 1 < problems.count
		}
		
		if menuItem.action == #selector(problemMenuItemSelected(_:)) {
			menuItem.state = (menuItem.representedObject as? Int) == problemIndexPath.index ? .on : .off
		}
		
		if menuItem.action == #selector(problemSetMenuItemSelected(_:)) {
			if let problemSet = menuItem.representedObject as? ProblemSet {
				menuItem.state = problemSet == problemIndexPath.list ? .on : .off
				if problemSet.problems.isEmpty {
					return false
				}
			}
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
		
		if menuItem.action == #selector(toggleStringIntSubscriptAPI) {
			menuItem.state = codeController.shouldIncludeStringSubscriptAPI() ? .on : .off
		}
		
		if menuItem == swiftVersionMenuItem {
			return false
		}
		
		if menuItem.action == #selector(userMenuItemSelected(_:)) {
			menuItem.state = codeController.getActiveUserName() == menuItem.representedObject as? String ? .on : .off
		}
		
		if menuItem.action == #selector(deleteCurrentUserMenuItemSelected) {
			return codeController.getActiveUserName() != nil
		}
		
		return true
	}
}

// MARK: SyntaxTextViewDelegate

extension SwiftCoderViewController: SyntaxTextViewDelegate {
	func lexerForSource(_ source: String) -> Lexer {
		return sourceKitten ?? lexer
	}
	
	func didChangeText(_ syntaxTextView: SyntaxTextView) {
		print(#function)
//		self.completionsNeedDisplay = true
//		syntaxTextView.contentTextView.complete(self)
	}
	
	func didChangeSelectedRange(_ syntaxTextView: SyntaxTextView, selectedRange: NSRange) {
		self.completionsNeedDisplay = isAutomaticCodeCompletionEnabled
		print(#function)
		self.updateQuickHelp()
		var string: String!
		if Thread.isMainThread {
			string = self.inputTextView.text
		} else {
			DispatchQueue.main.sync {
				string = self.inputTextView.text
			}
		}
		
		DispatchQueue.global(qos: .userInteractive).sync {
			self.updateCompletionOptions(source: string, offset: selectedRange.location)
			if self.completionsNeedDisplay {
				DispatchQueue.main.async {
					syntaxTextView.contentTextView.complete(self)
					if self.completionsNeedDisplay {
						self.completionsNeedDisplay = false
					}
				}
			}
		}
	}
	
	func textViewDidBeginEditing(_ syntaxTextView: SyntaxTextView) {
		print(#function)
	}
	
	func toolTip(forCharacterAt characterIndex: Int, source: String, in syntaxTextView: SyntaxTextView) -> String? {
		guard let sourceKitten = sourceKitten, let sdkPath = try? LocalCodeController.shared.sdkPath() else { return nil }
		
		do {
			try LocalCodeController.shared.saveCode(inputTextView.text, for: problem)
		} catch {
			return nil
		}
		
		let programFilePath = LocalCodeController.shared.baseDirectory.appendingPathComponent(self.problem.functionName + ".swift").path
		
		guard let cursorInfo = sourceKitten.cursorInfo(path: programFilePath, offset: characterIndex, sdkPath: sdkPath) else {
			return nil
		}
			
		let declaration: String = sourceKitten.parse(declaration: cursorInfo.annotatedDeclaration)
		
		var toolTip = declaration
		
		if let summary = cursorInfo.fullDocumentation()?.summary {
			toolTip += "\n\n\(summary)"
		}
		
		return toolTip
	}
	
}

// MARK: NCRAutocompleteTextViewDelegate

extension SwiftCoderViewController: NCRAutocompleteTextViewDelegate {
	func textView(_ textView: NCRAutocompleteTextView, completionsFor word: Substring, forPartialWordRange charRange: NSRange) -> (candidates: [NCRAutocompletionCandidate], indexOfSelectedItem: Int) {
		
		let lowercased = word.lowercased()
		
		var filteredCompletionItems: [NCRAutocompletionCandidate] = completionItems.filter { completionItem in
			shouldInclude(completionItem, word: String(word)) && completionItem.autocompletionInsertionString.lowercased().hasPrefix(lowercased)
		}
		
		if filteredCompletionItems.isEmpty {
			filteredCompletionItems = completionItems
			inputTextView.contentTextView.autocompletionInsertionMode = .insert
		} else {
			inputTextView.contentTextView.autocompletionInsertionMode = .complete
		}
		
		print("Just finished: " + word)
		
		//		filteredCompletionItems = filteredCompletionItems.sorted { first, second in
		//			if first.autocompletionInsertionString.lowercased().hasPrefix(word.lowercased()) {
		//				return true
		//			} else {
		//				return false
		//			}
		//		}
		
		return (filteredCompletionItems, 0)
		
		//		guard let sdkPath = try? LocalCodeController.shared.sdkPath() else { return ([], -1) }
		//
		//		let items = sourceKitten.complete(source: syntaxTextView.text, offset: charRange.upperBound, sdkPath: sdkPath)
		//
		//		return (items, 0)
	}
	
	func textView(_ textView: NCRAutocompleteTextView, shouldShowImagesFor candidates: [NCRAutocompletionCandidate]) -> Bool {
		return candidates.contains { ($0 as? CodeCompletionItem)?.autocompletionImage != nil }
	}
	
}

extension SwiftCoderViewController: NSMenuDelegate {
	func menuNeedsUpdate(_ menu: NSMenu) {
		codeCompletionToggleMenuItem?.isHidden = !(isAutomaticCodeCompletionEnabled || NSEvent.modifierFlags.contains(.option))
	}
}
