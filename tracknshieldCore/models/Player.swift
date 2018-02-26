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
    
    init(name: String, initiative: Int) {
        self.name = name
        self.initiative = initiative
    }
}
