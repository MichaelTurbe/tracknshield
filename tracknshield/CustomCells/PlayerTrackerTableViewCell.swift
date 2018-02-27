//
//  PlayerTrackerTableViewCell.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/25/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import UIKit

class PlayerTrackerTableViewCell: UITableViewCell {
    @IBOutlet weak var labelHP: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var viewHP: UIView!
    @IBOutlet weak var viewAC: UIView!
    @IBOutlet weak var viewPassivePerception: UIView!
    
    @IBOutlet weak var viewSpellSaveDC: UIView!
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
