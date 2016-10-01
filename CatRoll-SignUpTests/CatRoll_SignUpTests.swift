//
//  CatRoll_SignUpTests.swift
//  CatRoll-SignUpTests
//
//  Created by Louis Tur on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import XCTest
@testable import CatRoll_SignUp

class CatRoll_SignUpTests: XCTestCase {
    internal let minimum_1: Int = -1
    internal let minimum0: Int = 0
    internal let minimum1: Int = 1
    internal let minimum10: Int = 10
    internal let minimum100: Int = 100
    internal var loginViewController: LoginViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testStringLengthValidationForNonNilString() {
        var testFieldMin = minimum10
        let testField: UITextField = UITextField()
        testField.text = "Multi Char String"
        
        // valid
        let validLengthResult: Bool = self.loginViewController.textField(testField, hasMinimumCharacters: testFieldMin)
        
        XCTAssertTrue(validLengthResult, "textField(:hasMinimumCharacters:) should be true when it meets a valid criteria. String: \(testField.text! as String), Min Count: \(testFieldMin)")
        
        // invalid
        testFieldMin = minimum100
        let invalidLengthResult: Bool = self.loginViewController.textField(testField, hasMinimumCharacters: testFieldMin)
        
        XCTAssertFalse(invalidLengthResult, "textField(:hasMinimumCharacters:) should be false when it doesn't meet it's minimum criteria. String: \(testField.text! as String), Min Count: \(testFieldMin)")
        
        
        // case 0
        testFieldMin = minimum0
        XCTAssertTrue(self.loginViewController.textField(testField, hasMinimumCharacters: testFieldMin))
        
        
        // case -1
        testFieldMin = minimum_1
        XCTAssertTrue(self.loginViewController.textField(testField, hasMinimumCharacters: testFieldMin))
    }
    
    func testStringLengthValidationForEmptyString() {
        var testFieldMin = minimum_1
        let testField: UITextField = UITextField()
        testField.text = ""
        
        let validLengthResult: Bool = self.loginViewController.textField(testField, hasMinimumCharacters: testFieldMin)
        XCTAssertTrue(validLengthResult, "textField(:hasMinimumCharacters:) should be true when it meets a valid criteria. String: \(testField.text! as String), Min Count: \(testFieldMin)")

        let validLengthResultZero: Bool = self.loginViewController.textField(testField, hasMinimumCharacters: testFieldMin)
        XCTAssertTrue(validLengthResultZero, "textField(:hasMinimumCharacters:) should be true when it meets a valid criteria. String: \(testField.text! as String), Min Count: \(testFieldMin)")
        
        testFieldMin = minimum10
        let invalidLengthResult: Bool = self.loginViewController.textField(testField, hasMinimumCharacters: testFieldMin)
        XCTAssertFalse(invalidLengthResult, "textField(:hasMinimumCharacters:) should be false when it doesn't meet it's minimum criteria. String: \(testField.text! as String), Min Count: \(testFieldMin)")
    }
    
    func testCharacterMembershipInString() {
        let numbersCharacterSet: CharacterSet = CharacterSet.decimalDigits
        let lettersCharacterSet: CharacterSet = CharacterSet.letters
        let alphaNumCharacterSet: CharacterSet = CharacterSet.alphanumerics
        let whitespaceCharacterSet: CharacterSet = CharacterSet.whitespaces
        let decomposableCharacterSet: CharacterSet = CharacterSet.decomposables.union(lettersCharacterSet)
        
        let characterString: String = "LettersString"
        let numberString: String = "1234567890"
        let mixedSring: String = "123Letters456"
        let whiteSpaceString: String = "      "
        let trimmableWhiteSpaceLetters: String = "    Letters"
        let decomposableCharacters: String = "èñöūæ"
        
        XCTAssertTrue(self.loginViewController.string(characterString, containsOnly: lettersCharacterSet))
        XCTAssertTrue(self.loginViewController.string(numberString, containsOnly: numbersCharacterSet))
        XCTAssertTrue(self.loginViewController.string(mixedSring, containsOnly: alphaNumCharacterSet))
        XCTAssertTrue(self.loginViewController.string(trimmableWhiteSpaceLetters.trimmingCharacters(in: whitespaceCharacterSet), containsOnly: lettersCharacterSet))
        XCTAssertTrue(self.loginViewController.string(whiteSpaceString, containsOnly: whitespaceCharacterSet))
        XCTAssertTrue(self.loginViewController.string(decomposableCharacters, containsOnly: decomposableCharacterSet))
        
        XCTAssertFalse(self.loginViewController.string(trimmableWhiteSpaceLetters, containsOnly: lettersCharacterSet))
    }
    
    func testTwoWordNameMinimum() {
        let oneWordStandard: String = "First"
        let twoWordsStandard: String = "First Name"
        let threeWordsStrandard: String = "First Name Last"
        let hyphenatedName: String = "First-Name Last"
        let punctuatedString: String = "First Name Jr."
        let whiteSpacePadded: String = "   First Name  "
        let nonAlphaCharacters: String = "782-319 233.153"
        let whiteSpaces: String = "             "
        let initials: String = "F N Last"
        let decomposableCharacters: String = "First Ñamè"
        let initialsDecomposable: String = "Ñ È"
        
        // Delete this line when you're ready for the exercises
        XCTFail("This test will always fail until you complete the exercises")
        /* Uncomment for exercises
 
        XCTAssertTrue(loginViewController.twoNamesArePresent(in: twoWordsStandard))
        XCTAssertTrue(loginViewController.twoNamesArePresent(in: threeWordsStrandard))
        XCTAssertTrue(loginViewController.twoNamesArePresent(in: hyphenatedName))
        XCTAssertTrue(loginViewController.twoNamesArePresent(in: punctuatedString))
        XCTAssertTrue(loginViewController.twoNamesArePresent(in: whiteSpacePadded))
        XCTAssertTrue(loginViewController.twoNamesArePresent(in: decomposableCharacters))
        
        XCTAssertFalse(loginViewController.twoNamesArePresent(in: oneWordStandard))
        XCTAssertFalse(loginViewController.twoNamesArePresent(in: nonAlphaCharacters))
        XCTAssertFalse(loginViewController.twoNamesArePresent(in: whiteSpaces))
        XCTAssertFalse(loginViewController.twoNamesArePresent(in: initials))
        XCTAssertFalse(loginViewController.twoNamesArePresent(in: initialsDecomposable))
        */
    }
    
    func testForAtLeastOneNumberInString() {
        let oneNumberString: String = "1"
        let multiNumberString: String = "1234567890"
        let mixedAlphaString: String = "àbc123ÈFG"
        let whiteSpacePadded: String = "     1234123    "
        let mixedCharacterString: String = " $%@asd123"
        let controlCharacterSet: String = "%&@(*$@(!))"
        let emptyString: String = ""
        let whiteSpaceString: String = "      "
        
        // Delete this line when you're ready for the exercises
        XCTFail("This test will always fail until you complete the exercises")
        
        /* Uncomment for exercises
         
        XCTAssertTrue(loginViewController.passwordContainsAtLeastOneNumber(oneNumberString))
        XCTAssertTrue(loginViewController.passwordContainsAtLeastOneNumber(multiNumberString))
        XCTAssertTrue(loginViewController.passwordContainsAtLeastOneNumber(mixedAlphaString))
        XCTAssertTrue(loginViewController.passwordContainsAtLeastOneNumber(whiteSpacePadded))
        XCTAssertTrue(loginViewController.passwordContainsAtLeastOneNumber(mixedCharacterString))
        
        XCTAssertFalse(loginViewController.passwordContainsAtLeastOneNumber(controlCharacterSet))
        XCTAssertFalse(loginViewController.passwordContainsAtLeastOneNumber(emptyString))
        XCTAssertFalse(loginViewController.passwordContainsAtLeastOneNumber(whiteSpaceString))
        */
    }
    
    func testForAtLeastOneCapitalLetterInString() {
        let oneLetterNonCapital: String = "a"
        let oneLetterDecomposableNonCapital: String = "å"
        let oneLetterCapital: String = "A"
        let oneLetterDecomposableCapital: String = "Å"
        let lowercasedString: String = "first name"
        let capitalizedString: String = "First Name"
        let mixedAlphaNumString: String = "F1R57 N4m3"
        
        
        // Delete this line when you're ready for the exercises
        XCTFail("This test will always fail until you complete the exercises")
        
        /* Uncomment for exercises
 
        XCTAssertTrue(loginViewController.passwordContainsAtLeastOneCapitalizedLetter(oneLetterCapital))
        XCTAssertTrue(loginViewController.passwordContainsAtLeastOneCapitalizedLetter(oneLetterDecomposableCapital))
        XCTAssertTrue(loginViewController.passwordContainsAtLeastOneCapitalizedLetter(capitalizedString))
        XCTAssertTrue(loginViewController.passwordContainsAtLeastOneCapitalizedLetter(mixedAlphaNumString))
        
        XCTAssertFalse(loginViewController.passwordContainsAtLeastOneCapitalizedLetter(oneLetterNonCapital))
        XCTAssertFalse(loginViewController.passwordContainsAtLeastOneCapitalizedLetter(oneLetterDecomposableNonCapital))
        XCTAssertFalse(loginViewController.passwordContainsAtLeastOneCapitalizedLetter(lowercasedString))
         */
    }
}
