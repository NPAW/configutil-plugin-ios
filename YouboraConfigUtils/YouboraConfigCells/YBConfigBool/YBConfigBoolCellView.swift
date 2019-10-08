//
//  YBConfigViewCellBool.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigBoolCellView: YBConfigCell {
    
    static var cellIdentifier:String = Constants.boolCellId
    
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var propertyName: UILabel!
    
    override func setupView() {
        guard let viewModel = self.viewModel as? YBConfigBoolViewModel else {
            return
        }
        
        self.propertyName.text = viewModel.getPropertyName()
        self.switcher.isOn = viewModel.getValue()
        
        self.switcher.addTarget(self, action: #selector(onSwitchChange(sender:)), for: .valueChanged)
    }
    
    @objc func onSwitchChange(sender: UISwitch) {
        guard let viewModel = self.viewModel as? YBConfigBoolViewModel else {
            return
        }
        
        viewModel.updateValue(newValue: sender.isOn)
    }
}
