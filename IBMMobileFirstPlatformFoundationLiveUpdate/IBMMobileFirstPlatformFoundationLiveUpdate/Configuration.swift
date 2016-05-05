//
//  Configuration.swift
//  IBMMobileFirstPlatformFoundationConfigService
//
//  Created by Ishai Borovoy on 02/05/2016.
//  Copyright © 2016 Dmitri Pikus. All rights reserved.
//

import Foundation

public protocol Configuration {
    /**
     This function to check if a feature is enabled
     
     - Parameter featureName - the feature name
     
     - Returns: true in case feature is enabled
     */
    func isFeatureEnabled (featureName : String)->Bool?
    
    /**
     This function returns the property value
     
     - Parameter propertyName - the property name
     
     - Returns: value for the propertyName
     */
    func getProperty (propertyName : String)->String?
}