//
//  YBConfigNumberCollectionView.swift
//  YouboraConfigUtils_macOS
//
//  Created by nice on 25/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Cocoa

class YBConfigNumberCollectionView: YBConfigView {
    @IBOutlet weak var propName: NSTextField!
    @IBOutlet weak var propType: NSTextField!
    @IBOutlet weak var propTextField: NSTextField!
    
    override public var typeName: String {
        return String(describing: YBConfigNumberCollectionView.self)
    }
    
    override func didSetViewModel() {
        guard let viewModel = self.viewModel as? YBConfigNumberViewModel else {
            return
        }
        
        self.propName.stringValue = viewModel.getPropertyName()
        self.propType.stringValue = "[Number]"
        guard let value = viewModel.getValue() else {
            return
        }
        self.propTextField.stringValue = "\(value)"
    }
    
    @IBAction func textDidEndEditing(_ textField: NSTextField) {
        guard let viewModel = self.viewModel as? YBConfigNumberViewModel else {
            return
        }
        
        viewModel.updateValue(newValue: Double(textField.stringValue))
    }
}
