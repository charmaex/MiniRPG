//
//  ViewController.swift
//  MiniRPG
//
//  Created by Jan Dammshäuser on 01.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerOne: UIImageView!
    @IBOutlet weak var playerTwo: UIImageView!
    @IBOutlet weak var playerOneButton: UIButton!
    @IBOutlet weak var playerTwoButton: UIButton!
    @IBOutlet weak var playerOneHP: UILabel!
    @IBOutlet weak var playerTwoHP: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var model: Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = Model()
    }

    @IBAction func playerOneButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func playerTwoButtonTapped(sender: AnyObject) {
        
    }

}

