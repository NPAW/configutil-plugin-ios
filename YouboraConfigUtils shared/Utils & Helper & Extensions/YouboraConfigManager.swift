//
//  YouboraConfigManager.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import YouboraLib

@objcMembers public class YouboraConfigManager: NSObject {
    static private var options: YBOptions?
    
     static public func save() {
        guard let options = self.options else {
            return
        }
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: options), forKey: Constants.youborasettings)
    }
    
    static public func reset() {
        self.options = YBOptions()
        self.save()
    }
    
    @discardableResult static public func getOptions() -> YBOptions {
        guard let options = self.options else {
            guard let data = UserDefaults.standard.data(forKey: Constants.youborasettings) else {
                reset()
                return self.options!
            }
            self.options = NSKeyedUnarchiver.unarchiveObject(with: data) as? YBOptions
            
            return self.options!
        }
        
        return options
    }
}
