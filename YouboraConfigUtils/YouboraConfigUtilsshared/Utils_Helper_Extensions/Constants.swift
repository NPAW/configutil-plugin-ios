//
//  Constants.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import YouboraLib

#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#elseif os(OSX)
import Cocoa
#endif

struct Option {
    let name: String
    let type: OptionKeyType
}

struct Constants {
    static let youborasettings = "youborasettings"
    static let settingsNavTitle = "Youbora Settings"
    static let defaultCellId = "defaultCellId"
    static let boolCellId = "cellBoolIdentifier"
    static let stringCellId = "cellStringIdentifier"
    static let numberCellId = "cellNumberIdentifier"
    static let unknownCellId = "cellUnknownIdentifier"
    static let deprecatedCellId = "cellDeprecatedIdentifier"
    
    #if os(iOS) || os(watchOS) || os(tvOS)
    static let propCellHighlighted = UIColor(red: 116/255, green: 0/255, blue: 124/255, alpha: 1)
    #elseif os(OSX)
    static let propCellHighlighted = NSColor(red: 116/255, green: 0/255, blue: 124/255, alpha: 1)
    #endif
    static let numberOfColumnsInMacOS = 3
    static let spaceBetweenItemsInMacOS = 7
    static let maxItemHeightInMacOS = 200
}

extension Constants {
    static let options: [Option] = {
        return YBOptionUtilsKeys.keys.keys.compactMap { key -> Option? in
            guard let type = YBOptionUtilsKeys.keys[key] else {
                return nil
            }
            return Option(name: key, type: type)
        }
    }()
}
