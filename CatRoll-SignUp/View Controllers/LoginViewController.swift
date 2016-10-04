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
	@IBOutlet weak var loginButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func didTapLogin(_ sender: UIButton) {
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
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
		var errorString = String()
		for element in textFields {
			// 3. if the textfield doesn't have the minimum required characters...
			
			if let field = element.text?.characters.count, let min = minimumLengthRequireMents[element] {
				if field < min {
					// 4. make sure that the label isn't hidden
					errorLabel.isHidden = false

					// 5. display an error to rhe user
					errorString += "You need at least \(min) characters in your \(element.accessibilityLabel!)!"
					
					// 6. indicate that the fields are not valid
					element.backgroundColor = .red
				} else {
					// 7. hide the error label if all gets validated
					errorLabel.isHidden = true
					
					// 8. indicate that the fields are valid
					element.backgroundColor = .white
				}
			}
			errorLabel.text = errorString
		}
		
		
		
		
		return true
	}
	
	func textField(_ textField: UITextField, hasMinimumCharacters minimum: Int) -> Bool {
		// fill in code
		return false
	}
	
	func string(_ string: String, containsOnly characterSet: CharacterSet) -> Bool {
		// fill in code
		return true
	}
	
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		// the .debugId property is defined in an extension, it's not actually part of UITextField
		print("\n + \(textField.debugId) SHOULD BEGIN") // replace this with the function shorthand
		return true
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		print("\n + \(textField.debugId) DID BEGIN")
	}
	
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		print("\n + \(textField.debugId) SHOULD END")
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		print("\n + \(textField.debugId) DID END")
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		print("\n + \(textField.debugId) SHOULD RETURN")
		
		//		if textField == self.nameTextField {
		//			let textIsLongEnough: Bool = self.textFieldValidation(textField, hasMinimumCharacters: 1)
		//
		//			// write in code to handle this case
		//			// 1. check the Bool value, if false, write some error message to the errorLabel
		//			if textIsLongEnough == false {
		//				errorLabel.isHidden = false
		//				errorLabel.text = "Name must be at least 1 character"
		//			}
		//		}
		//
		//		if textField == self.passwordTextField {
		//			let textIsLongEnough: Bool = self.textFieldValidation(textField, hasMinimumCharacters: 6)
		//
		//			// write in code to handle this case
		//			// 1. check the Bool value, if false, write some error message to the errorLabel
		//			if textIsLongEnough == false {
		//				errorLabel.isHidden = false
		//				errorLabel.text = "Password must be at least 6 characters"
		//			}
		//		}
		
		// this will generate a warning about an unused return variable without the "_ = "
		_ = self.textFieldsAreValid()
		
		return true
	}
	
	//	func textFieldValidation(_ textField: UITextField, hasMinimumCharacters minimum: Int) -> Bool {
	//		if (textField.text?.characters.count)! >= minimum {
	//			return true
	//		} else {
	//			return false
	//		}
	//	}
	
	// MARK: - UI Helper
	// (add the label update function here when the lesson calls for it)
	
	
	// MARK: - UITextFieldDelegate
	// (add delegate functions below here)
}
