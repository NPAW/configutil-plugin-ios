//
//  YBConfigBoolViewModel.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import YouboraLib

class YBConfigBoolViewModel {
    let option: Option
    let options: YBOptions
    
    init(option: Option, options: YBOptions) {
        self.option = option
        self.options = options
    }
    
    func getValue() -> Bool {
        guard let value = options.value(forKey: self.option.name) as? Bool else {
            return false
        }
        
        return value
    }
    
    func updateValue(newValue: Bool) {
        self.options.setValue(newValue, forKey: self.option.name)
        
    }
}
