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
    var ac: Int = 0
    var spellSaveDC: Int = 0
    var passivePerception: Int = 0
    
    init(name: String, hp: Int, ac: Int, spellSaveDC: Int, passivePerception: Int) {
        self.name = name
        self.hp = hp
        self.ac = ac
        self.spellSaveDC = spellSaveDC
        self.passivePerception = passivePerception
    }
}
