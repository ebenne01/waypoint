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
    @Published var waypoint = " "
}

class LocationManager: NSObject {
    let compassPoints = ["N", "NE", "E", "SE", "S", "SW", "W", "NW", "N"]
    
    private var locationManager: CLLocationManager?
    var locationManagerVO = LocationManagerVO()
    var markedLocation: CLLocation?
    
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
    
    func clearWaypoint() {
        locationManagerVO.waypoint = " "
    }
    
    func setWaypoint(_ location: CLLocation) {
        if markedLocation == nil {
            markedLocation = location
            let latitudeInDegMinSec = convertLatitudeToDegreesMinutesSeconds(location.coordinate.latitude)
            let longitudeInDegMinSec = convertLongitudeToDegreesMinutesSeconds(location.coordinate.longitude)
            locationManagerVO.waypoint = "\(latitudeInDegMinSec), \(longitudeInDegMinSec)"
        }
    }
}

//
// MARK: - CLLocationManagerDelegate
//
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        fatalError()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if newHeading.headingAccuracy >= 0 {
            locationManagerVO.heading = getDirection(heading: newHeading.magneticHeading)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            setWaypoint(lastLocation)
        }
    }
}
