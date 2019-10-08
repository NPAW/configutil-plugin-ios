//
//  YbConfigViewModel.swift
//  YouboraConfigUtils
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import YouboraLib

class YBConfigViewModel {
    let option: Option
    let options: YBOptions
    
    init(option: Option, options: YBOptions) {
        self.option = option
        self.options = options
    }
    
    func getPropertyName() -> String {
        return self.option.name
    }
}
