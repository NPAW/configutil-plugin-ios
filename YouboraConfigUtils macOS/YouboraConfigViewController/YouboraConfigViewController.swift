//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils_macOS
//
//  Created by nice on 22/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Cocoa

@objc open class YouboraConfigViewController: NSViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        print("Cenas")
        // Do view setup here.
    }
    
    open override func loadView() {
        print("Cenas")
    }
    
    open override func present(_ viewController: NSViewController, asPopoverRelativeTo positioningRect: NSRect, of positioningView: NSView, preferredEdge: NSRectEdge, behavior: NSPopover.Behavior) {
        print("Cenas")
    }
    
    open override func present(_ viewController: NSViewController, animator: NSViewControllerPresentationAnimator) {
        print("Cenas")
    }
    
    // MARK: - ViewController Methods
    
//    open override func didMove(toParent parent: NSViewController?) {
//        guard let parent = parent else {
//            return
//        }
//
//        parent.view.addSubview(self.view)
//
//        self.view.translatesAutoresizingMaskIntoConstraints = false
//
//        parent.view.addConstraints([
//            parent.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
//            parent.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
//            parent.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
//            parent.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)
//            ])
//    }
    
}
