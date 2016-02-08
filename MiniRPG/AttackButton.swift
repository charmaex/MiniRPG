//
//  AttackButton.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 08.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class AttackButton: UIButton {
    
    private var _timer: NSTimer!
    
    func disableButton(forTime t: Double) {
        alpha = 0.5
        
        timer(t)
    }
    
    private func timer(t: Double) {
        if _timer != nil {
            _timer!.invalidate()
        }
        
        _timer = NSTimer.scheduledTimerWithTimeInterval(t, target: self, selector: "reenableButton", userInfo: nil, repeats: false)
    }
    
    func reenableButton() {
        alpha = 1
    }

}
