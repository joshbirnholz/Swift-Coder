//
//  CompilerMessage.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/13/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

struct CompilerMessage: CustomStringConvertible {
	enum MessageType: String {
		case error, warning, note
	}
	
	var file: String
	var line: Int
	var character: Int
	var messageType: MessageType
	var message: String
	var helpText: String
	
	/// A textual representation of the compiler message, in the same format as output by the Swift compiler.
	///
	/// Example:
	///
	///     notReplace.swift:2:9: error: cannot convert return expression of type 'Int' to return type 'String'
	///             return 12
	///                    ^~
	var description: String {
		return "\(file):\(line):\(character): \(messageType): \(message)\n\(helpText)"
	}
}
