//
//  Model.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 01.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation
import UIKit

struct Model {
    
    var playerOne: Player
    var playerTwo: Player
    
    var playerOneImage: UIImage? {
        return UIImage(named: playerOne.imageName)
    }
    
    var playerTwoImage: UIImage? {
        return UIImage(named: playerTwo.imageName)
    }
    
    init() {
        playerOne = Orc(playerNumber: .Left)
        playerTwo = Soldier(playerNumber: .Right)
    }
    
    func attack(playerNumber player: Player.PlayerPositions) {
        
    }
    
}