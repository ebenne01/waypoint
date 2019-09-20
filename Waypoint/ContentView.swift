//
//  ContentView.swift
//  Waypoint
//
//  Created by Edward Bennett on 8/30/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ContentView : View {
    static let space = " "
    @State var isTracking = false
    @State var waypoint = space
    
    var locationManager: LocationManager
    
    var body: some View {
        VStack {
            Text("Heading")
                .font(.title)
                .padding()
                .background(Color.red)
            Text(waypoint)
                .background(Color.green)
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
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
    
    func setWaypoint() -> Void {
        if isTracking {
            waypoint = ContentView.space
        } else {
            waypoint = "Tracking"
        }
        self.isTracking.toggle()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(locationManager: LocationManager())
    }
}
#endif
