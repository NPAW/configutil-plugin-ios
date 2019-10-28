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
    @IBOutlet weak var segmentControl: NSSegmentedControl!
    
    override public var typeName: String {
        return String(describing: YBConfigBoolCollectionView.self)
    }
    
    override func didSetViewModel() {
        guard let viewModel = self.viewModel as? YBConfigBoolViewModel else {
            return
        }
        
        self.propName.stringValue = viewModel.getPropertyName()
        self.propType.stringValue = "[Bool]"
        self.segmentControl.selectedSegment = viewModel.getSegmentValue()
    }
    
    @IBAction func didChangeSegment(_ sender: Any) {
        guard let viewModel = self.viewModel as? YBConfigBoolViewModel else {
            return
        }
        
        viewModel.updateValue(newValue: self.segmentControl.selectedSegment)
    }
}
