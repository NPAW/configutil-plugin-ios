//
//  YBConfigStringCellView.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigStringCellView: YBConfigCell {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var propertyName: UILabel!
    
    static var cellIdentifier: String = Constants.stringCellId
    
    override func setupView() {
        guard let viewModel = self.viewModel as? YBConfigStringViewModel else {
            return
        }
        
        self.propertyName.text = viewModel.getPropertyName()
        self.inputField.text = viewModel.getValue()
        
        self.inputField.addTarget(self, action: #selector(textDidChange(textField:)), for: .editingChanged)
    }
    
    @objc func textDidChange(textField: UITextField) {
        guard let viewModel = self.viewModel as? YBConfigStringViewModel,
        let newValue = textField.text else {
            return
        }
        
        viewModel.updateValue(newValue: newValue)
    }
}
