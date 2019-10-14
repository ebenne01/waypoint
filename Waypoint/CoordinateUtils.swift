//
//  CoordinateUtils.swift
//  Waypoint
//
//  Created by Edward Bennett on 9/26/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import Foundation

func convertToDegreesMinutesSeconds(_ coordinate: Double) -> String {
    guard !coordinate.isLess(than: 0.0) else { return "" }
    
    let degrees = Int(coordinate)
    let minutes = Int((coordinate - Double(degrees)) * 60)
    let seconds = Int(((coordinate - Double(degrees)) - Double(minutes) / 60) * 3600)
    
    return "\(degrees)° \(minutes)' \(seconds)\""
}

public func convertLatitudeToDegreesMinutesSeconds(_ coordinate: Double) -> String {
    let isNegative = coordinate.isLess(than: 0.0)
    let degMinSec = isNegative ? convertToDegreesMinutesSeconds(-coordinate) : convertToDegreesMinutesSeconds(coordinate)
    return isNegative ? "\(degMinSec) S" : "\(degMinSec) N"
}

public func convertLongitudeToDegreesMinutesSeconds(_ coordinate: Double) -> String {
    let isNegative = coordinate.isLess(than: 0.0)
    let degMinSec = isNegative ? convertToDegreesMinutesSeconds(-coordinate) : convertToDegreesMinutesSeconds(coordinate)
    return isNegative ? "\(degMinSec) W" : "\(degMinSec) E"
}
