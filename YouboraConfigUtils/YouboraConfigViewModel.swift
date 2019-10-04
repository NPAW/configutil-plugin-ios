//
//  YouboraConfigViewModel.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation

class YouboraConfigViewModel {
    
    private var searchText = ""
    
    private var isSearching: Bool {
        get {
            return searchText != ""
        }
    }
    
    private var options: [Option] {
        get {
            if !isSearching { return Constants.options}
            
            return Constants.options.filter{option in return option.name.lowercased().contains(searchText)}
        }
    }
    
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
    
    public func updateSearch(text: String?) {
        guard let text = text else {
            searchText = ""
            return
        }
        
        searchText = text.lowercased()
    }
}
