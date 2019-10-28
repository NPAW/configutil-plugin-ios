//
//  UIViewController.swift
//  YouboraConfigUtils
//
//  Created by nice on 23/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var className: String {
        return String(describing: type(of: self))
    }
    
    var myBundle: Bundle {
        return Bundle(for: self.classForCoder)
    }
    
    @objc public func initFromXIB() -> Self {
        return type(of: self).init(nibName: className, bundle: myBundle)
    }
    
    @objc public func insertIntoParent(parentViewController: UIViewController) {
        #if swift(<4.2)
            parentViewController.addChildViewController(self)
            self.didMove(toParentViewController: parentViewController)
        #else
            parentViewController.addChild(self)
            self.didMove(toParent: parentViewController)
        #endif
       
        parentViewController.view.addSubview(self.view)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        parentViewController.view.addConstraints([
            parentViewController.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            parentViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            parentViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            parentViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)
            ])
    }
    
}
