//
//  ReturnTypeProtocol.swift
//  Swift Coder
//
//  Created by Josh Birnholz on 11/15/18.
//  Copyright © 2018 Josh Birnholz. All rights reserved.
//

import Foundation

/// A type that can create a String representation of itself, and can also use that String representation to initialize an instance of `Self` that is equal to the original instance.
protocol StringConvertible {
	/// Instantiates an instance of the conforming type from the string
	/// representation.
	init?(_ description: String)
	
	/// A textual representation of this instance that can be used to recreate it.
	var stringRepresentation: String { get }
	func isEqual(to other: StringConvertible) -> Bool
	static var convertibleTypeName: String { get }
	static var convertibleExtensionTypeName: String { get }
	static var runnableTesterParameterTypeName: String { get }
	static var helperCode: String { get }
	static var helperCodeNeedsCoders: Bool { get }
	static var needsCustomStringRepresentation: Bool { get }
	
	/// A string equivalent to the way this instance would be written in code.
	var displayDescription: String { get }
}

extension StringConvertible {
	/// The name of the type as it should appear in parameter types, return types, etc.
	/// By default it's just the name of the type. Provide a custom implementation to
	/// have a type appear as "[Int]" instead of "Array<Int>", for example.
	static var convertibleTypeName: String {
		return String(describing: Self.self)
	}
	
	/// The name of the type as it should appear in an Extension. By default it's the same
	/// as `convertibleTypeName`, but provide a custom implementation to have an extension
	/// on "Array where Element == Int" instead of "[Int]", for example.
	static var convertibleExtensionTypeName: String {
		return convertibleTypeName
	}
	
	static var runnableTesterParameterTypeName: String {
		return convertibleTypeName
	}
	
	static var helperCode: String {
		return ""
	}
	
	static var helperCodeNeedsCoders: Bool {
		return false
	}
	
	static var needsCustomStringRepresentation: Bool {
		return false
	}
	
	var displayDescription: String {
		return String(describing: self)
	}
}

extension StringConvertible where Self: Equatable {
	func isEqual(to other: StringConvertible) -> Bool {
		guard let other = other as? Self else { return false }
		return self == other
	}
}

/// A wrapper over an underlying `StringConvertible & Equatable` instance that hides the specific underlying type.
struct AnyEquatableStringConvertible: Equatable, CustomStringConvertible {
	var description: String {
		return String(describing: value)
	}
	
	var displayDescription: String {
		return value.displayDescription
	}
	
	init(_ value: StringConvertible) { self.value = value }
	
	let value: StringConvertible
	
	static func ==(lhs: AnyEquatableStringConvertible, rhs: AnyEquatableStringConvertible) -> Bool {
		return lhs.value.isEqual(to: rhs.value)
	}
}

// Gives a default value of `stringRepresentation` of `CustomStringConvertible` types to make them `StringConvertible`, while leaving open the option to provide a more specific String representation for different types that may need them.
extension CustomStringConvertible {
	var stringRepresentation: String {
		return description
	}
}

// Free conformances
extension String: StringConvertible {
	var displayDescription: String {
		return "\"\(self)\""
	}
}
extension Substring: StringConvertible {
	var displayDescription: String {
		return "\"\(self)\""
	}
}
extension Character: StringConvertible {
	var displayDescription: String {
		return "\"\(self)\""
	}
}

extension Int: StringConvertible { }
extension UInt: StringConvertible { }
extension Bool: StringConvertible { }
extension Double: StringConvertible { }
extension Float: StringConvertible { }
extension Float80: StringConvertible { }
extension Unicode.Scalar: StringConvertible { } // Why not?

fileprivate let encoder = JSONEncoder()
fileprivate let decoder = JSONDecoder()

extension URL: StringConvertible {
	init?(_ description: String) {
		self = URL(fileURLWithPath: description)
	}
	
//	var stringRepresentation: String {
//		return absoluteString
//	}
	
	static var helperCode: String {
		return """
		extension URL {
			var stringRepresentation: String {
				return path
			}
		}
		
		"""
	}
	
	static var needsCustomStringRepresentation: Bool {
		return true
	}
	
	var displayDescription: String {
		let file = path.replacingOccurrences(of: Bundle.main.bundlePath.appending("/Contents/Resources/"), with: "").replacingOccurrences(of: LocalCodeController.shared.applicationSupportDirectory.path + "/", with: "")
		return file
	}
}

extension Array: StringConvertible where Element: StringConvertible & Codable & Equatable {
	init?(_ description: String) {
		guard let data = description.data(using: .utf8) else { return nil }
		guard let arr = try? decoder.decode([Element].self, from: data) else { return nil }

		self = arr
	}

	var stringRepresentation: String {
		return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
	}
	
	static var helperCode: String {
		return """
		extension Array: LosslessStringConvertible where Element: Codable {
			public init?(_ description: String) {
				guard let data = description.data(using: .utf8) else { return nil }
				guard let arr = try? decoder.decode([Element].self, from: data) else { return nil }
		
				self = arr
			}
			var stringRepresentation: String {
				return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
			}
		}
		
		
		"""
	}
	
	static var helperCodeNeedsCoders: Bool {
		return true
	}
	
	static var needsCustomStringRepresentation: Bool {
		return true
	}
	
	static var convertibleTypeName: String {
		return "[\(Element.convertibleTypeName)]"
	}
	
	static var convertibleExtensionTypeName: String {
		return "Array where Element == \(Element.convertibleTypeName)"
	}
	
	var displayDescription: String {
		return "[\(self.map { $0.displayDescription }.joined(separator: ", "))]"
	}
}

extension Set: StringConvertible where Element: StringConvertible & Codable & Equatable {
	init?(_ description: String) {
		guard let data = description.data(using: .utf8) else { return nil }
		guard let arr = try? decoder.decode(Set<Element>.self, from: data) else { return nil }
		
		self = arr
	}
	
	var stringRepresentation: String {
		return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
	}
	
	static var helperCode: String {
		return """
		extension Set: LosslessStringConvertible where Element: Codable {
			public init?(_ description: String) {
				guard let data = description.data(using: .utf8) else { return nil }
				guard let arr = try? decoder.decode(Set<Element>.self, from: data) else { return nil }
		
				self = arr
			}
			var stringRepresentation: String {
				return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
			}
		}
		
		
		"""
	}
	
	static var helperCodeNeedsCoders: Bool {
		return true
	}
	
	static var needsCustomStringRepresentation: Bool {
		return true
	}
	
	static var convertibleExtensionTypeName: String {
		return "Set where Element == \(Element.convertibleTypeName)"
	}
}

extension Dictionary: StringConvertible where Key: Codable & StringConvertible, Value: Codable & Equatable & StringConvertible {
	init?(_ description: String) {
		guard let data = description.data(using: .utf8) else { return nil }
		guard let arr = try? decoder.decode([Key: Value].self, from: data) else { return nil }

		self = arr
	}

	var stringRepresentation: String {
		return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[:]"
	}
	
	static var helperCode: String {
		return """
		extension Dictionary: LosslessStringConvertible where Key: Codable, Value: Codable & Equatable {
			public init?(_ description: String) {
				guard let data = description.data(using: .utf8) else { return nil }
				guard let arr = try? decoder.decode([Key: Value].self, from: data) else { return nil }
		
				self = arr
			}
			var stringRepresentation: String {
				return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "{}"
			}
		}
		
		
		"""
	}
	
	static var helperCodeNeedsCoders: Bool {
		return true
	}
	
	static var needsCustomStringRepresentation: Bool {
		return true
	}
	
	static var convertibleTypeName: String {
		return "[\(Key.convertibleTypeName) : \(Value.convertibleTypeName)]"
	}
	
	static var convertibleExtensionTypeName: String {
		return "Dictionary where Key == \(Key.convertibleTypeName), Value == \(Value.convertibleTypeName)"
	}
}

protocol StringConvertibleTuple: Equatable, Codable, StringConvertible, CustomStringConvertible {
	var items: [AnyEquatableStringConvertible] { get }
	var labels: [String?] { get }
	static var types: [StringConvertible.Type] { get }
}

extension StringConvertibleTuple  {
	static func ==(lhs: Self, rhs: Self) -> Bool {
		return lhs.items == rhs.items
	}
	
	var stringRepresentation: String {
		return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "()"
	}
	
	var description: String {
		return "(" + zip(items, labels).map { item, label in
			var desc: [String] = []
			if let label = label {
				desc.append(label)
			}
			desc.append(String(describing: item))
			return desc.joined(separator: ": ")
			}.joined(separator: ", ") + ")"
	}
	
	var displayDescription: String {
		return "(\(zip(items, labels).map { "\($1.flatMap { "\($0): " } ?? "")\($0.displayDescription)" }.joined(separator: ", ")))"
	}
	
	static func typeSignature(labels: [String?]) -> String {
		return "(" + zip(types, labels).map { type, label in
			var desc: [String] = []
			if let label = label {
				desc.append(label)
			}
			desc.append(type.convertibleTypeName)
			return desc.joined(separator: ": ")
			}.joined(separator: ", ") + ")"
	}
	
	var typeSignature: String {
		return Self.typeSignature(labels: labels)
	}
	
	static var convertibleTypeName: String {
		return typeSignature(labels: [String?](repeating: nil, count: types.count))
	}
}

struct StringConvertibleTwoElementTuple<Type0: StringConvertible & Codable, Type1: StringConvertible & Codable>: StringConvertibleTuple {
	var item0: Type0
	var item1: Type1
	
	var label0: String?
	var label1: String?
	
	var items: [AnyEquatableStringConvertible] {
		return [item0, item1].map(AnyEquatableStringConvertible.init)
	}
	var labels: [String?] {
		return [label0, label1]
	}
	static var types: [StringConvertible.Type] {
		return [Type0.self, Type1.self]
	}
	
	init(_ a: (item: Type0, label: String?), _ b: (item: Type1, label: String?)) {
		item0 = a.item
		label0 = a.label
		
		item1 = b.item
		label1 = b.label
	}
	
	init?(_ description: String) {
		guard let data = description.data(using: .utf8) else { return nil }
		guard let arr = try? decoder.decode(StringConvertibleTwoElementTuple<Type0, Type1>.self, from: data) else { return nil }
		
		self = arr
	}
	
	static var helperCodeNeedsCoders: Bool {
		return true
	}
	
	static var helperCode: String {
		return """
		struct StringConvertibleTwoElementTuple<Type0: Codable, Type1: Codable>: Codable, LosslessStringConvertible {
			var item0: Type0
			var item1: Type1
		
			var label0: String?
			var label1: String?
		
			init(_ tuple: (Type0, Type1)) {
				item0 = tuple.0
				item1 = tuple.1
			}
		
			public init?(_ description: String) {
				guard let data = description.data(using: .utf8) else { return nil }
				guard let tuple = try? decoder.decode(StringConvertibleTwoElementTuple<Type0, Type1>.self, from: data) else { return nil }
		
				self = tuple
			}
		
			var stringRepresentation: String {
				return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "{item0: null, item1: null}"
			}
		
			public var description: String {
				return ""
			}
		}
		
		"""
	}
	
	static var needsCustomStringRepresentation: Bool {
		return true
	}
	
}

struct StringConvertibleVoid: Equatable, StringConvertible, CustomStringConvertible {
	init() { }
	
	static var convertibleTypeName: String {
		return "Void"
	}
	
	init?(_ description: String) {
		if description == "()" {
			self = StringConvertibleVoid()
		} else {
			return nil
		}
	}
	
	var stringRepresentation: String {
		return "()"
	}
	
	var description: String {
		return "()"
	}
	
}

extension Optional: StringConvertible where Wrapped: StringConvertible & Equatable {
	
	private struct OptionalHelper: Codable {
		var stringRepresentation: String?
	}
	
	init?(_ description: String) {
		if description == "nil" {
			self = .none
			return
		}
		
		guard let data = description.data(using: .utf8),
			let helper = try? decoder.decode(OptionalHelper.self, from: data) else {
				return nil
		}
		
		if let stringRepresentation = helper.stringRepresentation {
			guard let value = Wrapped.init(stringRepresentation) else { return nil }
			self = .some(value)
		} else {
			self = .none
		}
	}
	
	var stringRepresentation: String {
		let helper: OptionalHelper?
		
		switch self {
		case .none:
			helper = OptionalHelper(stringRepresentation: nil)
		case .some(let wrapped):
			helper = OptionalHelper(stringRepresentation: wrapped.stringRepresentation)
		}
		
		guard let data = try? encoder.encode(helper) else { return "" }
		
		return String(data: data, encoding: .utf8) ?? ""
	}
	
	static var convertibleTypeName: String {
		return Wrapped.convertibleTypeName + "?"
	}
	
	var displayDescription: String {
		switch self {
		case .none:
			return "nil"
		case .some(let wrapped):
			return wrapped.displayDescription
		}
	}
	
	static var helperCode: String {
		return """
			extension Optional: LosslessStringConvertible, CustomStringConvertible where Wrapped == \(Wrapped.convertibleTypeName) {
			
			private struct OptionalHelper: Codable {
				var stringRepresentation: String?
			}
			
			public init?(_ description: String) {
				guard let data = description.data(using: .utf8),
					let helper = try? decoder.decode(OptionalHelper.self, from: data) else {
					return nil
				}
			
				if let stringRepresentation = helper.stringRepresentation {
					\(Wrapped.self == String.self ? "self = .some(stringRepresentation)" : "guard let value = Wrapped.init(stringRepresentation) else { return nil }\n\t\t\t\t\tself = .some(value)")
				} else {
					self = .none
				}
			
			}
			
			var stringRepresentation: String {
				let helper: OptionalHelper?
			
				switch self {
				case .none:
					helper = OptionalHelper(stringRepresentation: nil)
				case .some(let wrapped):
					helper = OptionalHelper(stringRepresentation: wrapped.\(Wrapped.needsCustomStringRepresentation ? "stringRepresentation" : "description"))
				}
			
				guard let data = try? encoder.encode(helper) else { return "" }
			
				return String(data: data, encoding: .utf8) ?? ""
			}
			
			public var description: String {
			return String(describing: self)
			}
			}
			
			""" + Wrapped.helperCode
	}
	
	static var convertibleExtensionTypeName: String {
		return "Optional where Wrapped == \(Wrapped.convertibleTypeName)"
	}
	
	static var needsCustomStringRepresentation: Bool {
		return true
	}
	
	static var helperCodeNeedsCoders: Bool {
		return true
	}
	
}


extension ClosedRange: StringConvertible where Bound: Codable & Strideable & StringConvertible {
	init?(_ description: String) {
		guard let data = description.data(using: .utf8) else { return nil }
		guard let range = try? decoder.decode(ClosedRange<Bound>.self, from: data) else { return nil }
		
		self = range
	}
	
	var stringRepresentation: String {
		return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
	}
	
	static var helperCode: String {
		return """
		#if swift(>=5.0)
		#else
		extension ClosedRange: Decodable where Bound: Decodable {
				public init(from decoder: Decoder) throws {
					var container = try decoder.unkeyedContainer()
					let lowerBound = try container.decode(Bound.self)
					let upperBound = try container.decode(Bound.self)
					guard lowerBound <= upperBound else {
						throw DecodingError.dataCorrupted(
							DecodingError.Context(
								codingPath: decoder.codingPath,
								debugDescription: "Cannot initialize \\(ClosedRange.self) with a lowerBound (\\(lowerBound)) greater than upperBound (\\(upperBound))"))
					}
					self.init(uncheckedBounds: (lower: lowerBound, upper: upperBound))
				}
		}

		extension ClosedRange: Encodable where Bound: Encodable {
			public func encode(to encoder: Encoder) throws {
				var container = encoder.unkeyedContainer()
				try container.encode(self.lowerBound)
				try container.encode(self.upperBound)
			}
		}
		#endif
		
		extension ClosedRange: LosslessStringConvertible where Bound: Codable & Strideable {

			public init?(_ description: String) {
				guard let data = description.data(using: .utf8) else { return nil }
				guard let range = try? decoder.decode(ClosedRange<Bound>.self, from: data) else { return nil }
		
				self = range
			}
		
			var stringRepresentation: String {
				return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
			}
		}
		
		
		"""
	}
	
	static var helperCodeNeedsCoders: Bool {
		return true
	}
	
	static var needsCustomStringRepresentation: Bool {
		return true
	}
	
	static var convertibleTypeName: String {
		return "ClosedRange<\(Bound.convertibleTypeName)>"
	}
	
	static var convertibleExtensionTypeName: String {
		return "CountableClosedRange where Bound == \(Bound.convertibleTypeName)"
	}
	
}
