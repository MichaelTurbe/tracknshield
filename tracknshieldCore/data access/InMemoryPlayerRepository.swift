//
//  InMemoryPlayerRepository.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/26/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import Foundation

class InMemoryPlayerRepository : PlayerRepositoryProtocol {
    var players: Dictionary<String, Player> = Dictionary<String, Player>()
    init() {
        var p1 = Player(name: "Toad Lord", hp: 67, ac: 19, spellSaveDC: 15, passivePerception: 16)
        var p2 = Player(name: "Somewhere", hp: 51, ac: 14, spellSaveDC: 16, passivePerception: 12)
        var p3 = Player(name: "Berric", hp: 87, ac: 18, spellSaveDC: 16, passivePerception: 12)
        var p4 = Player(name: "Purr", hp: 52, ac: 17, spellSaveDC: 13, passivePerception: 16)
        var p5 = Player(name: "Thoros", hp: 77, ac: 19, spellSaveDC: 16, passivePerception: 14)
        var p6 = Player(name: "Eborisk", hp: 88, ac: 19, spellSaveDC: 14, passivePerception: 15)
        p1.isPartyMember = true
        p2.isPartyMember = true
        p3.isPartyMember = true
        p4.isPartyMember = true
        p5.isPartyMember = true
        p6.isPartyMember = true
        
        players[p1.name] = p1
        players[p2.name] = p2
        players[p3.name] = p3
        players[p4.name] = p4
        players[p5.name] = p5
        players[p6.name] = p6

    }
    
    func getAllPlayers() -> [Player] {
        var outputPlayers = [Player]()
        for item in players {
            outputPlayers.append(players[item.key]!)
        }
        return outputPlayers
    }
    func addPlayer(player: Player) -> () {
        print("adding player")
        players[player.name] = player
    }
    
    func updatePlayer(player: Player) -> () {
        print("updating player")
        print(player.initiative)
        players[player.name] = player
    }
    
    func deletePlayer(player: Player) -> () {
        players.remove(at: <#T##Dictionary<String, Player>.Index#>)
    }
}
