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
        print("### Warning ###\n")
        print("You probably didn't intialize the view controller correctly. Use the static method initFromXIB to intialize this view controller\n")
        print("For more information check: https://github.com/NPAW/configutil-plugin-ios\n")
        print("###############\n")
    }
}
