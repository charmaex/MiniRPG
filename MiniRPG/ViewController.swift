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
        
        model = Model()
        
        playerOne.image = model.playerOneImage
        playerTwo.image = model.playerTwoImage
        
        hpLabelSet()
    }
    
    func hpLabelSet() {
        playerOneHP.text = model.playerOne.hpForLabel
        playerTwoHP.text = model.playerTwo.hpForLabel
    }
    
    func attacking(playerNumber: Player.PlayerPositions) {
        model.attack(playerNumber: playerNumber)
        
        hpLabelSet()
    }

    @IBAction func playerOneButtonTapped(sender: AnyObject) {
        attacking(.Left)
    }
    
    @IBAction func playerTwoButtonTapped(sender: AnyObject) {
        attacking(.Right)
    }

}

