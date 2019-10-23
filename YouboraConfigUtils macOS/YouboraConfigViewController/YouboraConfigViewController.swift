//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils_macOS
//
//  Created by nice on 22/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Cocoa

@objc open class YouboraConfigViewController: NSViewController {
    
    private var adjustsToParent = false
    
    @IBOutlet weak var button: NSButton!
    
    private var classType: String {
        return String(describing: type(of: self))
    }
    
    private var myBundle: Bundle {
        return Bundle(for: self.classForCoder)
    }
    
    public func initFromXIB() -> YouboraConfigViewController {
        return YouboraConfigViewController(nibName: classType, bundle: myBundle)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func awakeFromNib() {
        if let parentViewController = self.parent {
            
            self.view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: parentViewController.view, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: parentViewController.view, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: parentViewController.view, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: parentViewController.view, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
                ])
        }
    }
    
    // MARK: - Aux view controller methods
    
    open func insertIntoParent(parentViewController: NSViewController) {
        parentViewController.addChild(self)
        parentViewController.view.addSubview(self.view)
    }
}
