//
//  YBConfigDeprecated.swift
//  YouboraConfigUtils_iOS
//
//  Created by Tiago Pereira on 11/03/2020.
//  Copyright © 2020 NPAW. All rights reserved.
//

import UIKit

class YBConfigDeprecatedCellView: YBConfigCell {

    @IBOutlet weak var propertyName: UILabel!
    
    static var cellIdentifier: String = Constants.deprecatedCellId
    
    override func setupView() {
        guard let viewModel = self.viewModel else {
            return
        }
    
        self.propertyName.text = "\(viewModel.option.name)"
    }

}
