//
//  SearchViewController.swift
//  YouboraConfigUtils tvOS
//
//  Created by nice on 15/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

@objc public class YouboraConfigViewController: UITabBarController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure a UIViewController to display search results
        // needs to conform to the UISearchResultsUpdating protocol
        let searchResultsViewController = PropsListViewController()
        
        // setup UISearchController and hook up to search results UIViewController
        let searchController = UISearchController(searchResultsController: searchResultsViewController)
        searchController.searchResultsUpdater = searchResultsViewController
        
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = true
        
        // create a search container that will hold the UISearchController
        let searchContainerViewController = UISearchContainerViewController(searchController: searchController)
        
        self.viewControllers = [searchContainerViewController]
    }
    
    public override func didMove(toParent parent: UIViewController?) {
        guard let parent = parent else {
            return
        }
        
        parent.view.addSubview(self.view)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        parent.view.addConstraints([
            parent.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            parent.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            parent.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            parent.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)
            ])
    }
}
