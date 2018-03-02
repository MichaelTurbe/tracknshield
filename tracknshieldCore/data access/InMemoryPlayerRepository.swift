//
//  InMemoryPlayerRepository.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/26/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import Foundation

class InMemoryPlayerRepository : PlayerRepositoryProtocol {
    var players: [Player] = [Player]()
    init() {
        var p1 = Player(name: "Toad Lord", hp: 67, ac: 19, spellSaveDC: 15, passivePerception: 16)
        var p2 = Player(name: "Somewhere", hp: 51, ac: 14, spellSaveDC: 16, passivePerception: 12)
        var p3 = Player(name: "Berric", hp: 87, ac: 18, spellSaveDC: 16, passivePerception: 12)
        var p4 = Player(name: "Purr", hp: 52, ac: 17, spellSaveDC: 13, passivePerception: 16)
        var p5 = Player(name: "Thoros", hp: 77, ac: 19, spellSaveDC: 16, passivePerception: 14)
        var p6 = Player(name: "Eborisk", hp: 88, ac: 19, spellSaveDC: 14, passivePerception: 15)
        players.append(p1)
        players.append(p2)
        players.append(p3)
        players.append(p4)
        players.append(p5)
        players.append(p6)
    }
    
    func getAllPlayers() -> [Player] {
        return players
    }
    func addPlayer(player: Player) -> () {
        print("adding player")
        players.append(player)
    }
}
