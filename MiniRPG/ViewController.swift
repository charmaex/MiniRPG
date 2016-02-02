//
//  ViewController.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 01.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerOne: UIImageView!
    @IBOutlet weak var playerTwo: UIImageView!
    @IBOutlet weak var playerOneButton: UIButton!
    @IBOutlet weak var playerTwoButton: UIButton!
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
        
        showObject(playerOne)
        showObject(playerTwo)
        
        showObject(playerOneInfo)
        showObject(playerTwoInfo)
        
        hpLabelSet()
    }
    
    func hpLabelSet() {
        playerOneHP.text = model.playerOne.hpForLabel
        playerTwoHP.text = model.playerTwo.hpForLabel
    }
    
    func showObject(object: UIView) {
        // add some animation here
        
        object.hidden = false
    }
    
    func hideObject(object: UIView) {
        // add some animation here
        
        object.hidden = true
    }
    
    func disableButton(object: UIButton, forTime: Double) {
        object.enabled = false
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(forTime * Double(NSEC_PER_SEC)))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            object.enabled = true
        })
    }
    
    func attacking(playerNumber: Player.PlayerPositions) {
        let infoText = model.attack(playerNumber: playerNumber)
        
        disableButton(playerOneButton, forTime: 1)
        disableButton(playerTwoButton, forTime: 1)
        
        infoLabel.text = infoText
        hpLabelSet()
        
        guard let deadPlayer = model.playerDied() else {
            return
        }
        
       NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "startGame", userInfo: nil, repeats: false)
        
        hideObject(playerOneInfo)
        hideObject(playerTwoInfo)
        
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        
        switch deadPlayer {
        case .Left:
            hideObject(playerOne)
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.infoLabel.text = "\(self.model.playerTwo.name) won!"
            })
        case .Right:
            hideObject(playerTwo)
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.infoLabel.text = "\(self.model.playerOne.name) won!"
            })
        }
    }

    @IBAction func playerOneButtonTapped(sender: AnyObject) {
        attacking(.Left)
    }
    
    @IBAction func playerTwoButtonTapped(sender: AnyObject) {
        attacking(.Right)
    }

}
