//
//  WaypointTests.swift
//  WaypointTests
//
//  Created by Edward Bennett on 8/30/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import XCTest
@testable import Waypoint

class WaypointTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testConvertLatitudeToDegreesMinutesSecondsWhenNorth() {
        let expected = "40° 44' 30\" N"
        let actual = convertLatitudeToDegreesMinutesSeconds(40.741895)
        XCTAssertEqual(expected, actual)
    }
    
    func testConvertLatitudeToDegreesMinutesSecondsWhenSouth() {
        let expected = "40° 44' 30\" S"
        let actual = convertLatitudeToDegreesMinutesSeconds(-40.741895)
        XCTAssertEqual(expected, actual)
    }
    
    func testConvertLongitudeToDegreesMinutesSecondsWhenEast() {
        let expected = "73° 59' 21\" E"
        let actual = convertLongitudeToDegreesMinutesSeconds(73.989308)
        XCTAssertEqual(expected, actual)
    }
    
    func testConvertLongitudeToDegreesMinutesSecondsWhenWest() {
        let expected = "73° 59' 21\" W"
        let actual = convertLongitudeToDegreesMinutesSeconds(-73.989308)
        XCTAssertEqual(expected, actual)
    }
}
