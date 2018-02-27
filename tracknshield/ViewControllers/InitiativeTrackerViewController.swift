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
    var playersService: PlayersService!
    @IBOutlet weak var buttonAddPlayer: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewInitiative.register(UINib(nibName: "PlayerTrackerTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        // players = foodItemService.getAllFoodItemsByCategory(category:category!)
        tableViewInitiative.dataSource = self
        tableViewInitiative.delegate = self
        tableViewInitiative.rowHeight = 120

        // Do any additional setup after loading the view.
        playersService = AppDelegate.getPlayersService()
        players = playersService.getAllPlayers()
        print("view did loadz")
        
    }
    @IBAction func addPlayerButtonSelecte4d(_ sender: Any) {
        print("wtf")
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddPlayer")
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        popover.barButtonItem = sender as? UIBarButtonItem
        present(vc, animated: true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
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
