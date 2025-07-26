//
//  CustomValidator.swift
//  ValidatorUtility
//
//  Created by Tahir Anil Oghan on 25.07.2025.
//

import Foundation

// MARK: - Protocol
/// A comprehensive validation protocol that combines number, text, and regex-based validators.
public protocol ExtensiveValidator: ExtensiveNumberValidator, ExtensiveTextValidator, ExtensiveRegexValidator { }

/// Defines numeric validation rules for both `Int` and `Double` types, including checks for
/// sign, parity, primality, zero, range boundaries, and whole number status.
///
/// - Note: All `Double`-based parity or prime functions assume the value is whole.
public protocol ExtensiveNumberValidator {
    
    /// Checks whether the given integer is positive.
    /// - Parameters:
    ///   - num: The integer to check.
    func isPositive(_ num: Int) -> Bool
    
    /// Checks whether the given integer is negative.
    /// - Parameters:
    ///   - num: The integer to check.
    func isNegative(_ num: Int) -> Bool
    
    /// Checks whether the given integer is odd.
    /// - Parameters:
    ///   - num: The integer to check.
    func isOdd(_ num: Int) -> Bool
    
    /// Checks whether the given integer is even.
    /// - Parameters:
    ///   - num: The integer to check.
    func isEven(_ num: Int) -> Bool
    
    /// Checks whether the given integer is a prime number.
    /// - Parameters:
    ///   - num: The integer to check.
    func isPrime(_ num: Int) -> Bool
    
    /// Checks whether the given integer is zero.
    /// - Parameters:
    ///   - num: The integer to check.
    func isZero(_ num: Int) -> Bool
    
    /// Checks whether the given integer falls within the specified range (inclusive).
    /// - Parameters:
    ///   - num: The integer to check.
    ///   - min: The lower bound of the range.
    ///   - max: The upper bound of the range.
    func isInRange(_ num: Int, min: Int, max: Int) -> Bool
    
    /// Checks whether all integers in the array are positive.
    /// - Parameters:
    ///   - nums: The array of integers to check.
    func allPositive(_ nums: [Int]) -> Bool
    
    /// Checks whether all integers in the array are negative.
    /// - Parameters:
    ///   - nums: The array of integers to check.
    func allNegative(_ nums: [Int]) -> Bool
    
    /// Checks whether all integers in the array are odd.
    /// - Parameters:
    ///   - nums: The array of integers to check.
    func allOdd(_ nums: [Int]) -> Bool
    
    /// Checks whether all integers in the array are even.
    /// - Parameters:
    ///   - nums: The array of integers to check.
    func allEven(_ nums: [Int]) -> Bool
    
    /// Checks whether all integers in the array are prime.
    /// - Parameters:
    ///   - nums: The array of integers to check.
    func allPrime(_ nums: [Int]) -> Bool
    
    /// Checks whether all integers in the array are zero.
    /// - Parameters:
    ///   - nums: The array of integers to check.
    func allZero(_ nums: [Int]) -> Bool
    
    /// Checks whether all integers in the array fall within the specified range (inclusive).
    /// - Parameters:
    ///   - nums: The array of integers to check.
    ///   - min: The lower bound of the range.
    ///   - max: The upper bound of the range.
    func allInRange(_ nums: [Int], min: Int, max: Int) -> Bool
    
    /// Checks whether the given double is positive.
    /// - Parameters:
    ///   - num: The double to check.
    func isPositive(_ num: Double) -> Bool
    
    /// Checks whether the given double is negative.
    /// - Parameters:
    ///   - num: The double to check.
    func isNegative(_ num: Double) -> Bool
    
    /// Checks whether the given double is odd (only if it is a whole number).
    /// - Parameters:
    ///   - num: The double to check.
    func isOdd(_ num: Double) -> Bool
    
    /// Checks whether the given double is even (only if it is a whole number).
    /// - Parameters:
    ///   - num: The double to check.
    func isEven(_ num: Double) -> Bool
    
    /// Checks whether the given double is a prime number (only if it is a whole number).
    /// - Parameters:
    ///   - num: The double to check.
    func isPrime(_ num: Double) -> Bool
    
    /// Checks whether the given double is exactly zero.
    /// - Parameters:
    ///   - num: The double to check.
    func isZero(_ num: Double) -> Bool
    
    /// Checks whether the given double is a whole number.
    /// - Parameters:
    ///   - num: The double to check.
    func isWhole(_ num: Double) -> Bool
    
    /// Checks whether the given double falls within the specified range (inclusive).
    /// - Parameters:
    ///   - num: The double to check.
    ///   - min: The lower bound of the range.
    ///   - max: The upper bound of the range.
    func isInRange(_ num: Double, min: Double, max: Double) -> Bool
    
    /// Checks whether all doubles in the array are positive.
    /// - Parameters:
    ///   - nums: The array of doubles to check.
    func allPositive(_ nums: [Double]) -> Bool
    
    /// Checks whether all doubles in the array are negative.
    /// - Parameters:
    ///   - nums: The array of doubles to check.
    func allNegative(_ nums: [Double]) -> Bool
    
    /// Checks whether all doubles in the array are odd (only if all are whole numbers).
    /// - Parameters:
    ///   - nums: The array of doubles to check.
    func allOdd(_ nums: [Double]) -> Bool
    
    /// Checks whether all doubles in the array are even (only if all are whole numbers).
    /// - Parameters:
    ///   - nums: The array of doubles to check.
    func allEven(_ nums: [Double]) -> Bool
    
    /// Checks whether all doubles in the array are prime (only if all are whole numbers).
    /// - Parameters:
    ///   - nums: The array of doubles to check.
    func allPrime(_ nums: [Double]) -> Bool
    
    /// Checks whether all doubles in the array are zero.
    /// - Parameters:
    ///   - nums: The array of doubles to check.
    func allZero(_ nums: [Double]) -> Bool
    
    /// Checks whether all doubles in the array are whole numbers.
    /// - Parameters:
    ///   - nums: The array of doubles to check.
    func allWhole(_ nums: [Double]) -> Bool
    
    /// Checks whether all doubles in the array fall within the specified range (inclusive).
    /// - Parameters:
    ///   - nums: The array of doubles to check.
    ///   - min: The lower bound of the range.
    ///   - max: The upper bound of the range.
    func allInRange(_ nums: [Double], min: Double, max: Double) -> Bool
}

/// Defines validation rules for string-based values, including checks for casing, alphabetic characters,
/// numeric content, symbols, emojis, whitespace, and alphanumeric structures.
///
/// - Note: Emoji and symbol detection is based on Unicode scalar properties.
public protocol ExtensiveTextValidator {
    
    /// Checks whether the text is not empty (optionally trims whitespace).
    /// - Parameters:
    ///   - text: The input string to check.
    ///   - trimWhitespace: Whether to trim whitespace before validation.
    func isNonEmpty(_ text: String, trimWhitespace: Bool) -> Bool
    
    /// Checks whether the text contains only lowercase characters.
    /// - Parameters:
    ///   - text: The input string to check.
    func isLowercased(_ text: String) -> Bool

    /// Checks whether the text contains only uppercase characters.
    /// - Parameters:
    ///   - text: The input string to check.
    func isUppercased(_ text: String) -> Bool

    /// Checks whether the text contains only alphabetic characters (A–Z or a–z).
    /// - Parameters:
    ///   - text: The input string to check.
    func onlyAlphabet(_ text: String) -> Bool

    /// Checks whether the text contains only symbol characters (e.g., `@`, `#`, `$`).
    /// - Parameters:
    ///   - text: The input string to check.
    func onlySymbol(_ text: String) -> Bool

    /// Checks whether the text contains only emoji characters.
    /// - Parameters:
    ///   - text: The input string to check.
    func onlyEmoji(_ text: String) -> Bool
    
    /// Checks whether the text contains only numeric characters.
    /// - Parameters:
    ///   - text: The input string to check.
    func onlyNumber(_ text: String) -> Bool
    
    /// Checks whether the text contains only alphanumeric characters (A–Z, a–z, 0–9).
    /// - Parameters:
    ///   - text: The input string to check.
    func onlyAlphanumeric(_ text: String) -> Bool
    
    /// Checks whether the text contains any whitespace characters.
    /// - Parameters:
    ///   - text: The input string to check.
    func containsWhitespace(_ text: String) -> Bool
}

/// Provides flexible validation logic using either raw regular expressions or pre-defined structured patterns.
public protocol ExtensiveRegexValidator {
    
    /// Checks whether the text matches a given regular expression pattern.
    /// - Parameters:
    ///   - text: The input string to check.
    ///   - pattern: The regex pattern to match.
    func matchesRegex(_ text: String, pattern: String) -> Bool
    
    /// Checks whether the text matches a given pre-defined pattern.
    /// - Parameters:
    ///   - text: The input string to check.
    ///   - pattern: The pre-defined pattern to match.
    func matchesPattern(_ text: String, pattern: ExtensiveRegexValidatorPattern) -> Bool
}

// MARK: - Helpers
/// A set of pre-defined, reusable validation rules for structured or formatted string inputs.
/// Add more to this enum for the needs of the application.
public enum ExtensiveRegexValidatorPattern {
    
    /// Matches a valid email address (simplified RFC 5322).
    case email
    
    /// Matches a password with configurable minimum length and optional rules for character requirements.
    case password(
        minLength: Int = 8,
        requiresUppercase: Bool = false,
        requiresNumber: Bool = false,
        requiresSymbol: Bool = false
    )
    
    internal var regex: String {
        switch self {
            case .email:
                return "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
                
            case .password(let minLength, let requiresUppercase, let requiresNumber, let requiresSymbol):
                var parts: [String] = []
                if requiresUppercase { parts.append("(?=.*?[A-Z])") }
                if requiresNumber { parts.append("(?=.*?[0-9])") }
                if requiresSymbol { parts.append("(?=.*?[!@#$%^&*_\\-+=.,?:])") }
                return "^(?!.*\\s)(?=.*?[a-z])" + parts.joined() + ".{\(minLength),}$"
        }
    }
}

// MARK: - Implementation
internal final class CustomValidator {
    
    /// Singleton instance.
    internal static let shared: CustomValidator = CustomValidator()
    
    /// Secured initializer to enforce `.shared` usage.
    private init() { }
}

// MARK: - Protocol Conformance
extension CustomValidator: ExtensiveValidator {

    // MARK: - ExtensiveNumberValidator

    internal func isPositive(_ num: Int) -> Bool {
        num > 0
    }

    internal func isNegative(_ num: Int) -> Bool {
        num < 0
    }

    internal func isOdd(_ num: Int) -> Bool {
        num % 2 != 0
    }

    internal func isEven(_ num: Int) -> Bool {
        num % 2 == 0
    }

    internal func isPrime(_ num: Int) -> Bool {
        if num < 2 { return false }
        if num == 2 || num == 3 { return true }
        if num % 2 == 0 || num % 3 == 0 { return false }

        let limit = Int(Double(num).squareRoot())
        for i in stride(from: 5, through: limit, by: 6) {
            if num % i == 0 || num % (i + 2) == 0 {
                return false
            }
        }
        return true
    }

    internal func isZero(_ num: Int) -> Bool {
        num == 0
    }

    internal func isInRange(_ num: Int, min: Int, max: Int) -> Bool {
        num >= min && num <= max
    }

    internal func allPositive(_ nums: [Int]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isPositive($0) }
    }

    internal func allNegative(_ nums: [Int]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isNegative($0) }
    }

    internal func allOdd(_ nums: [Int]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isOdd($0) }
    }

    internal func allEven(_ nums: [Int]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isEven($0) }
    }

    internal func allPrime(_ nums: [Int]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isPrime($0) }
    }

    internal func allZero(_ nums: [Int]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isZero($0) }
    }

    internal func allInRange(_ nums: [Int], min: Int, max: Int) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isInRange($0, min: min, max: max) }
    }

    internal func isPositive(_ num: Double) -> Bool {
        num > 0
    }

    internal func isNegative(_ num: Double) -> Bool {
        num < 0
    }

    internal func isOdd(_ num: Double) -> Bool {
        num.truncatingRemainder(dividingBy: 1) == 0 && Int(num) % 2 != 0
    }

    internal func isEven(_ num: Double) -> Bool {
        num.truncatingRemainder(dividingBy: 1) == 0 && Int(num) % 2 == 0
    }

    internal func isPrime(_ num: Double) -> Bool {
        num.truncatingRemainder(dividingBy: 1) == 0 && isPrime(Int(num))
    }

    internal func isZero(_ num: Double) -> Bool {
        num == 0.0
    }

    internal func isWhole(_ num: Double) -> Bool {
        num.truncatingRemainder(dividingBy: 1) == 0
    }

    internal func isInRange(_ num: Double, min: Double, max: Double) -> Bool {
        num >= min && num <= max
    }

    internal func allPositive(_ nums: [Double]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isPositive($0) }
    }

    internal func allNegative(_ nums: [Double]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isNegative($0) }
    }

    internal func allOdd(_ nums: [Double]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isOdd($0) }
    }

    internal func allEven(_ nums: [Double]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isEven($0) }
    }

    internal func allPrime(_ nums: [Double]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isPrime($0) }
    }

    internal func allZero(_ nums: [Double]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isZero($0) }
    }

    internal func allWhole(_ nums: [Double]) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isWhole($0) }
    }

    internal func allInRange(_ nums: [Double], min: Double, max: Double) -> Bool {
        if nums.isEmpty { return false }
        return nums.allSatisfy { isInRange($0, min: min, max: max) }
    }

    // MARK: - ExtensiveTextValidator

    internal func isNonEmpty(_ text: String, trimWhitespace: Bool) -> Bool {
        trimWhitespace ? !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty : !text.isEmpty
    }

    internal func isLowercased(_ text: String) -> Bool {
        let scalars = text.unicodeScalars
        let letters = scalars.filter { CharacterSet.letters.contains($0) }
        if letters.isEmpty { return false }
        return letters.allSatisfy { Character(String($0)).isLowercase }
    }

    internal func isUppercased(_ text: String) -> Bool {
        let scalars = text.unicodeScalars
        let letters = scalars.filter { CharacterSet.letters.contains($0) }
        if letters.isEmpty { return false }
        return letters.allSatisfy { Character(String($0)).isUppercase }
    }

    internal func onlyAlphabet(_ text: String) -> Bool {
        let charset = CharacterSet.letters
        return !text.isEmpty && text.unicodeScalars.allSatisfy { charset.contains($0) }
    }

    internal func onlySymbol(_ text: String) -> Bool {
        let charset = CharacterSet.symbols.union(.punctuationCharacters)
        return !text.isEmpty && text.unicodeScalars.allSatisfy {
            charset.contains($0) && !$0.properties.isEmojiPresentation
        }
    }

    internal func onlyEmoji(_ text: String) -> Bool {
        return !text.isEmpty && text.allSatisfy { char in
            char.unicodeScalars.contains { $0.properties.isEmojiPresentation }
        }
    }

    internal func onlyNumber(_ text: String) -> Bool {
        let charset = CharacterSet.decimalDigits
        return !text.isEmpty && text.unicodeScalars.allSatisfy { charset.contains($0) }
    }

    internal func onlyAlphanumeric(_ text: String) -> Bool {
        let charset = CharacterSet.alphanumerics
        return !text.isEmpty && text.unicodeScalars.allSatisfy { charset.contains($0) }
    }

    internal func containsWhitespace(_ text: String) -> Bool {
        text.rangeOfCharacter(from: .whitespacesAndNewlines) != nil
    }

    // MARK: - ExtensiveRegexValidator

    internal func matchesRegex(_ text: String, pattern: String) -> Bool {
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: text.utf16.count)
        return regex?.firstMatch(in: text, options: [], range: range) != nil
    }

    internal func matchesPattern(_ text: String, pattern: ExtensiveRegexValidatorPattern) -> Bool {
        return matchesRegex(text, pattern: pattern.regex)
    }
}

// MARK: - Factory Initializer
#if DEBUG
extension CustomValidator {
    
    /// Returns a new, isolated instance of `CustomValidator` for testing purposes.
    ///
    /// - Returns: A fresh `CustomValidator` instance, separate from the shared singleton.
    ///
    /// Use this method in tests to access mocked print output.
    internal static func mock() -> CustomValidator {
        CustomValidator()
    }
}
#endif
