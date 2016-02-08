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
    
    func attacking(playerNumber: Player.PlayerPositions, damageToEnemy: Bool) {
        let infoText = model.attack(playerNumber: playerNumber, damageToEnemy: damageToEnemy)
        
        playerOneButton.disableButton(forTime: 1)
        playerTwoButton.disableButton(forTime: 1)
        
        infoLabel.text = infoText
        hpLabelSet()
        
        guard let deadPlayer = model.playerDied() else {
            return
        }
        
       NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "startGame", userInfo: nil, repeats: false)
        
        playerOneInfo.hideObject()
        playerTwoInfo.hideObject()
        
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        
        switch deadPlayer {
        case .Left:
            playerOne.hideObject()
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.infoLabel.text = self.model.playerTwo.winner
            })
        case .Right:
            playerTwo.hideObject()
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.infoLabel.text = self.model.playerOne.winner
            })
        }
    }

    @IBAction func playerOneButtonTapped(sender: UIButton!) {
        attacking(.Left, damageToEnemy: sender.alpha == 1)
    }
    
    @IBAction func playerTwoButtonTapped(sender: UIButton!) {
        attacking(.Right, damageToEnemy: sender.alpha == 1)
    }

}
