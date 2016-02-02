//
//  Orc.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 01.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

class Orc: Player {
    
    override var critRate: Int {
        return 13
    }
    override var parryRate: Int {
        return 15
    }
    override var blockRate: Int {
        return 0
    }
    
    override var imageName: String {
        return "orc" +  playerPosition.imageAppend
    }
    
    convenience init(playerNumber: PlayerPositions, name: String) {
        self.init(playerNumber: playerNumber, hpMax: 400, attackPower: 60, name: name)
    }
    
}
