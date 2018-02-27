//
//  Player.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/25/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import Foundation

class Player {
    var name: String = ""
    var initiative: Int = 0
    var hp: Int = 0
    var ac: Int = 10
    var spellSaveDC: Int = 8
    var passivePerception: Int = 8
    
    init(name: String, initiative: Int, hp: Int, ac: Int, spellSaveDC: Int, passivePerception: Int) {
        self.name = name
        self.initiative = initiative
        self.hp = hp
        self.ac = ac
        self.spellSaveDC = spellSaveDC
        self.passivePerception = passivePerception
    }
}
