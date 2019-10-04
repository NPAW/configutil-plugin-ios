//
//  OptionsHelper.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import YouboraLib

public enum OptionType {
    case String
    case Bool
    case Double
    case Unknown
}

internal class OptionsHelper {
    internal static func getProperties() -> ([String],[String]) {
        var properties = [String]()
        var types = [String]()
        
        var propertiesCount : CUnsignedInt = 0
        let propertiesInAClass = class_copyPropertyList(YBOptions.self, &propertiesCount)
        
        
        for i in 0 ..< Int(propertiesCount) {
            if let property = propertiesInAClass?[i] {
                if let strKey = NSString(utf8String: property_getName(property)) as String?,
                    let attKey = NSString(utf8String: property_getAttributes(property)!) as String? {
                    properties.append(strKey)
                    
                    let separatedAtt = attKey.components(separatedBy: ",")
                    let typeAttribute = separatedAtt[0]
                    let propertyType = typeAttribute.substring(from: String.Index(encode))
                    const char * rawPropertyType = [propertyType UTF8String];
                    print(attKey)
                }
            }
        }
        return (types,properties)
    }

//    internal static func getTypeOf(property: objc_property_t) -> Any {
//        guard let attributesAsNSString: NSString = NSString(utf8String: property_getAttributes(property)!) else { return Any.self }
//        let attributes = attributesAsNSString as String
//        let slices = attributes.components(separatedBy: "\"")
//        guard slices.count > 1 else { return getPrimitiveDataType(withAttributes: attributes) }
//        let objectClassName = slices[1]
//        let objectClass = NSClassFromString(objectClassName) as! NSObject.Type
//        return objectClass
//    }
//
//    internal static func getPrimitiveDataType(withAttributes attributes: String) -> Any {
//        guard let letter = attributes.substring(from: 1, to: 2), let type = primitiveDataTypes[letter] else { return Any.self }
//        return type
//    }
    
    internal static func buildOptions() -> [Option] {
        let options = YBOptions()
    
        let properties = getProperties()
        
        return properties.1.map{property -> Option in
            
            
            
            //print("type -> \(getTypeOf(property: property)))")
            
            if let _ = options.value(forKey: property) as? Bool {
                return Option(name: property, type: .Bool)
            }
            
            if let _ = options.value(forKey: property) as? String {
                return Option(name: property, type: .String)
            }
            
            if let _ = options.value(forKey: property) as? Double {
                return Option(name: property, type: .Double)
            }
            
            return Option(name: property, type: .Unknown)
        }
    }
    
//    internal static func getTypeOf(property: objc_property_t) -> Any {
//        guard let attributesAsNSString: NSString = NSString(utf8String: property_getAttributes(property)) else { return Any.self }
//        let attributes = attributesAsNSString as String
//        let slices = attributes.components(separatedBy: "\"")
//        guard slices.count > 1 else { return getPrimitiveDataType(withAttributes: attributes) }
//        let objectClassName = slices[1]
//        let objectClass = NSClassFromString(objectClassName) as! NSObject.Type
//        return objectClass
//    }
}
