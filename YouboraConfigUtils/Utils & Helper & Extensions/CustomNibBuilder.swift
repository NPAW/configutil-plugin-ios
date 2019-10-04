//
//  CustomNibBuilder.swift
//  YouboraConfigUtils
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation

protocol CustomNibBuilder:NSObject {
    static var customNibName:String { get }
    static var customBundle:Bundle { get }
    static var customNib:[Any]? { get }
}

extension CustomNibBuilder {
    static var customNibName: String {
        get {
            return String(describing: self.self)
        }
    }
    
    static var customBundle: Bundle {
        get {
            return Bundle(for: self.classForCoder())
        }
    }
    
    static var customNib:[Any]? {
        get {
            return  customBundle.loadNibNamed(self.customNibName, owner: nil, options: nil)
        }
    }
}
