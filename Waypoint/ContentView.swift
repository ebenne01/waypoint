//
//  ContentView.swift
//  Waypoint
//
//  Created by Edward Bennett on 8/30/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    static let space = " "
    
    @ObservedObject var locationManagerVO: LocationManagerVO
    @State var isTracking = false
    @State var waypoint = space
    
    init(_ locationManagerVO: LocationManagerVO) {
        self.locationManagerVO = locationManagerVO
    }
    
    var body: some View {
        VStack {
            Text(self.locationManagerVO.heading)
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
        ContentView(LocationManagerVO())
    }
}
#endif
