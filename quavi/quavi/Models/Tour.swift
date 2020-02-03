//
//  Tour.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import MapboxDirections

struct Tour {
    let name: String
    let category: String
    let stops: [POI]
    
    static let dummyData: Tour = Tour(name: "DummyHistory", category: "History", stops: POI.pointsOfinterest)
    
    func generateWaypoints(from tour: Tour) -> [Waypoint] {
        let waypoints = tour.stops.map { $0.waypoint }
        return waypoints
    }
}
