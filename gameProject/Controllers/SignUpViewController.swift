//
//  SignUpViewController.swift
//  gameProject
//
//  Created by Abyl on 11/11/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSignUp(_ sender: Any) {//to Sign In Page
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SignInViewController")
                
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .flipHorizontal
                
        present(secondVC, animated: true, completion: nil)
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
