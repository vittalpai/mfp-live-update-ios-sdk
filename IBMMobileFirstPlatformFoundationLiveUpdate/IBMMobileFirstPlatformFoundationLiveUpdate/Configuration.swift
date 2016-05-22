/**
 *   © Copyright 2016 IBM Corp.
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */

//
//  Configuration.swift
//  IBMMobileFirstPlatformFoundationConfigService
//
//  Created by Ishai Borovoy on 02/05/2016.
//

import Foundation

public protocol Configuration {
    /**
     This function to check if a feature is enabled
     
     - Parameter featureName - the feature id
     
     - Returns: true in case feature is enabled
     */
    func isFeatureEnabled (featureId : String)->Bool?
    
    /**
     This function returns the property value
     
     - Parameter propertyName - the property name
     
     - Returns: value for the propertyName
     */
    func getProperty (propertyId : String)->String?
}