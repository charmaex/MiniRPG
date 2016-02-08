//
//  Model.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 01.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

struct Model {
    
    enum PlayerTypes {
        case Orc, Soldier
    }
    
    var playerOne: Player!
    var playerTwo: Player!
    
    var attackSound: AVAudioPlayer?
    
    var playerOneImage: UIImage? {
        return UIImage(named: playerOne.imageName)
    }
    
    var playerTwoImage: UIImage? {
        return UIImage(named: playerTwo.imageName)
    }
    
    init() {
        // create another init to add other possible combinations
        
        createCharacters(charOne: nil, nameOne: "Player 1", charTwo: nil, nameTwo: "Player 2")
        createSounds()
    }
    
    private mutating func createSounds() {
        guard let path = NSBundle.mainBundle().pathForResource("attack", ofType: "wav") else {
            return
        }
        
        do {
            try attackSound = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path))
        } catch {
            print("Couldn't find attack.wav")
            return
        }
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
    
    func attack(playerNumber player: Player.PlayerPositions, damageToEnemy: Bool) -> String {
        let attacker: Player = player == .Left ? playerOne : playerTwo
        let defender: Player = player == .Left ? playerTwo : playerOne
        
        attackSound?.play()
        
        if damageToEnemy {
            return attackNormal(attacker, defender: defender)
        }
        
        return attacker.attackYourself()
    }
    
    private func attackNormal(attacker: Player, defender: Player) -> String {
        let (attackPower, critical) = attacker.attackPower
        
        let (outputMessage, damaged) = defender.defendAttack(damageInput: attackPower, playerName: attacker.name)
        
        if damaged && critical {
            return "CRITICAL: \(outputMessage)"
        }
        
        return outputMessage
    }
    
}
