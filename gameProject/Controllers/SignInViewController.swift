//
//  SignInViewController.swift
//  gameProject
//
//  Created by Abyl on 11/9/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit
import PhoneNumberKit

class SignInViewController: UIViewController {

    @IBOutlet var signInButton: UIButton!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var linkToSignUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signInButton.clipsToBounds = true
        self.passwordTextField.clipsToBounds = true
        
        phoneNumberTextField.text = "+7"
        
        phoneNumberTextField.delegate = self
        phoneNumberTextField.keyboardType = .numberPad
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toSignUpPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SignUpViewController")
            
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .flipHorizontal
                
        present(secondVC, animated: true, completion: nil)



    }
    @IBAction func didSignIn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "ViewController")
            
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
                
        present(secondVC, animated: true, completion: nil)


    }
//    func getPhone() -> String{
//        var phone = self.text!
//        phone = phone.replacingOccurrences(of: " ", with: "")
//        phone = phone.prefix(1) == "+" ? String(phone.suffix(phone.count - 1)) : phone
//        return phone
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension SignInViewController: UITextFieldDelegate {
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
//extension String {
//    func applyPatternOnNumbers(pattern: String, replacmentCharacter: Character) -> String {
//        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
//        for index in 0 ..< pattern.count {
//            guard index < pureNumber.count else { return pureNumber }
//            let stringIndex = String.Index(encodedOffset: index)
//            let patternCharacter = pattern[stringIndex]
//            guard patternCharacter != replacmentCharacter else { continue }
//            pureNumber.insert(patternCharacter, at: stringIndex)
//        }
//        return pureNumber
//    }
//}

