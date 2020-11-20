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
    
    @IBAction func didSignUp(_ sender: Any) {
        print(phoneNumberTextField.text!)
        var flag: Bool = false
        let url = URL(string: "http://188.130.160.190:3000/api/sign-up")!
        var request = URLRequest(url: url)
        
        request.setValue(
            "authToken",
            forHTTPHeaderField: "Authorization"
        )
        
        let body = [
            "phone": phoneNumberTextField.text!,
            "fullName": fullNameTextField.text!,
            "password": passwordTextField.text!
        ]
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )
        print("asdasdasd")
        print(bodyData)
        // Change the URLRequest to a POST request
        request.httpMethod = "POST"
        request.httpBody = bodyData
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                // Handle HTTP request error
                print("error=\(error)")
                return
            } else if let data = data {
                print("ok")
                flag = true
                print(flag)
                DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "SignInViewController")
                            
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .flipHorizontal
                            
                    self.present(secondVC, animated: true, completion: nil)
                })
                // Handle HTTP request response
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
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
