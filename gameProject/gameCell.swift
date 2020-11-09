//
//  gameCell.swift
//  gameProject
//
//  Created by Abyl on 6/5/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class gameCell: UITableViewCell {

    @IBOutlet var gameImage: UIImageView!
    @IBOutlet var gameName: UILabel!
    @IBOutlet var gameGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
