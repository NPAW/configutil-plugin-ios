//
//  YBConfigUnknownCollectionView.swift
//  YouboraConfigUtils_macOS
//
//  Created by nice on 25/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Cocoa

class YBConfigUnknownCollectionView: YBConfigView {
    @IBOutlet weak var propName: NSTextField!
    @IBOutlet weak var propType: NSTextField!
    
    override public var typeName: String {
        return String(describing: YBConfigUnknownCollectionView.self)
    }
    
    override func didSetViewModel() {
        guard let viewModel = self.viewModel else {
            return
        }
        
        self.propName.stringValue = viewModel.getPropertyName()
        self.propType.stringValue = "[Unknown]"
    }
    
}
