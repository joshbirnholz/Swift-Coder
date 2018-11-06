import Foundation

extension String {
	
	/// Modifies a `String` and removes any non-numeric characters from a String.
	mutating func numericize() {
		let digits: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
		var textWithOnlyDigits = ""
		for character in self {
			if digits.contains(character) {
				textWithOnlyDigits = textWithOnlyDigits + String(character)
			}
		}
		self = textWithOnlyDigits
	}
	
	/// Returns a new `String` by removing any non-numeric characters from a String.
	func stringByNumericizing() -> String {
		let digits: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
		var textWithOnlyDigits = ""
		for character in self {
			if digits.contains(character) {
				textWithOnlyDigits = textWithOnlyDigits + String(character)
			}
		}
		return textWithOnlyDigits
	}
	
	/**
	Modifies a `String` to replace any instances of a certain `Character` with a `String` of any length.
	- parameter target: The original `Character` to be replaced.
	- parameter replacement: The `String` with which to replace the original`Character`.
	*/
	mutating func replaceOccurrences(of target: String, with replacement: String) {
		self = self.replacingOccurrences(of: target, with: replacement)
	}
	
	/**
	Removes all occurrances of a target `String` from a `String`.
	- parameter target: The `String` to be stripped out.
	*/
	mutating func stripInPlace(target: String) {
		self.replaceOccurrences(of: target, with: "")
	}
	
	
	/**
	Returns a new string made by appending to the receiver a given string.
	- Available in iOS 8.0 and later.
	- parameter aString: The path component to append to the receiver.
	- returns: A new string made by appending aString to the receiver, preceded if necessary by a path separator.
	*/
	func stringByAppendingPathComponent(aString: String) -> String {
		
		let nsStr = self as NSString
		
		return nsStr.appendingPathComponent(aString)
	}
	
	/**
	Returns a new string that is a substring of this string for the indexes specified by a Range.
	
	Examples:
	
	"hamburger"[4..<8] == "urge"
	"smiles"[1...5] == "miles"
	
	- parameter range: The range of `Character`s to include in the substring.
	- returns: The specified substring.
	*/
	subscript (range: Range<Int>) -> String {
		get {
//			let startIndex = self.startIndex.advanced(by: range.startIndex)
			let startIndex = self.index(self.startIndex, offsetBy: range.startIndex)
//			let endIndex = startIndex.advancedBy(range.endIndex - range.startIndex)
			let endIndex = self.index(self.startIndex, offsetBy: range.endIndex - range.startIndex)
			
			return String(self[startIndex ..< endIndex])
		}
	}
	
	/**
	Returns a new string that is a substring of this string. The substring begins with the character at the specified index and extends to the end of this string.
	
	Examples:
	
	"unhappy"[2] == "happy"
	"Harbison"[3] == "bison"
	"emptiness"[9] == ""
	
	- parameter beginIndex: The beginning index, inclusive.
	- returns: The specified substring.
	*/
//	subscript (fromIndex: Int) -> String {
//		get {
//			return self[Range(self.startIndex.advancedBy(fromIndex) ..< self.endIndex)]
//		}
//	}
	
	/**
	Returns the `Character` value at the specified index.
	- parameter index: The index of the `Character` value.
	- returns: The `Character` value at the specified index of this string. The first char value is at index 0.
	*/
	func character(at index: Int) -> Character {
		return self[self.index(startIndex, offsetBy: index)]
	}
}

func - (lhs: String, rhs: String) -> String {
	
	return lhs.replacingOccurrences(of: rhs, with: "")
	
}

typealias Match = (range: Range<String.Index>, value: String)

extension String {
	
	func matches(forRegex regex: String) -> [(fullMatch: Match, groups: [Match])] {
		do {
			let regex = try NSRegularExpression(pattern: regex)
			let results = regex.matches(in: self, range: NSRange(startIndex..., in: self))
			return results.map { result in
				let fullMatchRange = Range(result.range, in: self)!
				let groups: [Match]
				
				if result.numberOfRanges > 1 {
					groups = (1 ..< result.numberOfRanges).compactMap { i in
						guard let range = Range(result.range(at: i), in: self) else {
							return nil
						}
						let value = String(self[range])
						return (range: range, value: value)
					}
				} else {
					groups = []
				}
				
				let fullMatch = (range: fullMatchRange, value: String(self[fullMatchRange]))
				
				return (fullMatch, groups)
			}
		} catch {
			return []
		}
	}
	
}

extension Array: LosslessStringConvertible where Element: LosslessStringConvertible {
	public init?(_ description: String) {
		if let arr = description.matches(forRegex: "\\[(.*)]").first?.groups.first?.value.split(separator: ",").compactMap({
			Element($0.trimmingCharacters(in: .whitespacesAndNewlines))}) {
			if Element.self == String.self {
				self = (arr as! [String]).map {
					String($0[$0.index(after: $0.startIndex)..<$0.index(before: $0.endIndex)])
					} as! [Element]
			} else {
				self = arr
			}
		} else {
			return nil
		}
	}
}
