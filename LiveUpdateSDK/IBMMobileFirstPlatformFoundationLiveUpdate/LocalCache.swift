//
//  LocalCache.swift
//  configuration-service-sdk-ios
//
//  Created by Oleg Sternberg & Ishai Borovoy on 19/1/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation

class LocalCache {
    static func getConfiguration(configurationId: String) -> Configuration? {
        lock.lock()
        defer {lock.unlock()}
        
        return getConfigurationReentered(configurationId)
    }
    
    static func saveConfiguration(configuration: Configuration) {
        lock.lock()
        defer {lock.unlock()}
        
        FileManager.save(configuration)
    }
    
    static func deleteConfiguration(configurationId: String) {
        lock.lock()
        defer {lock.unlock()}
        
        FileManager.deleteConfiguration(configurationId)
    }
    
    private static func getConfigurationReentered(configurationId: String) -> Configuration? {
        return FileManager.isExpired(configurationId) ? nil : FileManager.configuration(configurationId)
    }
    
    private static let lock = NSLock()
}