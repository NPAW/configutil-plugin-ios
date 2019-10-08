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
    
    public func getTitle() -> String {
        return Constants.settingsNavTitle
    }
    
    public func getNumberOfOptions() -> Int {
        return options.count
    }
    
    private func getOption(position: Int) -> Option  {
        return options[position]
    }
    
    public func getOptionType(position: Int) -> OptionType {
        return getOption(position: position).type
    }
    
    public func getCellViewModel(position: Int) -> YBConfigViewModel {
        switch getOptionType(position: position) {
        case .Bool:
            return YBConfigBoolViewModel(option: getOption(position: position), options: YouboraConfigManager.getOptions())
        case .String:
            return YBConfigStringViewModel(option: getOption(position: position), options: YouboraConfigManager.getOptions())
        case .Number:
            return YBConfigNumberViewModel(option: getOption(position: position), options: YouboraConfigManager.getOptions())
        case .Unknown:
            return YBConfigViewModel(option: getOption(position: position), options: YouboraConfigManager.getOptions())
        }
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
