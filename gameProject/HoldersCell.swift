//
//  gameCell.swift
//  gameProject
//
//  Created by Abyl on 6/5/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class HoldersCell: UITableViewCell {

    @IBOutlet var holderImage: UIImageView!
    @IBOutlet var holderName: UILabel!
    @IBOutlet var holderNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
