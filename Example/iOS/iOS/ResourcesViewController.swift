//
//  ResourcesViewController.swift
//  iOS
//
//  Created by nice on 02/10/2019.
//  Copyright © 2019 nice. All rights reserved.
//

import Foundation
import YouboraConfigUtils

class ResourcesViewController: UIViewController {
    
    let child = YouboraConfigViewController()
    let containerView = UIView()
    
    //MARK: View Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        YouboraConfigManager.getOptions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setContainerView()
        insertChildViewController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    //MARK: Aux methods
    func setContainerView() {
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let topSpace = UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.height ?? CGFloat(0))
        var bottomSpace = CGFloat(0)
        
        if let tabBarController = self.tabBarController {
            bottomSpace = tabBarController.tabBar.frame.height
        }
        
        view.addConstraints([
            view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -topSpace),
            view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: bottomSpace),
            view.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            view.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0)
            ])
        
    }
    
    func insertChildViewController() {
        child.view.frame = containerView.frame
        containerView.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
}
