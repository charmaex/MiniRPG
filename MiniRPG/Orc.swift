//
//  Orc.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 01.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

class Orc: Player {
    
    private var _critRate: Int = 13
    private var _parryRate: Int = 15
    private var _blockRate: Int = 0
    
    override var imageName: String {
        return "orc" +  playerPosition.imageAppend
    }
    
    convenience init(playerNumber: PlayerPositions) {
        self.init(playerNumber: playerNumber, hpMax: 400, attackPower: 60)
    }
    
}
