//
//  YBConfigNumberCellView.swift
//  YouboraConfigUtils
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigNumberCellView: YBConfigCell, UITextFieldDelegate {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var propertyName: UILabel!
    
    static var cellIdentifier: String = Constants.numberCellId
    
    override func setupView() {
        guard let viewModel = self.viewModel as? YBConfigNumberViewModel else {
            return
        }
        
        self.inputField.delegate = self
        
        self.propertyName.text = viewModel.getPropertyName()
        
        if let value = viewModel.getValue() {
            self.inputField.text = String(describing:  value)
        }
        
        
        self.inputField.addTarget(self, action: #selector(textDidChange(textField:)), for: .editingChanged)
    }
    
    //MARK - UITextField Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newValue = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        
        guard let viewModel = self.viewModel as? YBConfigNumberViewModel else {
            return true
        }
        
        return viewModel.isNumber(value: newValue)
    }
    
    @objc func textDidChange(textField: UITextField) {
        guard let viewModel = self.viewModel as? YBConfigNumberViewModel,
            let text = textField.text else {
            return
        }
        
        viewModel.updateValue(newValue: Double(text))
    }
}

