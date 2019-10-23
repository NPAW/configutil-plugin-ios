//
//  ViewController.swift
//  macOS
//
//  Created by nice on 14/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

import Cocoa
import YouboraConfigUtils_macOS

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChild(YouboraConfigViewController())
        
        // Do any additional setup after loading the view.
    }
}
