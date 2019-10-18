//
//  YBConfigBoolCellView.swift
//  YouboraConfigUtils tvOS
//
//  Created by nice on 14/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigBoolCellView: YBConfigCell {

    static var cellIdentifier: String = Constants.boolCellId
    
    @IBOutlet weak var switcher: UISegmentedControl!
    @IBOutlet weak var propertyName: UILabel!
    
    override func setupView() {
        guard let viewModel = self.viewModel as? YBConfigBoolViewModel else {
            return
        }
        
        self.propertyName.text = viewModel.getPropertyName()
        self.switcher.selectedSegmentIndex = viewModel.getValue() ? 0 : 1
    }
    
    @IBAction func onSegmentChange(_ sender: Any) {
        guard let viewModel = self.viewModel as? YBConfigBoolViewModel else {
            return
        }
        
        viewModel.updateValue(newValue: self.switcher.selectedSegmentIndex == 0)
    }
    
}
