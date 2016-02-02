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
    
    enum PlayerTypes {
        case Orc, Soldier
    }
    
    var playerOne: Player!
    var playerTwo: Player!
    
    var playerOneImage: UIImage? {
        return UIImage(named: playerOne.imageName)
    }
    
    var playerTwoImage: UIImage? {
        return UIImage(named: playerTwo.imageName)
    }
    
    init() {
        // create another init to add other possible combinations
        
        createCharacters(charOne: nil, nameOne: "Player 1", charTwo: nil, nameTwo: "Player 2")
    }
    
    private mutating func createCharacters(charOne charOne: PlayerTypes?, nameOne: String, charTwo: PlayerTypes?, nameTwo: String) {
        
        playerOne = createCharacter(char: charOne, name: nameOne, playerNumber: .Left)
        playerTwo = createCharacter(char: charTwo, name: nameTwo, playerNumber: .Right)
        
    }
    
    private func createCharacter(char char: PlayerTypes?, name: String, playerNumber: Player.PlayerPositions) -> Player {
        
        guard let c = char else {
            switch playerNumber {
            case .Left: return Orc(playerNumber: playerNumber, name: name)
            case .Right: return Soldier(playerNumber: playerNumber, name: name)
            }
        }
        
        switch c {
        case .Orc: return Orc(playerNumber: playerNumber, name: name)
        case .Soldier: return Soldier(playerNumber: playerNumber, name: name)
        }
        
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
        
        // add attacking sound
        // maybe special sound if critical
        // maybe screaming sound as well if damaged
        
        return outputMessage
    }
    
}
