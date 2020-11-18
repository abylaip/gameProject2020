//
//  SellGameViewController.swift
//  gameProject
//
//  Created by Abyl on 11/17/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class SellGameViewController: UIViewController {

    @IBOutlet var callButton: UIButton!
    @IBOutlet var whatsAppButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callButton.clipsToBounds = true
        self.whatsAppButton.clipsToBounds = true
        
        callButton.layer.borderWidth = 3
        whatsAppButton.layer.borderWidth = 3
        callButton.layer.borderColor = #colorLiteral(red: 0.1183889434, green: 0.8439540267, blue: 0.4751093984, alpha: 1)
        whatsAppButton.layer.borderColor = #colorLiteral(red: 0.1183889434, green: 0.8439540267, blue: 0.4751093984, alpha: 1)
//        callButton.layer.borderColor = CGColor(red: 233, green: 68, blue: 106, alpha: 1)
//        whatsAppButton.layer.borderColor = CGColor(red: 233, green: 68, blue: 106, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doWhatsApp(_ sender: Any) {
        let message = "First Whatsapp Share & https://www.google.co.in"
         var queryCharSet = NSCharacterSet.urlQueryAllowed

         // if your text message contains special char like **+ and &** then add this line
         queryCharSet.remove(charactersIn: "+&")

         if let escapedString = message.addingPercentEncoding(withAllowedCharacters: queryCharSet) {
             if let whatsappURL = URL(string: "whatsapp://send?text=\(escapedString)") {
                 if UIApplication.shared.canOpenURL(whatsappURL) {
                     UIApplication.shared.open(whatsappURL, options: [: ], completionHandler: nil)
                 } else {
                     debugPrint("please install WhatsApp")
                 }
             }
         }
    }
    
    @IBAction func doCall(_ sender: Any) {
//        guard let numberString = sender.titleLabel?.text, let url = URL(string: "telprompt://\(numberString)") else {
//                return
//        }
//        UIApplication.shared.open(url)
    }
}
