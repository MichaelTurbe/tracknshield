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
    @IBOutlet weak var textFieldInitiative: UITextField!
    
    var player: Player!
    var playersService: PlayersService!
    
    
    @IBOutlet weak var currentPlayerIndicator: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        playersService = AppDelegate.getPlayersService()
    }
    @IBAction func initiativeTextFieldEditingDidEnd(_ sender: UITextField) {
        print("initiative editing ended")
        let newInitiative = Int(sender.text!)
        player.initiative = newInitiative!
        playersService.updatePlayer(player: player)
    }
    
    @IBAction func textFieldInitiativeValueChanged(_ sender: UITextField) {
        print("initiative value changed")
        let newInitiative = Int(sender.text!)
        player.initiative = newInitiative!
        playersService.updatePlayer(player: player)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell(player: Player) {
        self.player = player
        labelName.text = player.name
        labelHP.text = String(player.hp)
        labelAC.text = String(player.ac)
        labelPassivePerception.text = String(player.passivePerception)
        labelSpellSaveDC.text = String(player.spellSaveDC)
        textFieldInitiative.text = String(player.initiative)
        if(player.isPlayersTurn) {
            self.currentPlayerIndicator.startAnimating()
        } else {
            self.currentPlayerIndicator.stopAnimating()
        }
    }
    
}
