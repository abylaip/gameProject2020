//
//  SignInViewController.swift
//  gameProject
//
//  Created by Abyl on 11/9/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var signInButton: UIButton!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var linkToSignUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signInButton.clipsToBounds = true
        self.phoneNumberTextField.clipsToBounds = true
        self.passwordTextField.clipsToBounds = true
        
        self.signInButton.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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

