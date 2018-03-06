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
        print("adding player")
        playersRepository.addPlayer(player: player)
    }
    
    func updatePlayer(player: Player) -> () {
        print("updating player")
        playersRepository.updatePlayer(player: player)
    }
    
    func sortPlayersByInitiative() -> [Player] {
        let allPlayers = self.playersRepository.getAllPlayers()
        let sorted = allPlayers.sorted(by: {$0.initiative > $1.initiative})
        return sorted
    }
    
    func deletePlayer(player: Player) -> () {
        print("deleting player")
        playersRepository.deletePlayer(player: player)
    }
    
}
