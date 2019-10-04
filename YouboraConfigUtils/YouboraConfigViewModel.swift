//
//  YouboraConfigViewModel.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation

class YouboraConfigViewModel {
    private let options = Constants.options
    
    public func getNumberOfOptions() -> Int {
        return options.count
    }
    
    public func getOption(position: Int) -> Option  {
        return options[position]
    }
    
    public func saveAllChanges() {
        YouboraConfigManager.save()
    }
    
    public func resetAllChanges() {
        YouboraConfigManager.reset()
    }
}
