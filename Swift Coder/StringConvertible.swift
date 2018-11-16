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
	func isEqualTo(_ other: StringConvertible) -> Bool
	func asEquatable() -> AnyEquatableStringConvertible
}

extension StringConvertible where Self: Equatable {
	func isEqualTo(_ other: StringConvertible) -> Bool {
		guard let other = other as? Self else { return false }
		return self == other
	}
	func asEquatable() -> AnyEquatableStringConvertible {
		return AnyEquatableStringConvertible(self)
	}
}

// Gives a default value of `stringRepresentation` of `CustomStringConvertible` types to make them `StringConvertible`, while leaving open the option to provide a more specific String representation for different types that may need them.
extension CustomStringConvertible {
	var stringRepresentation: String {
		return description
	}
}

// Supported return types
extension String: StringConvertible { }
extension Substring: StringConvertible { }
extension Character: StringConvertible { }
extension Int: StringConvertible { }
extension Bool: StringConvertible { }
extension Double: StringConvertible { }
extension Float: StringConvertible { }
extension Float80: StringConvertible { }
extension Unicode.Scalar: StringConvertible { } // Why not?

fileprivate let encoder = JSONEncoder()
fileprivate let decoder = JSONDecoder()

extension Array: StringConvertible where Element: Codable & Equatable {
	init?(_ description: String) {
		guard let data = description.data(using: .utf8) else { return nil }
		guard let arr = try? decoder.decode([Element].self, from: data) else { return nil }
		
		self = arr
	}
	
	var stringRepresentation: String {
		return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[]"
	}
}

extension Dictionary: StringConvertible where Key: Codable, Value: Codable & Equatable {
	init?(_ description: String) {
		guard let data = description.data(using: .utf8) else { return nil }
		guard let arr = try? decoder.decode([Key: Value].self, from: data) else { return nil }
		
		self = arr
	}
	
	var stringRepresentation: String {
		return (try? encoder.encode(self)).flatMap { String(data: $0, encoding: .utf8) } ?? "[:]"
	}
	
}

/// A wrapper over an underlying `StringConvertible & Equatable` instance that hides the specific underlying type.
struct AnyEquatableStringConvertible: Equatable, CustomStringConvertible {
	var description: String {
		return String(describing: value)
	}
	
	init(_ value: StringConvertible) { self.value = value }
	private let value: StringConvertible
	static func ==(lhs: AnyEquatableStringConvertible, rhs: AnyEquatableStringConvertible) -> Bool {
		return lhs.value.isEqualTo(rhs.value)
	}
}
