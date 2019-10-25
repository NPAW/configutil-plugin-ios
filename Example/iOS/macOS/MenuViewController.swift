//
//  MenuViewController.swift
//  macOS
//
//  Created by nice on 24/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

import Cocoa
import YouboraConfigUtils_macOS

enum NaviagationOptions {
    case main
    case config
}

typealias NavigationClosure = (_ option: NaviagationOptions) -> Void


class MenuViewController: NSViewController {

    var navigateTo: NavigationClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func onConfigPress(_ sender: Any) {
        guard let navigateTo = self.navigateTo else {
            return
        }
        
        navigateTo(.config)
    }
    
    @IBAction func onMainViewPress(_ sender: Any) {
        guard let navigateTo = self.navigateTo else {
            return
        }
        
        navigateTo(.main)
    }
    
}
