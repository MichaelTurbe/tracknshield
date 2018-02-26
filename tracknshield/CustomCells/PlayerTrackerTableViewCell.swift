//
//  PlayerTrackerTableViewCell.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/25/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import UIKit

class PlayerTrackerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var playerNameLabel: UILabel!
}
