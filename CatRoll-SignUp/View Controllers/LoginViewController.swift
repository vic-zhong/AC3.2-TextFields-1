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
    @IBOutlet weak var emailTextField: UITextField!
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
    }
    
    
    // MARK: - UITextFieldDelegate
    
    // we can take a look and get a general sense of what happens, when
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // the .debugId property is defined in an extension, it's not actually part of UITextField
        print("\n + \(textField.debugId) SHOULD BEGIN")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("\n + \(textField.debugId) DID BEGIN")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("\n - \(textField.debugId) SHOULD END")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\n - \(textField.debugId) DID END")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\n ~ \(textField.debugId) SHOULD RETURN")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
}
