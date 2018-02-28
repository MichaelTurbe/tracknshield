//
//  PlayerRepositoryProtocol.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/26/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import Foundation

protocol PlayerRepositoryProtocol : class {
    func getAllPlayers() -> [Player]
    func addPlayer(player: Player) -> ()
}
