//
//  YBConfigStringViewModel.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import YouboraLib

class YBConfigNumberViewModel:YBConfigViewModel {
    override func getPropertyName() -> String {
        return super.getPropertyName()+" (number)"
    }
    
    func isNumber(value:String) -> Bool {
        if value == "" {
            return true
        }
        
        guard let _ = Double(value) else {
            return false
        }
        
        return true
    }
    
    func getValue() -> Double? {
        guard let value = options.value(forKey: self.option.name) as? Double else {
            return nil
        }
        
        return value
    }
    
    func updateValue(newValue: Double?) {
        self.options.setValue(newValue, forKey: self.option.name)
        
    }
}
