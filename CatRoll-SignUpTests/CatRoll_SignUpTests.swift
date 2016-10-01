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
    internal var loginViewController: LoginViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.loginViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
        
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
        
        let characterString: String = "LettersString"
        let numberString: String = "1234567890"
        let mixedSring: String = "123Letters456"
        let whiteSpaceString: String = "      "
        let trimmableWhiteSpaceLetters: String = "    Letters"
        
        XCTAssertTrue(self.loginViewController.string(characterString, containsOnly: lettersCharacterSet))
        
        XCTAssertTrue(self.loginViewController.string(numberString, containsOnly: numbersCharacterSet))
        
        XCTAssertTrue(self.loginViewController.string(mixedSring, containsOnly: alphaNumCharacterSet))
        
        XCTAssertFalse(self.loginViewController.string(trimmableWhiteSpaceLetters, containsOnly: lettersCharacterSet))
        
        XCTAssertTrue(self.loginViewController.string(trimmableWhiteSpaceLetters.trimmingCharacters(in: whitespaceCharacterSet), containsOnly: lettersCharacterSet))
        
        XCTAssertTrue(self.loginViewController.string(whiteSpaceString, containsOnly: whitespaceCharacterSet))
        
    }
}
