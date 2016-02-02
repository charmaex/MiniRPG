//
//  Soldier.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 01.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

class Soldier: Player {
    
    override var imageName: String {
        return "soldier" +  playerPosition.imageAppend
    }
    
    convenience init(playerNumber: PlayerPositions) {
        self.init(playerNumber: playerNumber, hpMax: 650, attackPower: 40)
    }
}