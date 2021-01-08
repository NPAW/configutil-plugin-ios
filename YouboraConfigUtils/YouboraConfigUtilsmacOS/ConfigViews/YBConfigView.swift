//
//  YBConfigView.swift
//  YouboraConfigUtils_macOS
//
//  Created by nice on 24/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Cocoa

class YBConfigView: NSCollectionViewItem {
    public var viewModel: YBConfigViewModel? {
        didSet {
            self.didSetViewModel()
        }
    }
    
    public var typeName: String { return String(describing: YBConfigView.self) }
    
    public var customIdentifier: NSUserInterfaceItemIdentifier { return NSUserInterfaceItemIdentifier(rawValue: typeName) }
    
    var customBundle: Bundle { return Bundle.init(for: self.classForCoder) }
    
    var customNib: NSNib? {
        #if swift(>=4.2)
        return NSNib(nibNamed: typeName, bundle: customBundle)
        #else
        return NSNib(nibNamed: NSNib.Name(rawValue: typeName), bundle: customBundle)
        #endif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.darkGray.cgColor
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.layer?.cornerRadius = 6
    }
    
    public func registerCell(collectionView: NSCollectionView) {
         collectionView.register(customNib, forItemWithIdentifier: customIdentifier)
    }
    
    public func makeItem(collectionView: NSCollectionView, indexPath: IndexPath) -> YBConfigView? {
        return collectionView.makeItem(withIdentifier: customIdentifier, for: indexPath) as? YBConfigView
    }
    
    public func setWithViewModel(viewModel: YBConfigViewModel) { self.viewModel = viewModel }
    
    public func didSetViewModel() {}
    
}
