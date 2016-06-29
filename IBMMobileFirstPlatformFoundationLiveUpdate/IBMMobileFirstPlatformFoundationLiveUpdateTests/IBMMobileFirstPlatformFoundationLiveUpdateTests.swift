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
//  IBMMobileFirstPlatformFoundationLiveUpdate.h
//  IBMMobileFirstPlatformFoundationLiveUpdate
//
//  Created by Dmitri Pikus & Ishai Borovoy on 24/01/2016.
//  Copyright © 2016 Dmitri Pikus. All rights reserved.
//

import XCTest
import IBMMobileFirstPlatformFoundationLiveUpdate
import IBMMobileFirstPlatformFoundation

class IBMMobileFirstPlatformFoundationLiveUpdateTests: CustomXCTest {
    
    override func setUp() {
        super.setUp()
        
        //WLClient.sharedInstance().setServerUrl(NSURL(string: "http://159.122.222.159:9080/mfp/api"))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testObtainConfigurationWithSegment() {
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
    
    func testObtainConfigurationWithNonEnglishCharacterSegment() {
        let expectation = self.expectationWithDescription("testObtainConfigurationWithNonEnglishCharecterSegment")
        
        LiveUpdateManager.sharedInstance.obtainConfiguration("Çàâｱｲｳ", useCache: false) { (configuration, error) in
            XCTAssertTrue((configuration?.isFeatureEnabled("ÇàâｱｲｳÇàâｱｲｳ"))!, "ÇàâｱｲｳÇàâｱｲｳ should be enabled")
            XCTAssertEqual(configuration?.getProperty("property1"), "Çàâｱｲｳ")
            XCTAssertEqual(configuration?.getProperty("property2"), "ÇàâｱｲｳÇàâｱｲｳ")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10.0, handler: nil)
    }
    
    func testObtainConfigurationWithSpaceSegment() {
        let expectation = self.expectationWithDescription("testObtainConfigurationWithSpaceSegment")
        
        LiveUpdateManager.sharedInstance.obtainConfiguration("segment 3", useCache: false) { (configuration, error) in
            XCTAssertTrue((configuration?.isFeatureEnabled("feature 3"))!, "segment 3 should be enabled")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10.0, handler: nil)
    }
    
    func testObtainConfigurationWithParams() {
        let expectation = self.expectationWithDescription("testObtainConfigurationWithSegment")
        
        LiveUpdateManager.sharedInstance.obtainConfiguration(["param1":"value1"], useCache: false) { (configuration, error) in
            XCTAssertFalse((configuration?.isFeatureEnabled("feature1"))!, "featue1 should be disabled")
            XCTAssertTrue((configuration?.isFeatureEnabled("feature2"))!, "featue2 should be enabled")
            XCTAssertEqual(configuration?.getProperty("property1"), "value11")
            XCTAssertEqual(configuration?.getProperty("property2"), "value22")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10.0, handler: nil)
    }
    
    func testObtainConfigurationWithNonEnglishAndSpaceParams() {
        let expectation = self.expectationWithDescription("testObtainConfigurationWithNonEnglishAndSpaceParams")
        
        LiveUpdateManager.sharedInstance.obtainConfiguration(["Çà âｱｲｳ":"Çàâｱｲ ｳÇàâｱｲｳ"], useCache: false) { (configuration, error) in
            XCTAssertFalse((configuration?.isFeatureEnabled("Çàâｱｲ ｳÇàâｱｲｳ"))!, "featue1 should be disabled")
            XCTAssertEqual(configuration?.getProperty("ÇàâｱｲｳÇàâｱ ｲｳ"), "ÇàâｱｲｳÇàâｱ ｲｳ ÇàâｱｲｳÇàâｱ ｲｳ")
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
         
    }

    
}
