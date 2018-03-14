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
    var currentInitiativePlayer: Player!
    var currentlySelectedPlayer: Player!
    var players: [Player] = [Player]()
    @IBOutlet weak var tableViewInitiative: UITableView!
    private let reuseIdentifier = "initiativeCell"
    var playersService: PlayersService!
    @IBOutlet weak var buttonAddPlayer: UIBarButtonItem!
    @IBOutlet weak var buttonStartTurnTracker: UIBarButtonItem!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var textFieldInitiative: UITextField!
    @IBOutlet weak var textFieldHP: UITextField!
    @IBOutlet weak var buttonNextPlayer: UIBarButtonItem!
    @IBOutlet weak var buttonDeletePlayer: UIButton!
    
    @IBOutlet weak var buttonInitiative: UIButton!
    
    
    
    @IBAction func buttonDeletePlayerPressed(_ sender: UIButton) {
        playersService.deletePlayer(player: currentlySelectedPlayer)
        // currentlySelectedPlayer = players[0]
        reloadTableData()
    }
    @IBAction func textFieldInitiativeChanged(_ sender: UITextField) {
        let newInitiative = Int(sender.text!)
        currentlySelectedPlayer.initiative = newInitiative!
        playersService.updatePlayer(player: currentlySelectedPlayer)
        reloadTableData()
    }
    
    @IBAction func textFieldHPChanged(_ sender: UITextField) {
        let newHP = Int(sender.text!)
        currentlySelectedPlayer.hp = newHP!
        playersService.updatePlayer(player: currentlySelectedPlayer)
        reloadTableData()
    }
    
    @IBAction func startTurnTrackerPressed(_ sender: UIBarButtonItem) {
        currentInitiativePlayer = players[0]
        currentInitiativePlayer.isPlayersTurn = true
        playersService.updatePlayer(player: currentInitiativePlayer)
        reloadTableData()
    }
    
    @IBAction func showPopoverKeyboard(_ sender: Any) {
        print("show that shit")
       
    }
    
    @IBAction func buttonNextPlayerPressed(_ sender: UIBarButtonItem) {
        if let index = players.index(of: currentInitiativePlayer){
            var currentPlayerIndex = Int(index)
            currentInitiativePlayer.isPlayersTurn = false
            if(currentPlayerIndex == (players.count - 1)) {
                // go back to the beginning
                currentInitiativePlayer = players[0]
                currentInitiativePlayer.isPlayersTurn = true
                playersService.updatePlayer(player: currentInitiativePlayer)
                reloadTableData()
            }
            else {
                // go back to the beginning
                currentPlayerIndex = currentPlayerIndex + 1
                currentInitiativePlayer = players[currentPlayerIndex]
                currentInitiativePlayer.isPlayersTurn = true
                playersService.updatePlayer(player: currentInitiativePlayer)
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
            self.players = [Player]()
            self.tableViewInitiative.reloadData()
            self.players = self.playersService.getAllPlayers()
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
        currentlySelectedPlayer = players[0]
        setPlayerDetail(player: currentlySelectedPlayer)
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
        if(segue.destination is AddPlayerViewController){
            let addPlayerViewController = segue.destination as! AddPlayerViewController
            addPlayerViewController.setPlayersUpdateHandler(delegate: self)
        }
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
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
        currentlySelectedPlayer = self.players[indexPath.row]
        setPlayerDetail(player: currentlySelectedPlayer)
    }
    
    func setPlayerDetail(player: Player){
        playerNameLabel.text = player.name
        buttonInitiative.setTitle(String(player.initiative), for: UIControlState.normal)
        textFieldHP.text = String(player.hp)
        if(player.isPartyMember) {
            buttonDeletePlayer.isHidden = true
        }
        else {
            buttonDeletePlayer.isHidden = false
        }
    }
}
