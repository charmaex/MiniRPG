//
//  ViewController.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 01.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class Controller: UIViewController {
    
    @IBOutlet weak var playerOne: UIImageView!
    @IBOutlet weak var playerTwo: UIImageView!
    @IBOutlet weak var playerOneButton: AttackButton!
    @IBOutlet weak var playerTwoButton: AttackButton!
    @IBOutlet weak var playerOneHP: UILabel!
    @IBOutlet weak var playerTwoHP: UILabel!
    @IBOutlet weak var playerOneInfo: UIView!
    @IBOutlet weak var playerTwoInfo: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var model: Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
    }
    
    func startGame() {
        model = Model()
        
        infoLabel.text = "Start the fight!"
        
        playerOne.image = model.playerOneImage
        playerTwo.image = model.playerTwoImage
        
        playerOne.showObject()
        playerTwo.showObject()
        
        playerOneInfo.showObject()
        playerTwoInfo.showObject()
        
        hpLabelSet()
    }
    
    func hpLabelSet() {
        playerOneHP.text = model.playerOne.hpForLabel
        playerTwoHP.text = model.playerTwo.hpForLabel
    }
    
    @IBAction func attackBtn(sender: UIButton!) {
        guard let playerNumber = Player.PlayerPositions(rawValue: sender.tag) else {
            return
        }
        let damageToEnemy = sender.alpha == 1
        let infoText = model.attack(playerNumber: playerNumber, damageToEnemy: damageToEnemy)
        
        let rndTime = 1 + Double(arc4random_uniform(10)) / 10 //random Time 1-2seconds
        
        playerOneButton.disableButton(forTime: rndTime)
        playerTwoButton.disableButton(forTime: rndTime)
        
        infoLabel.text = infoText
        hpLabelSet()
        
        guard let deadPlayer = model.playerDied() else {
            return
        }
        
       NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "startGame", userInfo: nil, repeats: false)
        
        playerOneInfo.hideObject()
        playerTwoInfo.hideObject()
        
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        var message: String
        
        switch deadPlayer {
        case .Left:
            playerOne.hideObject()
            message = self.model.playerTwo.winner
        case .Right:
            playerTwo.hideObject()
            message = self.model.playerOne.winner
        }
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            self.infoLabel.text = message
        })
    }

}
