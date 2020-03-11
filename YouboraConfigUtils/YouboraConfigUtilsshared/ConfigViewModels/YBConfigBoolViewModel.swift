//
//  YBConfigBoolViewModel.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import YouboraLib

class YBConfigBoolViewModel: YBConfigViewModel {
    func getValue() -> Bool {
        guard let value = options.value(forKey: self.option.name) as? Bool else {
            return false
        }
        
        return value
    }
    
    func getSegmentValue() -> Int {
        return self.getValue() ? 0 : 1
    }
    
    func updateValue(newValue: Int) {
        self.updateValue(newValue: newValue == 0 ? true : false)
    }
    
    func updateValue(newValue: Bool) {
        if self.option.type == .bool {
            self.options.setValue(newValue, forKey: self.option.name)
        } else {
            self.options.setValue(NSNumber(booleanLiteral: newValue), forKey: self.option.name)
        }
    }
}
