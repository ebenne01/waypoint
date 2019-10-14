//
//  ContentView.swift
//  Waypoint
//
//  Created by Edward Bennett on 8/30/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var locationManager: LocationManager
    
    @ObservedObject var locationManagerVO: LocationManagerVO
    @State var isTracking = false
    
    var body: some View {
        VStack {
            Text(self.locationManagerVO.heading)
                .font(.title)
                .padding()
            Text(locationManagerVO.waypoint)
            Spacer()
            Text("90")
                .font(.system(size: 120))
                .padding()
                .background(Color.blue)
            Text("200M")
                .background(Color.purple)
            Spacer()
            Button(action: {self.setWaypoint()}) {
                Text(self.isTracking ? "Clear" : "Set")
            }.padding().font(.largeTitle)
        }
    }
    
    init(_ locationManager: LocationManager) {
        self.locationManager = locationManager
        self.locationManagerVO = locationManager.locationManagerVO
    }

    func setWaypoint() -> Void {
        if isTracking {
            locationManager.clearWaypoint()
        } else {
            locationManager.requestLocation()
        }
        self.isTracking.toggle()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(LocationManager())
    }
}
#endif
