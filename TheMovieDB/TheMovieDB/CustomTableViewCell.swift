//
//  CustomTableViewCell.swift
//  TheMovieDB
//
//  Created by Juan Antonio Naranjo Garcia on 9/1/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
//    @IBOutlet var imageCell: UIImageView!
//    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
