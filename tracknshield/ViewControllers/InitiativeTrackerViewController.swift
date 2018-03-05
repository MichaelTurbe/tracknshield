//
//  InitiativeTrackerController.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/25/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import Foundation
import UIKit

class InitiativeTrackerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PlayersUpdateDelegate {
    var currentlySelectedPlayer: Player!
    var players: [Player] = [Player]()
    @IBOutlet weak var tableViewInitiative: UITableView!
    private let reuseIdentifier = "initiativeCell"
    var playersService: PlayersService!
    @IBOutlet weak var buttonAddPlayer: UIBarButtonItem!
    @IBOutlet weak var playerDetailView: UIView!
    @IBOutlet weak var buttonStartTurnTracker: UIBarButtonItem!
    
    @IBOutlet weak var buttonNextPlayer: UIBarButtonItem!
    @IBAction func startTurnTrackerPressed(_ sender: UIBarButtonItem) {
        currentlySelectedPlayer = players[0]
        currentlySelectedPlayer.isPlayersTurn = true
        playersService.updatePlayer(player: currentlySelectedPlayer)
        reloadTableData()
    }
    
    @IBAction func buttonNextPlayerPressed(_ sender: UIBarButtonItem) {
        if let index = players.index(of: currentlySelectedPlayer){
            var currentPlayerIndex = Int(index)
            currentlySelectedPlayer.isPlayersTurn = false
            if(currentPlayerIndex == (players.count - 1)) {
                // go back to the beginning
                currentlySelectedPlayer = players[0]
                currentlySelectedPlayer.isPlayersTurn = true
                playersService.updatePlayer(player: currentlySelectedPlayer)
                reloadTableData()
            }
            else {
                // go back to the beginning
                currentPlayerIndex = currentPlayerIndex + 1
                currentlySelectedPlayer = players[currentPlayerIndex]
                currentlySelectedPlayer.isPlayersTurn = true
                playersService.updatePlayer(player: currentlySelectedPlayer)
                reloadTableData()
            }
        }
    }
    @IBAction func sortInitiativePressed(_ sender: Any) {
        print("sort that shit")
        let sortedPlayers = playersService.sortPlayersByInitiative()
        reloadTableData(newPlayers: sortedPlayers)
    }
    
    func reloadTableData(newPlayers: [Player]) {
        DispatchQueue.main.async {
            self.players = [Player]()
            self.tableViewInitiative.reloadData()
            self.players = newPlayers
            self.tableViewInitiative.reloadData()
        }
    }
    
    func reloadTableData() {
        DispatchQueue.main.async {
            self.tableViewInitiative.reloadData()
        }
    }
    
    override func viewDidLoad() {
        print("view did load!!!!")
        super.viewDidLoad()

        tableViewInitiative.register(UINib(nibName: "PlayerInitiativeTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
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
        let addPlayerViewController = storyboard.instantiateViewController(withIdentifier: "AddPlayer") as! AddPlayerViewController
        addPlayerViewController.setPlayersUpdateHandler(delegate: self)
        addPlayerViewController.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover: UIPopoverPresentationController = addPlayerViewController.popoverPresentationController!
        popover.barButtonItem = sender as? UIBarButtonItem
        present(addPlayerViewController, animated: true, completion:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let addPlayerViewController = segue.destination as! AddPlayerViewController
        addPlayerViewController.setPlayersUpdateHandler(delegate: self)
    }
    
    func handlePlayersUpdate() {
        print("got into the update handler")
        // update the damed grid
        let newPlayers = playersService.getAllPlayers()
        reloadTableData(newPlayers: newPlayers)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = self.players[indexPath.row]
        // selectedItem = foodItem
        let cell : PlayerInitiativeTableViewCell = tableViewInitiative.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PlayerInitiativeTableViewCell
        
        // Configure the cell
        cell.setUpCell(player: player)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = self.players[indexPath.row]
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        // handle tap events
//        let foodItem = foodItems[indexPath.row]
//        print("You selected cell #\(foodItem.name)!")
//        //self.performSegue(withIdentifier: "categoryToFoodItemsSegue", sender: self)
//    }
    
}
