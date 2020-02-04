//
//  Tour.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import MapboxDirections
import MapboxCoreNavigation

struct Tour {
    // MARK: - Internal Properties
    let name: String
    let category: String
    let stops: [POI]
    
    // MARK: - Static Properties
    static let dummyData: Tour = Tour(name: "DummyHistory", category: "History", stops: POI.pointsOfinterest)
    
    // MARK: - Static Functions
    static func generateNavigationRouteOptions(from tour: Tour, initialLocation: CLLocationCoordinate2D?, navigationType: MBDirectionsProfileIdentifier) throws -> NavigationRouteOptions {
        
        guard let initialLocation = initialLocation else { throw MapboxError.noInitalUserLocation }
        
        // Get all waypoints for initialLocation and stops in tour
        let stops = tour.stops.map { $0.waypoint }
        let initialWaypoint = Waypoint(coordinate: initialLocation, coordinateAccuracy: -1, name: "Initial Location")
        
        // Create array of waypoints
        var waypoints = [Waypoint]()
        waypoints.append(initialWaypoint)
        for stop in stops {
            waypoints.append(stop)
        }
        
        // Create RouteOptions from waypoints
        //TODO: Determine if we need to handle async for getting options from API
        let options = NavigationRouteOptions(waypoints: waypoints, profileIdentifier: navigationType)
        
        return options
    }
    
}
