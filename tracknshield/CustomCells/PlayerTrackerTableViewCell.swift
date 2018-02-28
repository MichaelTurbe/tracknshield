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
    @IBOutlet weak var labelAC: UILabel!
    @IBOutlet weak var labelInitiative: UILabel!
    @IBOutlet weak var labelPassivePerception: UILabel!
    @IBOutlet weak var labelSpellSaveDC: UILabel!
    
    @IBOutlet weak var viewSpellSaveDC: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(player: Player) {
        labelName.text = player.name
        labelHP.text = String(player.hp)
        labelAC.text = String(player.ac)
        labelInitiative.text = String(player.initiative)
        labelPassivePerception.text = String(player.passivePerception)
        labelSpellSaveDC.text = String(player.spellSaveDC)
    }
    
    
    
    @IBOutlet weak var playerNameLabel: UILabel!
}
