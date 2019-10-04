//
//  YBConfigUnknownCellView.swift
//  YouboraConfigUtils
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigUnknownCellView: YBConfigCell {
    @IBOutlet weak var propertyName: UILabel!
    
    static var cellIdentifier: String = Constants.unknownCellId
    
    override func setupView() {
        guard let viewModel = self.viewModel else {
            return
        }
    
        self.propertyName.text = "\(viewModel.option.name)"
    }
}
