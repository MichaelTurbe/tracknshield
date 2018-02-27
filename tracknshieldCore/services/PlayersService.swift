//
//  PlayersService.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/26/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import Foundation

class PlayersService {
    let playersRepository: PlayerRepositoryProtocol!
    
    init(playersRepository: PlayerRepositoryProtocol) {
        self.playersRepository = playersRepository
    }
    
    func getAllPlayers() -> [Player] {
        let allPlayers = playersRepository.getAllPlayers()
        return allPlayers
    }
    
    func addPlayer(player: Player) -> () {
        playersRepository.addPlayer(player: player)
    }
}
