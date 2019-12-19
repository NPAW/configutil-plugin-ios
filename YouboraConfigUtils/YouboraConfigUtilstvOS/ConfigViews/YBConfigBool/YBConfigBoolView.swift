//
//  YBConfigBoolView.swift
//  YouboraConfigUtils_tvOS
//
//  Created by nice on 18/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigBoolView: YBConfigView {
    
    @IBOutlet weak var propLabel: UILabel!
    @IBOutlet weak var selectedOption: UISegmentedControl!
    
    public override var typeName: String {
        return String(describing: YBConfigBoolView.self)
    }
    
    override func setWithData() {
        guard let viewModel = self.viewModel as? YBConfigBoolViewModel else {
            return
        }
        
        self.propLabel.text = viewModel.getPropertyName()
        self.selectedOption.selectedSegmentIndex = viewModel.getSegmentValue()
    }

    @IBAction func onSegmentChange(_ sender: Any) {
        guard let viewModel = self.viewModel as? YBConfigBoolViewModel else {
            return
        }
        
        viewModel.updateValue(newValue: self.selectedOption.selectedSegmentIndex == 0)
        
        if let updateClosure = self.valueDidUpdate {
            updateClosure()
        }
    }
}
