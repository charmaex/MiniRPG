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
    
    var playerOne: Player!
    var playerTwo: Player!
    
    var playerOneImage: UIImage? {
        return UIImage(named: playerOne.imageName)
    }
    
    var playerTwoImage: UIImage? {
        return UIImage(named: playerTwo.imageName)
    }
    
    init() {
        createCharacters()
    }
    
    mutating func createCharacters() {
        playerOne = Orc(playerNumber: .Left, name: "Player 1")
        playerTwo = Soldier(playerNumber: .Right, name: "Player 2")
    }
    
    func playerDied() -> Player.PlayerPositions? {
        guard playerOne.isAlive else {
            return .Left
        }
        
        guard playerTwo.isAlive else {
            return .Right
        }
        
        return nil
    }
    
    func attack(playerNumber player: Player.PlayerPositions) -> String {
        let defender: Player = player == .Left ? playerTwo : playerOne
        let attacker: Player = player == .Left ? playerOne : playerTwo
    
        let (attackPower, critical) = attacker.attackPower
        
        var (outputMessage, damaged) = defender.defendAttack(damageInput: attackPower, playerName: attacker.name)
        
        if damaged && critical {
            outputMessage = "CRITICAL: \(outputMessage)"
        }
        
        return outputMessage
    }
    
}
