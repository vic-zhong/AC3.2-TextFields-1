//
//  LoginViewController.swift
//  CatRoll-SignUp
//
//  Created by Louis Tur on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        print("did tap button")
        print("Textfields are valid: \(textFieldsAreValid())")
    }
    
    // MARK: - Validations
    func textFieldsAreValid() -> Bool {
        
        // 1. some set up
        let textFields: [UITextField] = [self.nameTextField, self.passwordTextField]
        let minimumLengthRequireMents: [UITextField : Int] = [
            self.nameTextField : 1,
            self.passwordTextField : 6
        ]
        
        guard
            let nameString: String = self.nameTextField.text,
            let passwordString: String = self.passwordTextField.text
            else {
                return false
        }
        
        guard
            !nameString.isEmpty,
            !passwordString.isEmpty
            else {
                self.updateErrorLabel(with: "Must not leave any fields blank")
                return false
        }
        
        guard self.twoNamesArePresent(in: nameString) else {
            self.updateErrorLabel(with: "Name Field Must Contain At Least 2 Names (First, Family)")
            return false
        }
        guard self.passwordContainsAtLeastOneCapitalizedLetter(passwordString) else {
            self.updateErrorLabel(with: "Password Must Contain At Least One Capitalized Letter")
            return false
        }
        guard self.passwordContainsAtLeastOneNumber(passwordString) else {
            self.updateErrorLabel(with: "Password Must Contain At Least One Number")
            return false
        }
        
        // 2. iterrate over the text fields
        for textField in textFields {
            // 3. if the textfield doesn't have the minimum required characters...
            let minimumCharReq: Bool = self.textField(textField, hasMinimumCharacters: minimumLengthRequireMents[textField]!)
            if !minimumCharReq {
                
                // 4. make sure that the label isn't hidden
                // 5. display an error to rhe user
                let errorText = "\(textField.debugId) does not meet the minimum character count of \(minimumLengthRequireMents[textField]! as Int)"
                self.updateErrorLabel(with: errorText)
                
                // 6. indicate that the fields are not valid
                return false
            }
        }
        
        
        // 3. hide the error label if all gets validated
        self.updateErrorLabel(with: "")
        
        // 4. indicate that the fields are valid
        return true
    }
    
    func textField(_ textField: UITextField, hasMinimumCharacters minimum: Int) -> Bool {
        
        guard let currentText: String = textField.text else {
            return false
        }
        
        
        if currentText.characters.count >= minimum {
            return true
        }
        
        return false
    }
    
    func string(_ string: String, containsOnly characterSet: CharacterSet) -> Bool {
        if let _ = string.rangeOfCharacter(from: characterSet.inverted) {
            return false
        }
        return true
    }
    
    
    // MARK: - Exercise Functions
    func twoNamesArePresent(in string: String) -> Bool {
        let validNameCharacters: CharacterSet = CharacterSet.letters.union(CharacterSet.punctuationCharacters)
        
        let components: [String] = string.trimmingCharacters(in: CharacterSet.whitespaces)
            .components(separatedBy: CharacterSet.whitespaces)
        
        guard components.count >= 2 else {
            return false
        }
        
        for component in components {
            guard
                component.characters.count > 1,
                self.string(component, containsOnly: validNameCharacters)
                else {
                    return false
            }
        }
        
        return true
    }
    
    func passwordContainsAtLeastOneNumber(_ string: String) -> Bool {
        if let _ = string.rangeOfCharacter(from: CharacterSet.decimalDigits) {
            return true
        }
        
        return false
    }
    
    func passwordContainsAtLeastOneCapitalizedLetter(_ string: String) -> Bool {
        if let _ = string.rangeOfCharacter(from: CharacterSet.uppercaseLetters) {
            return true
        }
        
        return false
    }
    
    
    // MARK: - UI Helper
    func updateErrorLabel(with message: String) {
        if self.errorLabel.isHidden {
            self.errorLabel.isHidden = false
        }
        
        self.errorLabel.text = message
        self.errorLabel.textColor = UIColor.red
        self.errorLabel.backgroundColor = UIColor.red.withAlphaComponent(0.25)
    }
    
    
    // MARK: - UITextFieldDelegate
    
    // we can take a look and get a general sense of what happens, when
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // the .debugId property is defined in an extension, it's not actually part of UITextField
        //        print("\n + \(textField.debugId) SHOULD BEGIN")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //        print("\n + \(textField.debugId) DID BEGIN")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //        print("\n - \(textField.debugId) SHOULD END")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //        print("\n - \(textField.debugId) DID END")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\n ~ \(textField.debugId) SHOULD RETURN")
        
        _ = self.textFieldsAreValid()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == self.nameTextField && string != "" {
            let validString: Bool = self.string(string, containsOnly: CharacterSet.letters.union(CharacterSet.punctuationCharacters).union(CharacterSet.whitespaces))
            
            if !validString {
                self.updateErrorLabel(with: "\(textField.debugId) can only contain letters, punctuation or spaces")
            }
            
            return validString
        } else if textField == self.passwordTextField && string != "" {
            let validString: Bool = self.string(string, containsOnly: CharacterSet.alphanumerics)
            
            if !validString {
                self.updateErrorLabel(with: "\(textField.debugId) can only contain alphanumeric characters")
            }
        }
        
        return true
    }
}
