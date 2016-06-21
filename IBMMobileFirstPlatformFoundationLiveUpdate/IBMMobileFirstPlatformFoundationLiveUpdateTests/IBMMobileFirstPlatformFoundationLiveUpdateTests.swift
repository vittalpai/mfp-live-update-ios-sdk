//
//  IBMMobileFirstPlatformFoundationLiveUpdateTests.swift
//  IBMMobileFirstPlatformFoundationLiveUpdateTests
//
//  Created by Ishai Borovoy on 21/06/2016.
//  Copyright © 2016 Dmitri Pikus. All rights reserved.
//

import XCTest
import IBMMobileFirstPlatformFoundationLiveUpdate
import IBMMobileFirstPlatformFoundation

class IBMMobileFirstPlatformFoundationLiveUpdateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        WLClient.sharedInstance().setServerUrl(NSURL(string: "http://localhost:9080/mfp/api"))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /*func testObtainConfigurationWithSegment() {
        let expectation = self.expectationWithDescription("testObtainConfigurationWithSegment")
        
        LiveUpdateManager.sharedInstance.obtainConfiguration("segment1", useCache: false) { (configuration, error) in
            XCTAssertTrue((configuration?.isFeatureEnabled("feature1"))!, "featue1 should be enabled")
            XCTAssertFalse((configuration?.isFeatureEnabled("feature2"))!, "featue2 should be disabled")
            XCTAssertEqual(configuration?.getProperty("property1"), "value1")
            XCTAssertEqual(configuration?.getProperty("property2"), "value2")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10.0, handler: nil)
    }
    
    func testObtainConfigurationWithParams() {
        let expectation = self.expectationWithDescription("testObtainConfigurationWithSegment")
        
        LiveUpdateManager.sharedInstance.obtainConfiguration(["":""], useCache: false) { (configuration, error) in
            XCTAssertTrue((configuration?.isFeatureEnabled("feature1"))!, "featue1 should be enabled")
            XCTAssertFalse((configuration?.isFeatureEnabled("feature2"))!, "featue2 should be disabled")
            XCTAssertEqual(configuration?.getProperty("property1"), "value1")
            XCTAssertEqual(configuration?.getProperty("property2"), "value2")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10.0, handler: nil)
    }
    
    func testObtainNonExistingSegment() {
        let expectation = self.expectationWithDescription("nonExitingSegment")
        
        
        LiveUpdateManager.sharedInstance.obtainConfiguration("nonExitingSegment", useCache: false) { (configuration, error) in
            XCTAssertTrue((error?.localizedDescription.containsString("404"))!, "segment with name nonExitingSegment should not be exist")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10.0, handler: nil)
    }
    
    
    func testPerformanceExample() {
        self.measureBlock {
        }
    }*/

    
}
