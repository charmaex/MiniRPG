//
//  AttackButton.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 08.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class AttackButton: UIButton {
    
    private var _timerEnable: NSTimer!
    private var _timerAlpha: NSTimer!
    private var _time: Double!
    
    func disableButton(forTime t: Double) {
        let disableTime: Double = 0.2
        _time = t - disableTime
        enabled = false
        
        cancelTimers()
        
        _timerEnable = NSTimer.scheduledTimerWithTimeInterval(disableTime, target: self, selector: "reEnableButton", userInfo: nil, repeats: false)
    }
    
    func reEnableButton() {
        enabled = true
        alpha = 0.5
        
        cancelTimers()
        
        _timerAlpha = NSTimer.scheduledTimerWithTimeInterval(_time, target: self, selector: "reAlphaButton", userInfo: nil, repeats: false)
    }
    
    func reAlphaButton() {
        alpha = 1
    }
    
    private func cancelTimers() {
        if _timerEnable != nil {
            _timerEnable!.invalidate()
        }
        if _timerAlpha != nil {
            _timerAlpha!.invalidate()
        }
    }
    
}
