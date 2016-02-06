//
//  Player.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 01.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

class Player {
    
    enum PlayerPositions {
        case Left, Right
        
        var imageAppend: String {
            switch self {
            case .Left: return "Left"
            case .Right: return "Right"
            }
        }
    }
    
    private var _playerPosition: PlayerPositions
    private var _hpMax: Int
    private var _hp: Int
    private var _attackPower: Int
    private var _name: String
    
    var critRate: Int {
        return 15
    }
    
    var parryRate: Int {
        return 10
    }
    
    var blockRate: Int {
        return 10
    }
    
    var name: String {
        return _name
    }
    
    var winner: String {
        return "\(_name) won!"
    }
    
    var hp: Int {
        return _hp > 0 ? _hp : 0
    }
    
    var hpForLabel: String {
        return hpWrapper(hp)
    }
    
    var blockPower: Int {
        return attackPower.0 * _hp / _hpMax * 4/5
    }
    
    var playerPosition: PlayerPositions {
        return _playerPosition
    }
    
    var isAlive: Bool {
        return _hp > 0
    }
    
    var attackPower: (Int, Bool) {
        let adder = Int(arc4random_uniform(UInt32(_attackPower * 2/5 + 1))) - _attackPower / 5
        let crit = Int(arc4random_uniform(UInt32(100))) < critRate ? 2 : 1
        return ((_attackPower + adder) * crit, crit == 2)
    }
    
    var imageName: String {
        var x: String
        switch playerPosition {
        case .Left: x = "orc"
        case .Right: x = "soldier"
        }
        
        x += playerPosition.imageAppend
        return x
    }
    
    init(playerNumber: PlayerPositions, hpMax: Int, attackPower: Int, name: String) {
        self._playerPosition = playerNumber
        self._hpMax = hpMax
        self._hp = hpMax
        self._attackPower = attackPower
        self._name = name
    }
    
    private func hpWrapper(input: Int) -> String {
        return "\(input) HP"
    }
    
    func defendAttack(damageInput damage: Int, playerName: String) -> (String, Bool) {
        let defend = Int(arc4random_uniform(UInt32(100)))
        
        guard defend > parryRate else {
            return ("The attack from \(playerName) was parried", false)
        }
        
        if defend <= parryRate + blockRate {
            let attackBlocked = damage - blockPower
            
            guard attackBlocked > 0 else {
                return ("The attack from \(playerName) was blocked", false)
            }
            
            _hp -= attackBlocked
            return ("The attack from \(playerName) was blocked and cost \(hpWrapper(attackBlocked))", true)
        }
        
        _hp -= damage
        return ("\(playerName) attacked and cost \(hpWrapper(damage))", true)
    }
    
    
}
