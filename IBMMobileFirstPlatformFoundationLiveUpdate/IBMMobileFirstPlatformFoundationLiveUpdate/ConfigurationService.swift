//
//  Attachment.swift
//  configuration-service-sdk-ios
//
//  Created by Oleg Sternberg & Ishai Borovoy on 14/1/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation

public protocol ConfigurationService {
    func getConfig (segment: String, useCache: Bool, completionHandler: (configuration: Configuration?, error: NSError?) -> Void)
    func getConfig (params: [String:String], useCache: Bool, completionHandler: (configuration: Configuration?, error: NSError?) -> Void)
}