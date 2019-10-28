//
//  ResourcesViewController.swift
//  iOS
//
//  Created by nice on 02/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

import Foundation
import UIKit
import YouboraConfigUtils_iOS

class ResourcesViewController: UIViewController {
    
    let child = YouboraConfigViewController().initFromXIB()
    let containerView = UIView()
    
    // MARK: View Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        YouboraConfigManager.getOptions()
        
        child.insertIntoParent(parentViewController: self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
