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
    
    let child = YouboraConfigViewController()
    let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}
