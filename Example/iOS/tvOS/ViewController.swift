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
    
    @IBOutlet weak var navigateButton: UIButton!
    @IBOutlet weak var modallyButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        YouboraConfigManager.getOptions()
    }
    
    @IBAction func pressToNavigate(_ sender: UIButton) {
        if sender == self.navigateButton {
            guard let navigationController = self.navigationController else {
                self.present(YouboraConfigViewController.initFromXIB(), animated: true, completion: nil)
                return
            }
            navigationController.show(YouboraConfigViewController.initFromXIB(), sender: nil)
            return
        }
        
        self.present(YouboraConfigViewController.initFromXIB(), animated: true, completion: nil)
    }
}
