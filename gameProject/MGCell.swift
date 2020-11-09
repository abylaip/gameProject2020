//
//  MGCell.swift
//  gameProject
//
//  Created by Abyl on 7/12/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class MGCell: UITableViewCell {

    @IBOutlet var heart: UIImageView!
    @IBOutlet var mgLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
