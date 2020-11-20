//
//  SellGameViewController.swift
//  gameProject
//
//  Created by Abyl on 11/17/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

@available(iOS 14.0, *)
class SellGameViewController: UIViewController{

    @IBOutlet var gameAvatar: UIImageView!
    @IBOutlet var gameName: UILabel!
    @IBOutlet var gameGenre: UILabel!
    @IBOutlet var gameDescription: UITextView!
    @IBOutlet var publishMode: UISegmentedControl!
    @IBOutlet var gamePriceLabel: UILabel!
    @IBOutlet var gamePrice: UITextField!
    @IBOutlet var gamePriceBottomBorder: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gamePriceLabel.isHidden = true
        self.gamePrice.isHidden = true
        self.gamePriceBottomBorder.isHidden = true
        publishMode.addTarget(self, action: #selector(actionForSegment), for: .valueChanged)
    }
    @objc func actionForSegment() {
        let segment = publishMode.selectedSegmentIndex
        if segment == 0 {
            self.gamePriceLabel.isHidden = true
            self.gamePrice.isHidden = true
            self.gamePriceBottomBorder.isHidden = true
        }
        if segment == 1 {
            self.gamePriceLabel.isHidden = false
            self.gamePrice.isHidden = false
            self.gamePriceBottomBorder.isHidden = false
        }
    }
    func setAction(_ action: UIAction, forSegmentAt segment: Int){
        if segment == 0 {
            self.gamePriceLabel.isHidden = true
            self.gamePrice.isHidden = true
            self.gamePriceBottomBorder.isHidden = true
        }
        if segment == 1 {
            self.gamePriceLabel.isHidden = false
            self.gamePrice.isHidden = false
            self.gamePriceBottomBorder.isHidden = false
        }
    }
    @IBAction func submitButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
