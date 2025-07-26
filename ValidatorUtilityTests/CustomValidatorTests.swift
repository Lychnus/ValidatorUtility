//
//  CustomValidatorTests.swift
//  ValidatorUtilityTests
//
//  Created by Tahir Anil Oghan on 25.07.2025.
//

import Testing
@testable import ValidatorUtility

@Suite("CustomValidatorTests")
struct CustomValidatorTests {
    
    // MARK: ExtensiveRegexValidatorPattern Tests
    
    @Test("ExtensiveRegexValidatorPattern returns correct regexes.")
    func testExtensiveRegexValidatorPattern() {
       
        #expect(ExtensiveRegexValidatorPattern.email.regex == "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")
        
        #expect(ExtensiveRegexValidatorPattern.password(
            minLength: 8
        ).regex == "^(?!.*\\s)(?=.*?[a-z]).{8,}$")
        
        #expect(ExtensiveRegexValidatorPattern.password(
            minLength: 8,
            requiresUppercase: true
        ).regex == "^(?!.*\\s)(?=.*?[a-z])(?=.*?[A-Z]).{8,}$")
        
        #expect(ExtensiveRegexValidatorPattern.password(
            minLength: 8,
            requiresUppercase: true,
            requiresNumber: true
        ).regex == "^(?!.*\\s)(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{8,}$")
        
        #expect(ExtensiveRegexValidatorPattern.password(
            minLength: 8,
            requiresUppercase: true,
            requiresNumber: true,
            requiresSymbol: true
        ).regex == "^(?!.*\\s)(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*_\\-+=.,?:]).{8,}$")
    }
    
    // MARK: - CustomValidator Tests
    
    @Test("Positive integer validation")
    func testIsPositiveInt() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isPositive(1))
        #expect(validator.isPositive(5))
        #expect(validator.isPositive(Int.max))
        
        #expect(!validator.isPositive(0))
        #expect(!validator.isPositive(-1))
        #expect(!validator.isPositive(-5))
        #expect(!validator.isPositive(Int.min))
    }
    
    @Test("Negative integer validation")
    func testIsNegativeInt() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isNegative(-1))
        #expect(validator.isNegative(-5))
        #expect(validator.isNegative(Int.min))
        
        #expect(!validator.isNegative(0))
        #expect(!validator.isNegative(1))
        #expect(!validator.isNegative(5))
        #expect(!validator.isNegative(Int.max))
    }
    
    @Test("Odd integer validation")
    func testIsOddInt() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isOdd(1))
        #expect(validator.isOdd(5))
        #expect(validator.isOdd(-1))
        #expect(validator.isOdd(-5))
        
        #expect(!validator.isOdd(0))
        #expect(!validator.isOdd(2))
        #expect(!validator.isOdd(4))
        #expect(!validator.isOdd(-2))
        #expect(!validator.isOdd(-4))
    }
    
    @Test("Even integer validation")
    func testIsEvenInt() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isEven(2))
        #expect(validator.isEven(4))
        #expect(validator.isEven(-2))
        #expect(validator.isEven(-4))
        #expect(validator.isEven(0))
        
        #expect(!validator.isEven(1))
        #expect(!validator.isEven(5))
        #expect(!validator.isEven(-1))
        #expect(!validator.isEven(-5))
    }
    
    @Test("Prime integer validation")
    func testIsPrimeInt() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isPrime(2))
        #expect(validator.isPrime(3))
        #expect(validator.isPrime(5))
        #expect(validator.isPrime(7))
        #expect(validator.isPrime(11))
        #expect(validator.isPrime(13))
        #expect(validator.isPrime(17))
        #expect(validator.isPrime(97))
        
        #expect(!validator.isPrime(0))
        #expect(!validator.isPrime(1))
        #expect(!validator.isPrime(4))
        #expect(!validator.isPrime(6))
        #expect(!validator.isPrime(8))
        #expect(!validator.isPrime(-1))
        #expect(!validator.isPrime(-4))
        #expect(!validator.isPrime(-6))
        #expect(!validator.isPrime(-8))
    }
    
    @Test("Zero integer validation")
    func testIsZeroInt() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isZero(0))
        
        #expect(!validator.isZero(1))
        #expect(!validator.isZero(-1))
    }
    
    @Test("Range integer validation")
    func testIsInRangeInt() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isInRange(5, min: 1, max: 10))
        #expect(validator.isInRange(-5, min: -10, max: -1))
        
        #expect(validator.isInRange(1, min: 1, max: 10))
        #expect(validator.isInRange(10, min: 1, max: 10))
        
        #expect(!validator.isInRange(0, min: 1, max: 10))
        #expect(!validator.isInRange(11, min: 1, max: 10))
        
    }
    
    @Test("All positive integers validation")
    func testAllPositiveInts() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allPositive([1, 2, 3, 4, 5]))
        #expect(validator.allPositive([100]))
        
        #expect(!validator.allPositive(Array<Int>()))
        #expect(!validator.allPositive([1, 2, 0, 4, 5]))
        #expect(!validator.allPositive([1, 2, -1, 4, 5]))
    }
    
    @Test("All negative integers validation")
    func testAllNegativeInts() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allNegative([-1, -2, -3, -4, -5]))
        #expect(validator.allNegative([-100]))
        
        #expect(!validator.allNegative(Array<Int>()))
        #expect(!validator.allNegative([-1, -2, 0, -4, -5]))
        #expect(!validator.allNegative([-1, -2, 1, -4, -5]))
    }
    
    @Test("All odd integers validation")
    func testAllOddInts() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allOdd([1, 3, 5, 7, 9]))
        #expect(validator.allOdd([-1, -3, -5]))
        
        #expect(!validator.allOdd(Array<Int>()))
        #expect(!validator.allOdd([1, 2, 3, 5, 7]))
        #expect(!validator.allOdd([2, 4, 6]))
    }
    
    @Test("All even integers validation")
    func testAllEvenInts() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allEven([0, 2, 4, 6, 8]))
        #expect(validator.allEven([-2, -4, -6]))
        
        #expect(!validator.allEven(Array<Int>()))
        #expect(!validator.allEven([1, 2, 4, 6, 8]))
        #expect(!validator.allEven([1, 3, 5]))
    }
    
    @Test("All prime integers validation")
    func testAllPrimeInts() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allPrime([2, 3, 5, 7, 11]))
        #expect(validator.allPrime([2]))
        
        #expect(!validator.allPrime(Array<Int>()))
        #expect(!validator.allPrime([2, 3, 4, 5, 7]))
        #expect(!validator.allPrime([1, 2, 3]))
    }
    
    @Test("All zero integers validation")
    func testAllZeroInts() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allZero([0, 0, 0]))
        #expect(validator.allZero([0]))
        
        #expect(!validator.allZero(Array<Int>()))
        #expect(!validator.allZero([0, 0, 1]))
        #expect(!validator.allZero([1, 2, 3]))
    }
    
    @Test("All in range integers validation")
    func testAllInRangeInts() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allInRange([1, 5, 10], min: 1, max: 10))
        #expect(validator.allInRange([5], min: 1, max: 10))
        
        #expect(!validator.allInRange(Array<Int>(), min: 1, max: 10))
        #expect(!validator.allInRange([0, 5, 10], min: 1, max: 10))
        #expect(!validator.allInRange([1, 5, 11], min: 1, max: 10))
    }
    
    @Test("Positive double validation")
    func testIsPositiveDouble() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isPositive(1.0))
        #expect(validator.isPositive(0.1))
        #expect(validator.isPositive(Double.greatestFiniteMagnitude))
        #expect(validator.isPositive(Double.leastNormalMagnitude))
        #expect(validator.isPositive(Double.leastNonzeroMagnitude))
        
        #expect(!validator.isPositive(0.0))
        #expect(!validator.isPositive(-1.0))
        #expect(!validator.isPositive(-0.1))
        #expect(!validator.isPositive(-Double.greatestFiniteMagnitude))
        #expect(!validator.isPositive(-Double.leastNormalMagnitude))
        #expect(!validator.isPositive(-Double.leastNonzeroMagnitude))
    }
    
    @Test("Negative double validation")
    func testIsNegativeDouble() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isNegative(-1.0))
        #expect(validator.isNegative(-0.1))
        #expect(validator.isNegative(-Double.greatestFiniteMagnitude))
        #expect(validator.isNegative(-Double.leastNormalMagnitude))
        #expect(validator.isNegative(-Double.leastNonzeroMagnitude))
        
        #expect(!validator.isNegative(0.0))
        #expect(!validator.isNegative(1.0))
        #expect(!validator.isNegative(0.1))
        #expect(!validator.isNegative(Double.greatestFiniteMagnitude))
        #expect(!validator.isNegative(Double.leastNormalMagnitude))
        #expect(!validator.isNegative(Double.leastNonzeroMagnitude))
    }
    
    @Test("Odd double validation")
    func testIsOddDouble() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isOdd(1.0))
        #expect(validator.isOdd(3.0))
        #expect(validator.isOdd(-1.0))
        #expect(validator.isOdd(-3.0))
        
        #expect(!validator.isOdd(0.0))
        #expect(!validator.isOdd(2.0))
        #expect(!validator.isOdd(4.0))
        #expect(!validator.isOdd(-2.0))
        #expect(!validator.isOdd(-4.0))
        #expect(!validator.isOdd(1.5))
        #expect(!validator.isOdd(2.5))
    }
    
    @Test("Even double validation")
    func testIsEvenDouble() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isEven(0.0))
        #expect(validator.isEven(2.0))
        #expect(validator.isEven(4.0))
        #expect(validator.isEven(-2.0))
        #expect(validator.isEven(-4.0))
        
        #expect(!validator.isEven(1.0))
        #expect(!validator.isEven(3.0))
        #expect(!validator.isEven(-1.0))
        #expect(!validator.isEven(-3.0))
        #expect(!validator.isEven(1.5))
        #expect(!validator.isEven(2.5))
    }
    
    @Test("Prime double validation")
    func testIsPrimeDouble() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isPrime(2.0))
        #expect(validator.isPrime(3.0))
        #expect(validator.isPrime(5.0))
        #expect(validator.isPrime(7.0))
        #expect(validator.isPrime(11.0))
        #expect(validator.isPrime(13.0))
        #expect(validator.isPrime(17.0))
        #expect(validator.isPrime(97.0))
        
        #expect(!validator.isPrime(0))
        #expect(!validator.isPrime(1.0))
        #expect(!validator.isPrime(4.0))
        #expect(!validator.isPrime(6.0))
        #expect(!validator.isPrime(8.0))
        #expect(!validator.isPrime(-1.0))
        #expect(!validator.isPrime(-4.0))
        #expect(!validator.isPrime(-6.0))
        #expect(!validator.isPrime(-8.0))
        #expect(!validator.isPrime(2.5))
        #expect(!validator.isPrime(3.7))
    }
    
    @Test("Zero double validation")
    func testIsZeroDouble() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isZero(0.0))
        
        #expect(!validator.isZero(1.0))
        #expect(!validator.isZero(0.1))
        #expect(!validator.isZero(-0.1))
        #expect(!validator.isZero(-1.0))
        
    }
    
    @Test("Whole double validation")
    func testIsWholeDouble() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isWhole(0.0))
        #expect(validator.isWhole(1.0))
        #expect(validator.isWhole(2.0))
        #expect(validator.isWhole(-1.0))
        #expect(validator.isWhole(-2.0))
        
        #expect(!validator.isWhole(0.1))
        #expect(!validator.isWhole(1.5))
        #expect(!validator.isWhole(-0.1))
        #expect(!validator.isWhole(-1.5))
    }
    
    @Test("Range double validation")
    func testIsInRangeDouble() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isInRange(5.0, min: 1.0, max: 10.0))
        #expect(validator.isInRange(-5.0, min: -10.0, max: -1.0))
        
        #expect(validator.isInRange(7.5, min: 1.5, max: 10.5))
        #expect(validator.isInRange(-7.5, min: -10.5, max: -1.5))
        
        #expect(validator.isInRange(1.0, min: 1.0, max: 10.0))
        #expect(validator.isInRange(10.0, min: 1.0, max: 10.0))
        
        #expect(!validator.isInRange(0.0, min: 1.0, max: 10.0))
        #expect(!validator.isInRange(11.0, min: 1.0, max: 10.0))
    }
    
    @Test("All positive doubles validation")
    func testAllPositiveDoubles() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allPositive([1.5, 2.5, 3.0, 4.5, 5.5]))
        #expect(validator.allPositive([100.5]))
        
        #expect(!validator.allPositive(Array<Double>()))
        #expect(!validator.allPositive([1.0, 2.5, 0.0, 4.5, 5.0]))
        #expect(!validator.allPositive([1.0, 2.5, -1.0, 4.5, 5.0]))
    }
    
    @Test("All negative doubles validation")
    func testAllNegativeDoubles() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allNegative([-1.5, -2.5, -3.0, -4.5, -5.5]))
        #expect(validator.allNegative([-100.5]))
        
        #expect(!validator.allNegative(Array<Double>()))
        #expect(!validator.allNegative([-1.0, -2.5, 0.0, -4.5, -5.0]))
        #expect(!validator.allNegative([-1.0, -2.5, 1.0, -4.5, -5.0]))
    }
    
    @Test("All odd doubles validation")
    func testAllOddDoubles() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allOdd([1.0, 3.0, 5.0, 7.0, 9.0]))
        #expect(validator.allOdd([-1.0, -3.0, -5.0]))
        
        #expect(!validator.allOdd(Array<Double>()))
        #expect(!validator.allOdd([2.0, 3.0, 5.0, 7.0]))
        #expect(!validator.allOdd([1.5, 3.0, 5.0, 7.0]))
    }
    
    @Test("All even doubles validation")
    func testAllEvenDoubles() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allEven([0.0, 2.0, 4.0, 6.0, 8.0]))
        #expect(validator.allEven([-2.0, -4.0, -6.0]))
        
        #expect(!validator.allEven(Array<Double>()))
        #expect(!validator.allEven([1.0, 4.0, 6.0, 8.0]))
        #expect(!validator.allEven([2.5, 4.0, 6.0, 8.0]))
    }
    
    @Test("All prime doubles validation")
    func testAllPrimeDoubles() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allPrime([2.0, 3.0, 5.0, 7.0, 11.0]))
        #expect(validator.allPrime([2.0]))
        
        #expect(!validator.allPrime(Array<Double>()))
        #expect(!validator.allPrime([2.5]))
        #expect(!validator.allPrime([2.0, 3.0, 4.0, 5.0, 7.0]))
        #expect(!validator.allPrime([1.0, 2.0, 3.0]))
    }
    
    @Test("All zero doubles validation")
    func testAllZeroDoubles() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allZero([0.0, 0.0, 0.0]))
        #expect(validator.allZero([0.0]))
        
        #expect(!validator.allZero(Array<Double>()))
        #expect(!validator.allZero([0.0, 0.0, 1.5]))
        #expect(!validator.allZero([1.0, 2.0, 3.0]))
    }
    
    @Test("All whole doubles validation")
    func testAllWholeDoubles() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allWhole([1.0, 2.0, 3.0]))
        #expect(validator.allWhole([0.0, -2.0, -3.0]))
        
        #expect(!validator.allWhole(Array<Double>()))
        #expect(!validator.allWhole([1.0, 2.5, 3.0]))
        #expect(!validator.allWhole([1.5, 2.7, 3.9]))
    }
    
    @Test("All in range doubles validation")
    func testAllInRangeDoubles() {
        let validator = CustomValidator.mock()
        
        #expect(validator.allInRange([1.0, 5.0, 10.0], min: 1.0, max: 10.0))
        #expect(validator.allInRange([5.0], min: 1.0, max: 10.0))
        #expect(validator.allInRange([5.5], min: 1.5, max: 10.5))
        
        #expect(!validator.allInRange(Array<Double>(), min: 1.0, max: 10.0))
        #expect(!validator.allInRange([1.0, 5.0, 10.5], min: 1.0, max: 10.0))
        #expect(!validator.allInRange([0.5, 5.0, 10.0], min: 1.0, max: 10.0))
    }
    
    @Test("Non-empty text validation")
    func testIsNonEmpty() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isNonEmpty("hello", trimWhitespace: false))
        #expect(validator.isNonEmpty("hello", trimWhitespace: true))
        
        #expect(validator.isNonEmpty(" hello ", trimWhitespace: false))
        #expect(validator.isNonEmpty(" hello ", trimWhitespace: true))
        
        #expect(validator.isNonEmpty("   ", trimWhitespace: false))
        #expect(validator.isNonEmpty("\n\t ", trimWhitespace: false))
        
        #expect(!validator.isNonEmpty("", trimWhitespace: false))
        #expect(!validator.isNonEmpty("", trimWhitespace: true))
        
        #expect(!validator.isNonEmpty("   ", trimWhitespace: true))
        #expect(!validator.isNonEmpty("\n\t ", trimWhitespace: true))
    }
    
    @Test("Lowercase text validation")
    func testIsLowercased() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isLowercased("hello"))
        #expect(validator.isLowercased("hello world"))
        #expect(validator.isLowercased("hello 123"))
        #expect(validator.isLowercased("hello ?"))
        #expect(validator.isLowercased("hello 😀"))
        
        #expect(!validator.isLowercased(""))
        #expect(!validator.isLowercased(" "))
        #expect(!validator.isLowercased("Hello"))
        #expect(!validator.isLowercased("HELLO"))
        #expect(!validator.isLowercased("hEllo"))
        #expect(!validator.isLowercased("Hello World"))
        #expect(!validator.isLowercased("Hello 123"))
        #expect(!validator.isLowercased("123"))
        #expect(!validator.isLowercased("?"))
        #expect(!validator.isLowercased("😀"))
    }
    
    @Test("Uppercase text validation")
    func testIsUppercased() {
        let validator = CustomValidator.mock()
        
        #expect(validator.isUppercased("HELLO"))
        #expect(validator.isUppercased("HELLO WORLD"))
        #expect(validator.isUppercased("HELLO 123"))
        #expect(validator.isUppercased("HELLO ?"))
        #expect(validator.isUppercased("HELLO 😀"))
        
        #expect(!validator.isUppercased(""))
        #expect(!validator.isUppercased(" "))
        #expect(!validator.isUppercased("hELLO"))
        #expect(!validator.isUppercased("hello"))
        #expect(!validator.isUppercased("HeLLO"))
        #expect(!validator.isUppercased("Hello World"))
        #expect(!validator.isUppercased("hELLO 123"))
        #expect(!validator.isUppercased("123"))
        #expect(!validator.isUppercased("?"))
        #expect(!validator.isUppercased("😀"))
    }
    
    @Test("Only alphabet validation")
    func testOnlyAlphabet() {
        let validator = CustomValidator.mock()
        
        #expect(validator.onlyAlphabet("hello"))
        #expect(validator.onlyAlphabet("HELLO"))
        #expect(validator.onlyAlphabet("HelloWorld"))
        
        #expect(!validator.onlyAlphabet(""))
        #expect(!validator.onlyAlphabet(" "))
        #expect(!validator.onlyAlphabet("hello 123"))
        #expect(!validator.onlyAlphabet("hello world"))
        #expect(!validator.onlyAlphabet("hello ?"))
        #expect(!validator.onlyAlphabet("hello 😀"))
        #expect(!validator.onlyAlphabet("123"))
        #expect(!validator.onlyAlphabet("?"))
        #expect(!validator.onlyAlphabet("😀"))
    }
    
    @Test("Only symbol validation")
    func testOnlySymbol() {
        let validator = CustomValidator.mock()
        
        #expect(validator.onlySymbol("!@#$%"))
        #expect(validator.onlySymbol(".,;:"))
        #expect(validator.onlySymbol("()[]{}"))
        #expect(validator.onlySymbol("+-*/="))
        
        #expect(!validator.onlySymbol(""))
        #expect(!validator.onlySymbol(" "))
        #expect(!validator.onlySymbol("! @"))
        #expect(!validator.onlySymbol("a!@#"))
        #expect(!validator.onlySymbol("hello"))
        #expect(!validator.onlySymbol("123"))
        #expect(!validator.onlySymbol("😀"))
    }
    
    @Test("Only emoji validation")
    func testOnlyEmoji() {
        let validator = CustomValidator.mock()
        
        #expect(validator.onlyEmoji("😀"))
        #expect(validator.onlyEmoji("😀😃😄"))
        #expect(validator.onlyEmoji("🎉🎊🎈"))
        #expect(validator.onlyEmoji("👍👎"))
        
        #expect(!validator.onlyEmoji(""))
        #expect(!validator.onlyEmoji(" "))
        #expect(!validator.onlyEmoji("hello😀"))
        #expect(!validator.onlyEmoji("😀 😃"))
        #expect(!validator.onlyEmoji("😀+?"))
        #expect(!validator.onlyEmoji("😀123"))
        #expect(!validator.onlyEmoji("abc"))
        #expect(!validator.onlyEmoji("123"))
        #expect(!validator.onlyEmoji("+-?"))
    }
    
    @Test("Only number validation")
    func testOnlyNumber() {
        let validator = CustomValidator.mock()
        
        #expect(validator.onlyNumber("123"))
        #expect(validator.onlyNumber("0"))
        #expect(validator.onlyNumber("9876543210"))
        
        #expect(!validator.onlyNumber(""))
        #expect(!validator.onlyNumber(" "))
        #expect(!validator.onlyNumber("123abc"))
        #expect(!validator.onlyNumber("12.3"))
        #expect(!validator.onlyNumber("1 2 3"))
        #expect(!validator.onlyNumber("123!"))
        #expect(!validator.onlyNumber("-123"))
        #expect(!validator.onlyNumber("+-?"))
        #expect(!validator.onlyNumber("😀"))
    }
    
    @Test("Only alphanumeric validation")
    func testOnlyAlphanumeric() {
        let validator = CustomValidator.mock()
        
        #expect(validator.onlyAlphanumeric("abc123"))
        #expect(validator.onlyAlphanumeric("ABC123"))
        #expect(validator.onlyAlphanumeric("hello123world"))
        #expect(validator.onlyAlphanumeric("123"))
        #expect(validator.onlyAlphanumeric("abc"))
        
        #expect(!validator.onlyAlphanumeric(""))
        #expect(!validator.onlyAlphanumeric(" "))
        #expect(!validator.onlyAlphanumeric("abc 123"))
        #expect(!validator.onlyAlphanumeric("abc-123"))
        #expect(!validator.onlyAlphanumeric("+-?"))
        #expect(!validator.onlyAlphanumeric("😀"))
    }
    
    @Test("Contains whitespace validation")
    func testContainsWhitespace() {
        let validator = CustomValidator.mock()
        
        #expect(validator.containsWhitespace("hello world"))
        #expect(validator.containsWhitespace(" hello"))
        #expect(validator.containsWhitespace("hello "))
        #expect(validator.containsWhitespace("hello\tworld"))
        #expect(validator.containsWhitespace("hello\nworld"))
        #expect(validator.containsWhitespace("   "))
        
        #expect(!validator.containsWhitespace(""))
        #expect(!validator.containsWhitespace("hello"))
        #expect(!validator.containsWhitespace("helloworld"))
        #expect(!validator.containsWhitespace("123456"))
        #expect(!validator.containsWhitespace("+-?"))
        #expect(!validator.containsWhitespace("😀"))
    }
    
    @Test("Raw regex validation")
    func testMatchesRegex() {
        let validator = CustomValidator.mock()
        let emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        
        #expect(validator.matchesRegex("test@example.com", pattern: emailPattern))
        #expect(validator.matchesRegex("user.name+tag@domain.co.uk", pattern: emailPattern))
        
        #expect(!validator.matchesRegex("invalid-email", pattern: emailPattern))
        #expect(!validator.matchesRegex("@example.com", pattern: emailPattern))
    }
    
    @Test("Email pattern validation")
    func testEmailPattern() {
        let validator = CustomValidator.mock()
        
        #expect(validator.matchesPattern("test@example.com", pattern: .email))
        #expect(validator.matchesPattern("user.name@domain.com", pattern: .email))
        #expect(validator.matchesPattern("user+tag@example.org", pattern: .email))
        #expect(validator.matchesPattern("firstname.lastname@company.co.uk", pattern: .email))
        
        #expect(!validator.matchesPattern("", pattern: .email))
        #expect(!validator.matchesPattern(" ", pattern: .email))
        #expect(!validator.matchesPattern("invalid-email", pattern: .email))
        #expect(!validator.matchesPattern("@example.com", pattern: .email))
        #expect(!validator.matchesPattern("user@", pattern: .email))
        #expect(!validator.matchesPattern("user@domain", pattern: .email))
        #expect(!validator.matchesPattern("user name@domain.com", pattern: .email))
    }
    
    @Test("Password pattern validation - default settings")
    func testPasswordPatternDefault() {
        let validator = CustomValidator.mock()
        let pattern = ExtensiveRegexValidatorPattern.password()
        
        // Valid passwords (min 8 chars)
        #expect(validator.matchesPattern("Password", pattern: pattern))
        
        // Invalid passwords
        #expect(!validator.matchesPattern("", pattern: pattern))
        #expect(!validator.matchesPattern("        ", pattern: pattern)) // 8 whitespace
        #expect(!validator.matchesPattern("short", pattern: pattern)) // Too short
    }
    
    @Test("Password pattern validation - custom settings")
    func testPasswordPatternCustom() {
        let validator = CustomValidator.mock()
        // Minimal requirements: only 4 chars minimum, lowercase required
        let minimalPattern = ExtensiveRegexValidatorPattern.password(
            minLength: 4,
            requiresUppercase: false,
            requiresNumber: false,
            requiresSymbol: false
        )
        
        #expect(validator.matchesPattern("test", pattern: minimalPattern))
        #expect(validator.matchesPattern("hello", pattern: minimalPattern))
        #expect(!validator.matchesPattern("", pattern: minimalPattern))
        #expect(!validator.matchesPattern("hi", pattern: minimalPattern)) // Too short
        #expect(!validator.matchesPattern("TEST", pattern: minimalPattern)) // No lowercase
        
        // Only uppercase and number required
        let customPattern = ExtensiveRegexValidatorPattern.password(
            minLength: 6,
            requiresUppercase: true,
            requiresNumber: true,
            requiresSymbol: true
        )
        
        #expect(validator.matchesPattern("Test123!", pattern: customPattern))
        #expect(validator.matchesPattern("Password1.", pattern: customPattern))
        #expect(!validator.matchesPattern("test123", pattern: customPattern)) // No uppercase
        #expect(!validator.matchesPattern("TestABC", pattern: customPattern)) // No number
    }
}
