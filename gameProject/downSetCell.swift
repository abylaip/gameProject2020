//
//  downSetCell.swift
//  gameProject
//
//  Created by Abyl on 8/4/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class downSetCell: UITableViewCell {

    @IBOutlet var setIcon: UIImageView!
    @IBOutlet var setLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let secondVC = storyboard.instantiateViewController(identifier: "ViewController")
//                    
//        secondVC.modalPresentationStyle = .fullScreen
//        secondVC.modalTransitionStyle = .coverVertical
//                    
//        present(secondVC, animated: true, completion: nil)
        // Configure the view for the selected state
    }

}
