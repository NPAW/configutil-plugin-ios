//
//  ViewController.swift
//  tvOS
//
//  Created by nice on 14/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

import UIKit
import YouboraConfigUtils_tvOS

class ViewController: UIViewController {
    
    let child = YouboraConfigViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        YouboraConfigManager.getOptions()
        
        self.addChild(child)
        child.didMove(toParent: self)
    }
}
