//
//  Utils.swift
//  YouboraConfigUtils_iOS
//
//  Created by nice on 08/11/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation

struct Utils {
    static func printInitializationWarning() {
      print("****************************************************")
      print("                     Warning!                       ")
      print("****************************************************")
      print("This view controller wasn't probably well initialize")
      print("Please consider to use the initFromXIB static method")
    }
}
