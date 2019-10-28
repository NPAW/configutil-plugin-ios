//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils_macOS
//
//  Created by nice on 22/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Cocoa
import CoreFoundation

@objcMembers public class YouboraConfigViewController: NSViewController, NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {

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
        YBConfigStringCollectionView().registerCell(collectionView: self.propsCollectionView)
        YBConfigNumberCollectionView().registerCell(collectionView: self.propsCollectionView)
        YBConfigUnknownCollectionView().registerCell(collectionView: self.propsCollectionView)
        
        self.propsCollectionView.delegate = self
        self.propsCollectionView.dataSource = self
    }
    
    // MARK: - Collection View Methods
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getNumberOfOptions()
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let collectionViewModel = viewModel.getConfigViewModel(position: indexPath.item)
        
        var cell: YBConfigView?
        
        switch collectionViewModel.option.type {
        case .bool: cell = YBConfigBoolCollectionView().makeItem(collectionView: collectionView, indexPath: indexPath)
        case .string: cell = YBConfigStringCollectionView().makeItem(collectionView: collectionView, indexPath: indexPath)
        case .number: cell = YBConfigNumberCollectionView().makeItem(collectionView: collectionView, indexPath: indexPath)
        case .unknown: cell = YBConfigUnknownCollectionView().makeItem(collectionView: collectionView, indexPath: indexPath)
        }
        
        guard let configCell = cell else {
            return NSCollectionViewItem()
        }
        
        configCell.setWithViewModel(viewModel: collectionViewModel)
        
        return configCell
    }
    
    public func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let totalSize = (collectionView.frame.size.width / CGFloat(Constants.numberOfColumnsInMacOS))
        let size = totalSize - CGFloat(Constants.spaceBetweenItemsInMacOS)
        
        return NSSize(width: size, height: size > CGFloat(Constants.maxItemHeightInMacOS) ? CGFloat(Constants.maxItemHeightInMacOS) : size )
    }
    
    // MARK: - Search field methods
    
    @IBAction func didSearch(_ sender: NSSearchField) {
        viewModel.updateSearch(text: sender.stringValue)
        self.propsCollectionView.reloadData()
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
    
    // MARK: - Buttons Configuration
    
    @IBAction func onSavePress(_ sender: Any) { self.viewModel.saveAllChanges() }
    
    @IBAction func onResetPress(_ sender: Any) {
        self.viewModel.resetAllChanges()
        self.propsCollectionView.reloadData()
    }
}
