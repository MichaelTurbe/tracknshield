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
    func getAllPlayers() -> [Player] {
        return players
    }
    func addPlayer(player: Player) -> () {
        players.append(player)
    }
}
