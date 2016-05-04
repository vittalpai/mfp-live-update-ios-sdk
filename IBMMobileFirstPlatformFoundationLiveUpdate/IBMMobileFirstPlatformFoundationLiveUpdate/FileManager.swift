//
//  FileManager.swift
//  configuration-service-sdk-ios
//
//  Created by Oleg Sternberg & Ishai Borovoy on 19/1/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation

class FileManager {
    
    static func isExpired(configurationId: String) -> Bool {
        let metadataFile = MetadataFile()
        return metadataFile.isExpired(configurationId)
    }
    
    static func configuration(configurationId: String) -> Configuration? {
        let configurationFile = ConfigurationFile()
        return configurationFile.read(configurationId)
    }
    
    static func save(configuration: Configuration) {
        let configurationFile = ConfigurationFile()
        
        configurationFile.save(configuration)
    }
    
    static func deleteConfiguration(configurationId: String) {
        ConfigurationFile.purge(configurationId)
    }
    
    class CacheFile {
        init(name: String) {
            self.name = name
        }
        
        private static func getFolder(configurationId: String) -> String {
            return documents.stringByAppendingPathComponent("\(FOLDER_CACHE)/\(configurationId)")
        }
        
        private func getFullName(configurationId: String) -> String {
            return CacheFile.getFolder(configurationId) + "/" + name
        }
        
        private static let FOLDER_CACHE = "cache"
        
        private static let manager = NSFileManager.defaultManager()
        private static let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        private static let documents: AnyObject = paths[0]
        
        private var name: String
    }

    class JsonFile: CacheFile {
        func save(configuration: Configuration) {
            if let configInstance  =  configuration as? ConfigurationInstance{
                save(configInstance.id, json: generateJson(configInstance))
            }
        }
        
        func save(configurationId: String, json: [String: AnyObject]) {
            do {
                try NSFileManager.defaultManager().createDirectoryAtPath(CacheFile.getFolder(configurationId), withIntermediateDirectories: true, attributes: nil)
                
                let data = try NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions(rawValue: 0))
                
                if !data.writeToFile(getFullName(configurationId), atomically: false) {
                    print("failed to write file '\(name)'")
                }
            } catch let error as NSError {
                print(error.localizedDescription);
            }
        }
        
        func read(configurationId: String) -> [String: AnyObject]? {
            let fullName = getFullName(configurationId)
            
            if !CacheFile.manager.fileExistsAtPath(fullName) {
                return nil
            }
            
            do {
                let content = try String(contentsOfFile: fullName, encoding: NSUTF8StringEncoding)
                
                if let data = content.dataUsingEncoding(NSUTF8StringEncoding) {
                    return try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String: AnyObject]
                }
            } catch let error as NSError {
                print(error.localizedDescription);
            }
            
            return nil
        }
        
        private func generateJson(configuration: ConfigurationInstance) -> [String: AnyObject] {
            preconditionFailure("'JsonFile.savedJson' method must be overridden")
        }
    }

    // ConfigurationFile
    private class ConfigurationFile: JsonFile {
        private static let configurationName = "configuration.json"
        private let metadataFile = MetadataFile()
        
        init() {
            super.init(name: ConfigurationFile.configurationName)
        }
        
        override func save(configuration: Configuration) {
            if let configInstance = configuration as? ConfigurationInstance{
                ConfigurationFile.purge(configInstance.id)
                super.save(configInstance)
                metadataFile.save(configInstance)
            }
        }
        
        func read(configurationId: String) -> ConfigurationInstance? {
            if let json = super.read(configurationId) {
                return ConfigurationInstance(id: configurationId, data: json)
            }
            
            return nil
        }
        
        override func generateJson(configuration: ConfigurationInstance) -> [String: AnyObject] {
            return configuration.data
        }
        
        private static func purge(configurationId: String) {
            let folder = CacheFile.getFolder(configurationId)
            
            print("deleting \(folder)")
            
            if manager.fileExistsAtPath(folder) {
                do {
                    try manager.removeItemAtPath(folder)
                } catch let error as NSError {
                    print(error.localizedDescription);
                }
            }
        }
    }

    //MetadataFile
    
    private class MetadataFile: JsonFile {
        private static let metaDataName       = "metadata.json"
        private static let attributeExpireAt  = "expiresAt"
        private static let formatterPatern    = "EEE, dd MMM yyyy HH:mm:ss z"
        private static let formatterTimeZone  = "GMT"
        private static let formatterLocale    = "US"
        
        init() {
            super.init(name: MetadataFile.metaDataName)
        }
        
        override func generateJson(configuration: ConfigurationInstance) -> [String: AnyObject] {
            var json = [String: AnyObject]()
            
            json[MetadataFile.attributeExpireAt]  = configuration.data[MetadataFile.attributeExpireAt] as? String
            
            return json
        }
        
        func isExpired(configurationId: String) -> Bool {
            if let metadata = read(configurationId), expiresAt = metadata[MetadataFile.attributeExpireAt] as? String {
                // NSDateFormatter is not thread-safe on versions earlier than 7
                let formatter = NSDateFormatter()
                
                formatter.dateFormat = MetadataFile.formatterPatern
                formatter.timeZone = NSTimeZone(name: MetadataFile.formatterTimeZone)
                formatter.locale = NSLocale(localeIdentifier: MetadataFile.formatterLocale)
                
                if let expiresAtDate = formatter.dateFromString(expiresAt) {
                    let now = NSDate()
                    
                    return expiresAtDate.compare(now) == NSComparisonResult.OrderedAscending
                }
            }
            
            return true
        }
    }
}