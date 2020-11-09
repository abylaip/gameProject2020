//
//  upFavCell.swift
//  gameProject
//
//  Created by Abyl on 8/3/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class upFavCell: UITableViewCell {

    @IBOutlet var favIcon: UIImageView!
    @IBOutlet var favLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
