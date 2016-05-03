//
//  Configuration.swift
//  IBMMobileFirstPlatformFoundationConfigService
//
//  Created by Ishai Borovoy on 02/05/2016.
//  Copyright © 2016 Dmitri Pikus. All rights reserved.
//

import Foundation

public protocol Configuration {
    func isFeatureEnabled (featureName : String)->Bool
    func getProperty (propertyName : String)->String
}