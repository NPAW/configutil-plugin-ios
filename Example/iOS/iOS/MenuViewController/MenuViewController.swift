//
//  MenuViewController.swift
//  iOS
//
//  Created by nice on 10/02/2020.
//  Copyright © 2020 nice. All rights reserved.
//

import UIKit
import YouboraConfigUtils

class MenuViewController: UIViewController {
    
    @IBOutlet weak var navigationButton: UIButton!
    @IBOutlet weak var noNavigationButton: UIButton!
    
    class func loadFromNib() -> MenuViewController {
        return MenuViewController(nibName: String(describing: self), bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        if sender == navigationButton {
            guard let navigationController = self.navigationController else {
                return
            }
            
            navigationController.show(YouboraConfigViewController.initFromXIB(), sender: nil)
            return
        }
        
        self.present(YouboraConfigViewController.initFromXIB(animatedNavigation: true), animated: true, completion: nil)
    }
}
