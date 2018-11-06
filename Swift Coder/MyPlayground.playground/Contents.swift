import Foundation

func print(_ items: Any..., separator: String = "", terminator: String = "") {
	
}

typealias RegexMatch = (range: Range<String.Index>, value: String)

extension String {
	
	func matches(forRegex regex: String) -> [(fullMatch: RegexMatch, groups: [RegexMatch])] {
		do {
			let regex = try NSRegularExpression(pattern: regex)
			let results = regex.matches(in: self, range: NSRange(startIndex..., in: self))
			return results.map { result in
				let fullMatchRange = Range(result.range, in: self)!
				let groups: [RegexMatch]
				
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

func scoreUp(key: [String], answers: [String]) -> Int {
	var score = 0
	
	for (i, answer) in answers.enumerated() {
		switch answer {
		case "?": break
		case key[i]: score += 4
		default: score -= 1
		}
	}
	
	return score
}


let x = [Int]([1, 2, 3, 4].description)!

for i in x {
	print(i)
}
