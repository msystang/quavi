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
    static func generateTourRouteOptions(from tour: Tour, initialLocation: CLLocationCoordinate2D?, navigationType: MBDirectionsProfileIdentifier) throws -> NavigationRouteOptions {
        
        guard let initialLocation = initialLocation else { throw MapboxError.noInitalUserLocation }
        
        // Get all waypoints for initialLocation and stops in tour
        var stops = tour.stops.map { $0.waypoint }
        let initialWaypoint = Waypoint(coordinate: initialLocation, coordinateAccuracy: -1, name: "Initial Location")
        
        //adds initial waypoint to stops array
        stops.insert(initialWaypoint, at: 0)
        // Create RouteOptions from waypoints
        //TODO: Determine if we need to handle async for getting options from API
        let options = NavigationRouteOptions(waypoints: stops, profileIdentifier: navigationType)
        
        return options
    }
    
}
