//
//  LocationManager.swift
//  Waypoint
//
//  Created by Edward Bennett on 9/2/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import CoreLocation

class LocationManagerVO: ObservableObject {
    @Published var heading: String = "N"
}

class LocationManager: NSObject {
    let compassPoints = ["N", "NE", "E", "SE", "S", "SW", "W", "NW", "N"]
    
    private var locationManager: CLLocationManager?
    var locationManagerVO = LocationManagerVO()
    
    var lastLocation = ""
    
    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func startUpdatingHeading() {
        locationManager?.headingFilter = 5
        locationManager?.startUpdatingHeading()
    }

    func stopUpdatingHeading() {
        locationManager?.stopUpdatingHeading()
    }

    func requestLocation() {
        locationManager?.requestLocation()
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
            locationManagerVO.heading = getDirection(heading: newHeading.magneticHeading)
            print("didUpdateHeading - new heading: \(locationManagerVO.heading)")
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let lastLocation = locations.last {
//            self.lastLocation = lastLocation
//        }
//    }
}
