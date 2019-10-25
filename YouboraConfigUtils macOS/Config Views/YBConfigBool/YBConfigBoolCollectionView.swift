//
//  YBConfigBool.swift
//  YouboraConfigUtils_macOS
//
//  Created by nice on 24/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Cocoa

class YBConfigBoolCollectionView: YBConfigView {
    
    @IBOutlet weak var propName: NSTextField!
    @IBOutlet weak var propType: NSTextField!

    override public var typeName: String {
        return String(describing: YBConfigBoolCollectionView.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    public func setViewWithData(name: String, type: String) {
        self.propName.stringValue = name
        self.propType.stringValue = "[\(type)]"
    }
    
    
    
}
