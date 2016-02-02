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
    @IBOutlet weak var infoLabel: UILabel!
    
    var model: Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
    }
    
    func startGame() {
        model = Model()
        
        playerOne.image = model.playerOneImage
        playerTwo.image = model.playerTwoImage
        
        showObject(playerOne)
        showObject(playerTwo)
        
        hpLabelSet()
    }
    
    func hpLabelSet() {
        playerOneHP.text = model.playerOne.hpForLabel
        playerTwoHP.text = model.playerTwo.hpForLabel
    }
    
    func showObject(object: UIImageView) {
        object.hidden = false
    }
    
    func hideObject(object: UIImageView) {
        object.hidden = true
    }
    
    func attacking(playerNumber: Player.PlayerPositions) {
        let infoText = model.attack(playerNumber: playerNumber)
        
        infoLabel.text = infoText
        hpLabelSet()
        
        guard let deadPlayer = model.playerDied() else {
            return
        }
        
       NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "startGame", userInfo: nil, repeats: false)
        
        switch deadPlayer {
        case .Left: hideObject(playerOne)
        case .Right: hideObject(playerTwo)
        }
    }

    @IBAction func playerOneButtonTapped(sender: AnyObject) {
        attacking(.Left)
    }
    
    @IBAction func playerTwoButtonTapped(sender: AnyObject) {
        attacking(.Right)
    }

}
