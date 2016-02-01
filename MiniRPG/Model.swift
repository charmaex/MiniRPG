//
//  Model.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 01.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

struct Model {
    
    var playerOne: Player
    var playerTwo: Player
    
    
    init() {
        playerOne = Orc(playerNumber: 1, hpMax: 500, attackPower: 50)
        playerTwo = Soldier(playerNumber: 1, hpMax: 500, attackPower: 50)
    }
}