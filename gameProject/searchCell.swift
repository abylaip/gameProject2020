//
//  searchCell.swift
//  gameProject
//
//  Created by Abyl on 6/17/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class searchCell: UITableViewCell {

    @IBOutlet var searchImage: UIImageView!
    @IBOutlet var searchName: UILabel!
    @IBOutlet var searchGenre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
