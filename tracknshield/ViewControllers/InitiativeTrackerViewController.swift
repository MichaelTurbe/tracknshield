//
//  InitiativeTrackerController.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/25/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import Foundation
import UIKit

class InitiativeTrackerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var players: [Player] = [Player]()
    @IBOutlet weak var tableViewInitiative: UITableView!
    private let reuseIdentifier = "initiativeCell"
    // private var playersService: PlayersService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewInitiative.register(UINib(nibName: "PlayerTrackerTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        // players = foodItemService.getAllFoodItemsByCategory(category:category!)
        tableViewInitiative.dataSource = self
        tableViewInitiative.delegate = self
        tableViewInitiative.rowHeight = 120
        // playersService = AppDelegate.getPlayersService()
        // players = playersService.getAllPlayers()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let player = players[indexPath.row]
        // selectedItem = foodItem
        let cell : PlayerTrackerTableViewCell = tableViewInitiative.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PlayerTrackerTableViewCell
        
        // Configure the cell
        // cell.setUpCell(foodItem: foodItem)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        // handle tap events
//        let foodItem = foodItems[indexPath.row]
//        print("You selected cell #\(foodItem.name)!")
//        //self.performSegue(withIdentifier: "categoryToFoodItemsSegue", sender: self)
//    }
    
}
