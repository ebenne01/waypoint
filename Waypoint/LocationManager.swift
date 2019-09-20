//
//  LocationManager.swift
//  Waypoint
//
//  Created by Edward Bennett on 9/2/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

//import Foundation
import CoreLocation

class LocationManager: NSObject {
    let compassPoints = ["N", "NE", "E", "SE", "S", "SW", "W", "NW", "N"]
    private let locationManager: CLLocationManager
    var heading = "unsupported"
    var lastLocation = ""
    
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
        self.locationManager.requestWhenInUseAuthorization()
        super.init()
    }
    
    func startUpdatingHeading() {
        guard locationManager.delegate != nil else { return }
        
        locationManager.headingFilter = 5
        locationManager.startUpdatingHeading()
    }
    
    func stopUpdatingHeading() {
        locationManager.stopUpdatingHeading()
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    func setLocationManagerDelegate(_ delegate: CLLocationManagerDelegate) {
        locationManager.delegate = delegate
    }
    
    func getDirection(heading: CLLocationDirection) -> String {
        let index = Int((heading + 23) / 45)
        return compassPoints[index]
    }
}

//
// MARK: - CLLocationManagerDelegate
//
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if newHeading.headingAccuracy >= 0 {
            heading = getDirection(heading: newHeading.magneticHeading)
            print("didUpdateHeading - new heading: \(newHeading)")
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let lastLocation = locations.last {
//            self.lastLocation = lastLocation
//        }
//    }
}
