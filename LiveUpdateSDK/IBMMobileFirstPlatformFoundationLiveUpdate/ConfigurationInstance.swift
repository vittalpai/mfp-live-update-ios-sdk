//
//  Configuration.swift
//  configuration-service-sdk-ios
//
//  Created by Oleg Sternberg & Ishai Borovoy on 14/1/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation

class ConfigurationInstance: Configuration {
    private var _data: [String: AnyObject]
    private var _id : String
    
    init(id: String, data: [String: AnyObject]) {
        _data = data
        _id = id
    }
    
    func isFeatureEnabled (featureName: String)->Bool {
        if let features = _data["features"] {
            return features[featureName] as! Bool
        }
        return false
    }
    
    func getProperty (propertyName : String)->String {
        if let properties = _data["properties"] {
            return properties[propertyName] as! String
        }
        return ""
    }
    
    var id: String {
        return _id
    }
    
    var data : [String: AnyObject] {
        return _data
    }
    
    var description: String {
        return _data.description
    }
}