//
//  Extensions.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 06.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func disableButton(forTime t: Double) {
        self.enabled = false
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(t * Double(NSEC_PER_SEC)))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            self.enabled = true
        })
    }
}

extension UIView {
    func showObject() {
        // add some animation here
        
        self.hidden = false
    }
    
    func hideObject() {
        // add some animation here
        
        self.hidden = true
    }
}
