//
//  BaseWindowController.swift
//  macOS
//
//  Created by nice on 24/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

import Cocoa

class BaseWindowController: NSWindowController {

    var splitedViewController: NSSplitViewController? {
        return self.window?.contentViewController as? NSSplitViewController
    }
    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        guard let splitedViewController = self.splitedViewController else {
            return
        }
        
        print("Cenas")
    }

}
