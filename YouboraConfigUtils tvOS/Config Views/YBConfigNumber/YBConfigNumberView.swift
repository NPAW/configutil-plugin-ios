//
//  YBConfigNumber.swift
//  YouboraConfigUtils_tvOS
//
//  Created by nice on 22/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigNumberView: YBConfigView {

    @IBOutlet weak var propLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    public override var typeName: String {
        return String(describing: YBConfigNumberView.self)
    }
    
    override func setWithData() {
        guard let viewModel = self.viewModel as? YBConfigNumberViewModel else {
            return
        }
        
        self.inputTextField.keyboardType = .numbersAndPunctuation
        
        self.propLabel.text = viewModel.getPropertyName()
        
        if let value = viewModel.getValue() {
            self.inputTextField.text = String(describing: value)
        }
        
        self.inputTextField.addTarget(self, action: #selector(textDidChange(textField:)), for: .editingDidEnd)
    }
    
    @objc func textDidChange(textField: UITextField) {
        guard let viewModel = self.viewModel as? YBConfigNumberViewModel,
            let newValue = textField.text else {
                return
        }
        
        viewModel.updateValue(newValue: Double(newValue))
        
        if let updateClosure = self.valueDidUpdate {
            updateClosure()
        }
    }

}
