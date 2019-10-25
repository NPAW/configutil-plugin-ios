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
        return searchText != ""
    }
    
    private var options: [Option] {
        if !isSearching { return Constants.options}
        
        return Constants.options.filter { option in
            return option.name.lowercased().contains(searchText)
        }
    }
    
    public func getTitle() -> String {
        return Constants.settingsNavTitle
    }
    
    public func getNumberOfOptions() -> Int {
        return options.count
    }
    
    private func getOption(position: Int) -> Option {
        return options[position]
    }
    
    public func getOptionType(position: Int) -> OptionType {
        return getOption(position: position).type
    }
    
    public func getConfigViewModel(position: Int) -> YBConfigViewModel {
        switch getOptionType(position: position) {
        case .bool:
            return YBConfigBoolViewModel(option: getOption(position: position), options: YouboraConfigManager.getOptions())
        case .string:
            return YBConfigStringViewModel(option: getOption(position: position), options: YouboraConfigManager.getOptions())
        case .number:
            return YBConfigNumberViewModel(option: getOption(position: position), options: YouboraConfigManager.getOptions())
        case .unknown:
            return YBConfigViewModel(option: getOption(position: position), options: YouboraConfigManager.getOptions())
        }
    }
    
    public func getOptionTypeString(position: Int) -> String {
        switch self.getOption(position: position).type {
        case .bool:
            return "Boolean"
        case .number:
            return "Number"
        case .string:
            return "String"
        default:
            return "Unknown"
        }
    }
    
    @discardableResult public func saveAllChanges() -> Bool {
        return YouboraConfigManager.save()
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
