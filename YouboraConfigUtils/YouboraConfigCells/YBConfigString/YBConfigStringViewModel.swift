//
//  YBConfigStringViewModel.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import YouboraLib

class YBConfigStringViewModel {
    let option: Option
    let options: YBOptions
    
    init(option: Option, options: YBOptions) {
        self.option = option
        self.options = options
    }
    
    func getValue() -> String {
        guard let value = options.value(forKey: self.option.name) as? String else {
            return ""
        }
        
        return value
    }
    
    func updateValue(newValue: String) {
        self.options.setValue(newValue, forKey: self.option.name)
        
    }
}
