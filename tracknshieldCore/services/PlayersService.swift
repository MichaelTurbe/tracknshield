//
//  PlayersService.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/26/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import Foundation

class PlayersService {
    let playersRepository: PlayersRepositoryProtocol
    
    init(playersRepository: PlayersRepositoryProtocol) {
        self.playersRepository = playersRepository
    }
    
    func getAllPlayers() -> [Player] {
        let allPlayers = playersRepository.getAllPlayers()
        returna allPlayers
    }
    
    func addPlayer(player: Player) -> () {
        playersRepository.addPlayer(player)
    }
}
