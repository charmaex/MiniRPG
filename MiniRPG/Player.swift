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
    }
    
    private var _playerPosition: PlayerPositions
    private var _hpMax: Int
    private var _hp: Int
    private var _attackPower: Int
    
    private var _parryRate: Int = 10
    private var _blockRate: Int = 10
    
    private var _blockPower: Int {
        return attackPower * _hp / _hpMax * 4/5
    }
    
    var attackPower: Int {
        let adder = Int(arc4random_uniform(UInt32(_attackPower * 2/5 + 1))) - _attackPower / 5
        return _attackPower + adder
    }
    
    var imageName: String {
        switch _playerPosition {
        case .Left: return "orcLeft"
        case .Right: return "soldierRight"
        }
    }
    
    init(playerNumber: Int, hpMax: Int, attackPower: Int) {
        self._playerPosition = playerNumber >= 2 ? .Right : .Left
        self._hpMax = hpMax
        self._hp = hpMax
        self._attackPower = attackPower
    }
    
    
}