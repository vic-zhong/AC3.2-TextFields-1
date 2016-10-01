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
            
        
        // 2. iterrate over the text fields
        for textField in textFields {
            
            // 3. if the textfield doesn't have the minimum required characters...
            if !self.textField(textField, hasMinimumCharacters: minimumLengthRequireMents[textField]!) {
                
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
            let validString: Bool = self.string(string, containsOnly: CharacterSet.letters)
            
            if !validString {
                self.updateErrorLabel(with: "\(textField.debugId) can only contain alphanumeric characters")
            }
            
            return validString
        }
        
        return true
    }
}
