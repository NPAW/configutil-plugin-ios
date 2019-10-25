//
//  YBConfigView.swift
//  YouboraConfigUtils_macOS
//
//  Created by nice on 24/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Cocoa

typealias UpdateClosure = () -> Void

class YBConfigView: NSCollectionViewItem {
    var viewModel: YBConfigViewModel?
    
    public var typeName: String {
        return String(describing: YBConfigView.self)
    }
    
    public var customIdentifier: NSUserInterfaceItemIdentifier {
        return NSUserInterfaceItemIdentifier(rawValue: typeName)
    }
    
    var customBundle: Bundle {
        return Bundle.init(for: self.classForCoder)
    }
    
    var customNib: NSNib? {
        return NSNib(nibNamed: typeName, bundle: customBundle)
    }
    
    public func registerCell(collectionView: NSCollectionView) {
         collectionView.register(customNib, forItemWithIdentifier: customIdentifier)
    }
    
    public func makeItem(collectionView: NSCollectionView, indexPath: IndexPath) -> YBConfigView? {
        return collectionView.makeItem(withIdentifier: customIdentifier, for: indexPath) as? YBConfigView
    }
    
}
