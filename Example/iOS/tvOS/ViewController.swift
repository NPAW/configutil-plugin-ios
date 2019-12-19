//
//  ViewController.swift
//  tvOS
//
//  Created by nice on 14/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

import UIKit
import YouboraConfigUtils

class ViewController: UIViewController {
    
    let child = YouboraConfigViewController.initFromXIB()

    override func viewDidLoad() {
        super.viewDidLoad()
        YouboraConfigManager.getOptions()
        
        child.insertIntoParent(parentViewController: self)
    }
}
