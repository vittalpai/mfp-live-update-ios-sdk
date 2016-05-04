//
//  MFPConfigurationService.swift
//  configuration-service-sdk-ios
//
//  Created by Oleg Sternberg & Ishai Borovoy on 14/1/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundation

public class ConfigurationService {
    private let serviceURL: String = "adapters/configService"
    
    public static let sharedInstance = ConfigurationService()
    
    private init() {
    }
    
    /**
     Obtains the configuration by segment from server or cache
     
     - Parameter segment - the segment id which will be used by configuration adapter to return configuration
     
     - Parameter useCache - default is true, use false to explicitly obtain the configuration from the configuration adapter
     
     - Parameter completionHandler - the competition for retrieving the Configuration
     */
    public func obtainConfiguration (segment: String, useCache: Bool = true, completionHandler: (configuration: Configuration?, error: NSError?) -> Void) {
        let url = NSURL(string: serviceURL)!
        
        if let cachedConfig = LocalCache.getConfiguration(segment) where useCache == true {
            // Get cached configuration
            completionHandler(configuration: cachedConfig, error: nil)
        } else {
            sendConfigRequest(segment, url: url, params: nil) { configuration, error in
                completionHandler(configuration: configuration, error: error)
            }
        }
    }
    
    /**
    Obtains the configuration by params from server or cache
     
     - Parameter params - the parameters which will be used by configuration adapter to return configuration
     
     - Parameter useCache - default is true, use false to explicitly obtain the configuration from the configuration adapter
     
     - Parameter completionHandler - the competition for retrieving the Configuration
     */
    public func obtainConfiguration (params: [String:String], useCache: Bool = true, completionHandler: (configuration: Configuration?, error: NSError?) -> Void) {
        let url = NSURL(string: serviceURL)!
        let id = buildIDFromParams(params)
        
        if let cachedConfig = LocalCache.getConfiguration(id) where useCache == true {
            // Get cached configuration
            completionHandler(configuration: cachedConfig, error: nil)
        } else {
            sendConfigRequest(id, url: url, params: params) { configuration, error in
                completionHandler(configuration: configuration, error: error)
            }
        }
    }
    
    private func sendConfigRequest(id: String, url:NSURL, params: [String: String]?, completionHandler: (Configuration?, NSError?) -> Void) {
        let configurationServiceRequest = WLResourceRequest (URL: url, method: WLHttpMethodGet)
        
        if params != nil {
            for (paramName, paramValue) in params! {
                configurationServiceRequest.setQueryParameterValue(paramValue, forName: paramName)
            }
        }
        configurationServiceRequest.sendWithCompletionHandler { wlResponse, wlError in
            var configuration: Configuration? = nil
            
            if (wlError == nil) {
                var json = wlResponse.responseJSON as? [String: AnyObject]
                
                if json == nil {
                    print("Error in MFPConfigurationService: invalid JSON response")
                    json = [String: AnyObject]()
                }
                configuration = ConfigurationInstance(id :id, data: json!)
                // Save to cache
                LocalCache.saveConfiguration(configuration!)
            }
            completionHandler(configuration, wlError)
        }
    }
    
    private func buildIDFromParams (params: [String: String]?)->String {
        var paramsId = ""
        if (params?.count > 0) {
            for (paramName, paramValue) in params! {
                paramsId += "_\(paramName)_\(paramValue)"
            }
        }
        return paramsId
    }
}