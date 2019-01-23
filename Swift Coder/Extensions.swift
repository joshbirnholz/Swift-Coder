import Foundation

typealias Match = (range: Range<String.Index>, value: String)

extension String {
	
	func matches(forRegex regex: String, options: NSRegularExpression.Options = []) -> [(fullMatch: Match, groups: [Match])] {
		do {
			let regex = try NSRegularExpression(pattern: regex, options: options)
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

extension StringProtocol {
	/// Shouldn't work if `open` == `close`
	func character(atIndex i: Index, isContainedWithin open: Character, and close: Character) -> Bool {
		let pre = self[startIndex ..< i]
		let post = self[i...]
		
		let precededByOpenBeforeClosed: Bool = {
			guard let lastOpenIndex = pre.lastIndex(of: open) else { return false }
			if let lastClosedIndex = pre.lastIndex(of: close) {
				return lastOpenIndex > lastClosedIndex
			}
			return true
		}()
		
		let followedByClosedBeforeOpen: Bool = {
			guard let firstClosedIndex = post.firstIndex(of: close) else { return false }
			if let firstOpenIndex = post.firstIndex(of: open) {
				return firstClosedIndex < firstOpenIndex
			}
			return true
		}()
		
		return precededByOpenBeforeClosed && followedByClosedBeforeOpen
	}
}

extension Array {
	func duplicated(times: Int) -> [Element] {
		guard times > 0 else { return [] }
		guard times > 1 else { return self }
		var arr = [Element]()
		for _ in 0 ..< times {
			arr.append(contentsOf: self)
		}
		return arr
	}
}

extension Array {
	public subscript (safe index: Index) -> Element? {
		return indices.contains(index) ? self[index] : nil
	}
	
	public func chunked(by chunkSize: Int) -> [[Element]] {
		guard !isEmpty else { return [] }
		return stride(from: 0, to: self.count, by: chunkSize).map {
			Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
		}
	}
}
