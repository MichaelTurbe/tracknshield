//
//  PlayerInitiativeTableViewCell.swift
//  tracknshield
//
//  Created by Michael Turbe on 3/2/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import UIKit

class PlayerInitiativeTableViewCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelHP: UILabel!
    @IBOutlet weak var labelAC: UILabel!
    @IBOutlet weak var labelPassivePerception: UILabel!
    @IBOutlet weak var labelSpellSaveDC: UILabel!
    
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
        labelPassivePerception.text = String(player.passivePerception)
        labelSpellSaveDC.text = String(player.spellSaveDC)
    }
    
}
