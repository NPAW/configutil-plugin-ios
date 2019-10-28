//
//  YBConfigStringView.swift
//  YouboraConfigUtils_iOS
//
//  Created by nice on 22/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import UIKit

class YBConfigStringView: YBConfigView {
    
    @IBOutlet weak var propLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    public override var typeName: String {
        return String(describing: YBConfigStringView.self)
    }
    
    override func setWithData() {
        guard let viewModel = self.viewModel as? YBConfigStringViewModel else {
            return
        }
        
        self.inputTextField.setNeedsFocusUpdate()
        self.inputTextField.updateFocusIfNeeded()
        
        self.propLabel.text = viewModel.getPropertyName()
        self.inputTextField.text = viewModel.getValue()
        
        self.inputTextField.addTarget(self, action: #selector(textDidChange(textField:)), for: .valueChanged)
        self.inputTextField.addTarget(self, action: #selector(textDidChange(textField:)), for: .editingChanged)
    }
    
    @objc func textDidChange(textField: UITextField) {
        guard let viewModel = self.viewModel as? YBConfigStringViewModel,
            let newValue = textField.text else {
                return
        }
        
        viewModel.updateValue(newValue: newValue)
        
        if let updateClosure = self.valueDidUpdate {
            updateClosure()
        }
    }
}
