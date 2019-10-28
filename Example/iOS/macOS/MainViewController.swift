//
//  MainViewController.swift
//  macOS
//
//  Created by nice on 24/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

import Cocoa
import YouboraConfigUtils_macOS

class MainViewController: NSViewController {
    
    var menuViewController: MenuViewController?
    let configViewController = YouboraConfigViewController().initFromXIB()

    @IBOutlet weak var contentContainerView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.

    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let destController = segue.destinationController as? MenuViewController {
            self.menuViewController = destController
            setupMenuToNavigate()
        }
    }
    
    // MARK: - Menu methods
    
    func setupMenuToNavigate() {
        guard let menuViewController = self.menuViewController else {
            return
        }
        
        menuViewController.navigateTo = {option in
            switch option {
            case .config:
                self.configViewController.insertIntoContainer(containerView: self.contentContainerView)
            case .main:
                self.configViewController.removeFromContainer()
                
            }
        }
    }
}
