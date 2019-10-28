//
//  YBConfigStringCollectionView.swift
//  YouboraConfigUtils_macOS
//
//  Created by nice on 25/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Cocoa

class YBConfigStringCollectionView: YBConfigView {
    @IBOutlet weak var propName: NSTextField!
    @IBOutlet weak var propType: NSTextField!
    @IBOutlet weak var propTextField: NSTextField!
    
    override public var typeName: String {
        return String(describing: YBConfigStringCollectionView.self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didSetViewModel() {
        guard let viewModel = self.viewModel as? YBConfigStringViewModel else {
            return
        }
        
        self.propName.stringValue = viewModel.getPropertyName()
        self.propType.stringValue = "[String]"
        self.propTextField.stringValue = viewModel.getValue()
    }
    
    @IBAction func textDidEndEditing(_ textField: NSTextField) {
        guard let viewModel = self.viewModel as? YBConfigStringViewModel else {
            return
        }
        
        viewModel.updateValue(newValue: textField.stringValue)
    }
}
