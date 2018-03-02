//
//  AddPlayerViewController.swift
//  tracknshield
//
//  Created by Michael Turbe on 2/27/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController {

    @IBOutlet weak var textFieldPlayerName: UITextField!
    @IBOutlet weak var textFieldHP: UITextField!
    @IBOutlet weak var textFieldAC: UITextField!
    @IBOutlet weak var textFieldPassivePerception: UITextField!
    @IBOutlet weak var textFieldSpellSaveDC: UITextField!
    @IBOutlet weak var buttonDone: UIButton!
    var playersService: PlayersService!
    var playersUpdateHandler: PlayersUpdateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playersService = AppDelegate.getPlayersService()
        // Do any additional setup after loading the view.
    }

    @IBAction func doneButtonPressed(_ sender: Any) {
        let playerName = self.textFieldPlayerName.text
        let hp = Int(self.textFieldHP.text!)
        let ac = Int(self.textFieldAC.text!)
        let spellSaveDC = Int(self.textFieldSpellSaveDC.text!)
        let passivePerception = Int(self.textFieldPassivePerception.text!)
        let player:Player = Player(name: playerName!, hp: hp!, ac: ac!, spellSaveDC: spellSaveDC!, passivePerception:passivePerception!)
        self.playersService.addPlayer(player: player)
        self.playersUpdateHandler?.handlePlayersUpdate()
        self.dismiss(animated: true, completion: nil)
    }
    
    func setPlayersUpdateHandler(delegate: PlayersUpdateDelegate) {
        print("setting delgate")
        self.playersUpdateHandler = delegate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
