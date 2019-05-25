//
//  SourceKitten.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 5/6/19.
//  Copyright © 2019 Josh Birnholz. All rights reserved.
//

import Cocoa
import SavannaKit
import SourceEditor
import SourceKittenFramework
import SWXMLHash

extension SyntaxToken {
	
	var savannaTokenType: SourceCodeTokenType {
		guard let kind = SyntaxKind(rawValue: type) else { return .plain }
		switch kind {
		case .argument:
			return .plain
		case .attributeBuiltin:
			return .keyword
		case .attributeID:
			return .plain
		case .buildconfigID:
			return .plain
		case .buildconfigKeyword:
			return .keyword
		case .comment, .commentMark, .commentURL, .docComment, .docCommentField:
			return .comment
		case .identifier:
			return .identifier
		case .keyword:
			return .keyword
		case .number:
			return .number
		case .objectLiteral:
			return .plain
		case .parameter:
			return .plain
		case .placeholder:
			return.editorPlaceholder
		case .string:
			return .string
		case .stringInterpolationAnchor:
			return.plain
		case .typeidentifier:
			return .typeIdentifier
		case .poundDirectiveKeyword:
			return .keyword
		}
	}
}

class SourceKitten: Lexer {
	
	// MARK: - Syntax highlighting
	
	init?() {
		guard !LocalCodeController.shared.isSandboxed else { return nil }
	}
	
	func getSavannaTokens(input: String) -> [Token] {
		do {
			let syntaxMap = try SyntaxMap(file: File(contents: input))
			
			return syntaxMap.tokens.map {
				let start = input.index(input.startIndex, offsetBy: $0.offset)
				let end = input.index(start, offsetBy: $0.length)
				
				return SimpleSourceCodeToken(type: $0.savannaTokenType, range: start ..< end)
			}
		} catch {
			print(error)
			return []
		}
	}
	
	// MARK: - Documentation
	
	struct CursorInfo: Codable {
		struct RelatedDeclaration: Codable {
			enum CodingKeys: String, CodingKey, CaseIterable {
				case annotatedDeclaration = "key.annotated_decl"
			}
			
			var annotatedDeclaration: String
		}
		
		private var cache: [String: Documentation] = [:]
		
		var name: String
		var annotatedDeclaration: String
		var fullyAnnotatedDeclaration: String?
		var usr: String
		var typeUSR: String?
		var containerTypeUSR: String?
		fileprivate var fullDocumentationXML: String?
		var isSystem: Bool?
		var groupName: String?
		var kind: String
		var moduleName: String?
		var typeName: String
		var relatedDeclarations: [RelatedDeclaration]
		
		enum CodingKeys: String, CodingKey, CaseIterable {
			case fullyAnnotatedDeclaration = "key.fully_annotated_decl"
			case relatedDeclarations = "key.related_decls"
			case typeUSR = "key.typeusr"
			case isSystem = "key.is_system"
			case usr = "key.usr"
			case containerTypeUSR = "key.containertypeusr"
			case annotatedDeclaration = "key.annotated_decl"
			case fullDocumentationXML = "key.doc.full_as_xml"
			case groupName = "key.groupname"
			case kind = "key.kind"
			case moduleName = "key.modulename"
			case typeName = "key.typename"
			case name = "key.name"
		}
		
		init?(parsing dictionary: [String: SourceKitRepresentable]) {
			guard !dictionary.isEmpty else { return nil }
			
			guard let typeusr = dictionary["key.typeusr"] else {
				print("No value for key key.typeusr")
				return nil
			}
			guard let typed_typeusr = typeusr as? String else {
				print("Type mismatch for key key.typeusr")
				return nil
			}
			guard let usr = dictionary["key.usr"] else {
				print("No value for key key.usr")
				return nil
			}
			guard let typed_usr = usr as? String else {
				print("Type mismatch for key key.usr")
				return nil
			}
			guard let annotated_decl = dictionary["key.annotated_decl"] else {
				print("No value for key key.annotated_decl")
				return nil
			}
			guard let typed_annotated_decl = annotated_decl as? String else {
				print("Type mismatch for key key.annotated_decl")
				return nil
			}
			guard let kind = dictionary["key.kind"] else {
				print("No value for key key.kind")
				return nil
			}
			guard let typed_kind = kind as? String else {
				print("Type mismatch for key key.kind")
				return nil
			}
			guard let typename = dictionary["key.typename"] else {
				print("No value for key key.typename")
				return nil
			}
			guard let typed_typename = typename as? String else {
				print("Type mismatch for key key.typename")
				return nil
			}
			guard let name = dictionary["key.name"] else {
				print("No value for key key.name")
				return nil
			}
			guard let typed_name = name as? String else {
				print("Type mismatch for key key.name")
				return nil
			}
			
			if let related_decls = dictionary["key.related_decls"],
				let related_decls_array = related_decls as? [[String: String]] {
				self.relatedDeclarations = related_decls_array.compactMap { decl in
					guard let annotatedDeclaration = decl[RelatedDeclaration.CodingKeys.annotatedDeclaration.rawValue] else { return nil }
					return RelatedDeclaration(annotatedDeclaration: annotatedDeclaration) }
			} else {
				self.relatedDeclarations = []
			}
			
			self.fullyAnnotatedDeclaration = dictionary[CodingKeys.fullyAnnotatedDeclaration.rawValue] as? String
			self.typeUSR = typed_typeusr
			self.isSystem = dictionary[CodingKeys.isSystem.rawValue] as? Bool
			self.usr = typed_usr
			self.containerTypeUSR = dictionary[CodingKeys.containerTypeUSR.rawValue] as? String
			self.annotatedDeclaration = typed_annotated_decl
			self.fullDocumentationXML = dictionary[CodingKeys.fullDocumentationXML.rawValue] as? String
			self.groupName = dictionary[CodingKeys.groupName.rawValue] as? String
			self.kind = typed_kind
			self.moduleName = dictionary[CodingKeys.moduleName.rawValue] as? String
			self.typeName = typed_typename
			self.name = typed_name
		}
		
		struct Documentation: Codable, CustomStringConvertible {
			struct Parameter: Codable, CustomStringConvertible {
				var name: String
				var discussion: String?
				
				init?(parsing dictionary: [String: SourceKitRepresentable]) {
					guard let name = dictionary["name"] as? String else {
						return nil
					}
					self.name = name
					
					if let discussion = dictionary["discussion"] as? [[String: String]] {
						self.discussion = joinedDocumentationString(parsing: discussion)
					}
				}
				
				var description: String {
					return ["`\(name)`", discussion].compactMap { $0 }.joined(separator: "\n")
				}
			}
			
			var summary: String?
			var declaration: String?
			var discussion: String?
			var parameters: [Parameter]?
			var returns: String?
			
			init(parsing dictionary: [String: SourceKitRepresentable]) {
				if let summary = dictionary[SwiftDocKey.docAbstract.rawValue] as? [[String: String]] {
					self.summary = joinedDocumentationString(parsing: summary)
				}
				self.declaration = dictionary[SwiftDocKey.docDeclaration.rawValue] as? String
				if let discussion = dictionary[SwiftDocKey.docDiscussion.rawValue] as? [[String: String]] {
					self.discussion = joinedDocumentationString(parsing: discussion)
				}
				
				if let returnDiscussion = dictionary[SwiftDocKey.docResultDiscussion.rawValue] as? [[String: String]] {
					self.returns = joinedDocumentationString(parsing: returnDiscussion)
				}
				
				if let parameters = dictionary[SwiftDocKey.docParameters.rawValue] as? [[String: SourceKitRepresentable]] {
					let params = parameters.compactMap(Parameter.init(parsing:))
					if !params.isEmpty {
						self.parameters = params
					}
				}
			}
			
			var description: String {
				let values: KeyValuePairs<String, CustomStringConvertible?> = [
//					"**Declaration**": declaration,
					"**Summary**": summary,
//					"**Discussion**": discussion,
					"**Parameters**": parameters.flatMap { $0.map { String(describing: $0) }.joined(separator: "\n\n") },
					"**Returns**": returns
					]
				
				return values.compactMap { pair in
					guard let value = pair.value else { return nil }
					return "\(pair.key)\n\n\(value)"
				}.joined(separator: "\n\n")
				
			}
		}
		
		func fullDocumentation() -> Documentation? {
			guard let xmlDocs = self.fullDocumentationXML else { return nil }
			
//			return ["docs": xmlDocs]
			
			guard let parsed = parseFullXMLDocs(xmlDocs) else { return nil }
			
			let documentation = Documentation(parsing: parsed)
			
			return documentation
		}
	}
	
	func cursorInfo(path: String, offset: Int, sdkPath: String) -> CursorInfo? {
		guard !LocalCodeController.shared.isSandboxed else { return nil }
		
		let cursorInfoRequest = Request.cursorInfo(file: path, offset: Int64(offset), arguments: ["-sdk", sdkPath, path])
		
		do {
			let cursorInfoDictionary = try cursorInfoRequest.send()
			return CursorInfo(parsing: cursorInfoDictionary)
		} catch {
			print(error)
			return nil
		}
		
	}
	
	func parse(declaration: String) -> String {
		var declaration = declaration
		
		let tagsMatches = declaration.matches(forRegex: #"<[^>]*>"#)
		for match in tagsMatches.reversed() {
			declaration.replaceSubrange(match.fullMatch.range, with: "")
		}
		declaration = CFXMLCreateStringByUnescapingEntities(nil, declaration as CFString, nil) as String
		
		let attributesMatches = declaration.matches(forRegex: #"@[^\s]+\s+"#)
		for match in attributesMatches.reversed() {
			declaration.replaceSubrange(match.fullMatch.range, with: "")
		}
		
		let doubleUnderscoreMatches = declaration.matches(forRegex: #"\b__\S+\s+"#)
		for match in doubleUnderscoreMatches.reversed() {
			declaration.replaceSubrange(match.fullMatch.range, with: "")
		}
		
		return "\(declaration)"
	}
	
	func highlightedCode(forSource source: String, theme: SyntaxColorTheme) -> NSMutableAttributedString {
		let tokens = getSavannaTokens(input: source)
		
		return NSMutableAttributedString(source: source, tokens: tokens, theme: theme)
	}
	
//	func compilerMessages(for text: String) -> [CompilerMessage] {
//		let file = File(contents: text)
//		guard let diagnostics = SwiftDocs(file: file, arguments: [])?.docsDictionary["key.diagnostics"] as? [SourceKitRepresentable] else { return [] }
//
//
//	}
	
	// MARK: - Code Completion
	
	func complete(source: String, offset: Int, sdkPath: String) -> [CodeCompletionItem] {
		do {
			let file = "\(UUID()).swift"
			let request = Request.codeCompletionRequest(file: file, contents: source, offset: Int64(offset), arguments: ["-c", file, "-sdk", sdkPath])
			var results = try request.send()["key.results"] as? [[String: SourceKitRepresentable]] ?? []
			
			results = results.map {
				guard $0["key.kind"] as? String == SwiftDeclarationKind.keyword.rawValue && $0["key.doc.brief"] == nil, let name = $0["key.name"] as? String else { return $0 }
				var result = $0
				
				result["key.doc.brief"] = { () -> String? in
					switch name {
					case "let":
						return "Creates a variable that cannot be changed."
					case "typealias":
						return "Defines an alternate name for an existing type."
					case "var":
						return "Creates a variable that can be changed."
					case "defer":
						return "Executes a set of statements before execution leaves the current block of code."
					case "for":
						return "Repeats code a given number of times."
					case "guard":
						return "Transfers control out of a scope if one or more conditions are not met."
					case "if":
						return "Changes which path your code takes."
					case "switch":
						return "Chooses a code path based on a value."
					case "while":
						return "Repeats code while condition is true."
					case "return":
						return "Passes back output and exits the current block of code."
					default:
						return nil
					}
				}()
				
				return result
			}
			
			let response = ["key.results": results]
			
			let options: [CodeCompletionItem] = CodeCompletionItem.parse(response: response)
			return options
		} catch {
			print(error)
			return []
		}
	}
	
}


fileprivate func joinedDocumentationString(parsing discussion: [[String: String]]) -> String {
	enum Key: String {
		case paragraph = "Para"
		case codeListing = "CodeListing"
	}
	
	var paragraphs: [String] = []
	
	for section in discussion {
		if let paragraph = section[Key.paragraph.rawValue] {
			paragraphs.append(paragraph)
		} else if let codeListing = section[Key.codeListing.rawValue] {
			paragraphs.append("```\n\(codeListing)\n```")
		} else if let (key, value) = section.first {
			paragraphs.append("\(key): \(value)")
		}
	}
	
	return paragraphs.joined(separator: "\n\n")
}

extension CodeCompletionItem: NCRAutocompletionCandidate {
	public var autocompletionDisplayString: String {
		return self.descriptionKey ?? self.name ?? ""
	}
	
	public var autocompletionInsertionString: String {
		return self.sourcetext ?? ""
	}
	
	public var autocomplationDescriptionString: String? {
		/*
		return """
		Name: \(name ?? "")
		Description: \(descriptionKey ?? "")
		USR: \(self.associatedUSRs ?? "")
		Bytes to erase: \(self.numBytesToErase.flatMap(String.init) ?? "")
		Context: \(context)
		Kind: \(kind)
		ModuleName: \(self.moduleName ?? "")
		DocBrief: \(docBrief ?? "")
		"""
		*/
		return docBrief
	}
	
	public var autocompletionSecondaryDescriptionString: String? {
		guard let typeName = self.typeName, !typeName.isEmpty else { return nil }
		return typeName
	}
	
	public var autocompletionImage: NSImage? {
		guard let kind = SwiftDeclarationKind(rawValue: self.kind) else { return nil }
		switch kind {
		case .struct:
			return #imageLiteral(resourceName: "struct")
		case .class:
			return #imageLiteral(resourceName: "class")
		case .protocol:
			return #imageLiteral(resourceName: "Protocol")
		case .enum:
			return #imageLiteral(resourceName: "enum")
		case .functionConstructor,
			 .functionMethodClass,
			 .functionMethodStatic,
			 .functionMethodInstance,
			 .functionOperator,
			 .functionOperatorInfix,
			 .functionOperatorPrefix,
			 .functionOperatorPostfix:
			return #imageLiteral(resourceName: "method")
		case .functionFree:
			return #imageLiteral(resourceName: "freefunction")
		case .varClass,
			 .varGlobal,
			 .varStatic,
			 .varInstance:
			return #imageLiteral(resourceName: "variable")
		case .varLocal,
			 .varParameter:
		return #imageLiteral(resourceName: "local")
		case .typealias:
			return #imageLiteral(resourceName: "typealias")
		default:
			return nil
		} 
	}
	
}
