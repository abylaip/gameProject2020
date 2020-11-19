//
//  SignUpViewController.swift
//  gameProject
//
//  Created by Abyl on 11/11/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTextField.text = "+7"
        
        phoneNumberTextField.delegate = self
        phoneNumberTextField.keyboardType = .numberPad
    }
    
    @IBAction func didSignUp(_ sender: Any) {//to Sign In Page
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SignInViewController")
                
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .flipHorizontal
                
        present(secondVC, animated: true, completion: nil)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = textField.text!
        let spaceIndex = [2, 6, 10, 13]
        

        if text == "+7" && string == "" {
            return false
        }

        if text.count == 16 && string != "" {
            return false
        }

        if spaceIndex.contains(textField.text!.count) && string != "" {
            textField.text!.append("-")
        }
        
        return true
    }
}
