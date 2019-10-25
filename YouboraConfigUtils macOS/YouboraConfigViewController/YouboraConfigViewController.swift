//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils_macOS
//
//  Created by nice on 22/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Cocoa
import CoreFoundation

@objc open class YouboraConfigViewController: NSViewController, NSCollectionViewDelegate, NSCollectionViewDataSource {

    @IBOutlet weak var propsCollectionView: NSCollectionView!
    let viewModel = YouboraConfigViewModel()
    
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
        
        YBConfigBoolCollectionView().registerCell(collectionView: self.propsCollectionView)
        
        self.propsCollectionView.delegate = self
        self.propsCollectionView.dataSource = self
    }
    
    // MARK: - Collection View Methods
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getNumberOfOptions()
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        guard let cell = YBConfigBoolCollectionView().makeItem(collectionView: collectionView, indexPath: indexPath) as? YBConfigBoolCollectionView else {
            return NSCollectionViewItem()
        }
        
        return cell
    }
    
    // MARK: - Search field methods
    
    @IBAction func didSearch(_ sender: NSSearchField) {
        viewModel.updateSearch(text: sender.stringValue)
    }
    
    // MARK: - Aux view controller methods
    
    open func insertIntoContainer(containerView: NSView) {
        containerView.addSubview(self.view)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            containerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            containerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)
        ])
    }
    
    open func removeFromContainer() {
        self.view.removeFromSuperview()
    }
}
