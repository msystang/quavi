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
    static func generateTourRouteOptions(from tour: Tour, navigationType: MBDirectionsProfileIdentifier) throws -> NavigationRouteOptions {
        
        // Get all waypoints for tops in tour
        let stops = tour.stops.map { $0.waypoint }
    
        // Create RouteOptions from waypoints
        //TODO: Determine if we need to handle async for getting options from API
        let options = NavigationRouteOptions(waypoints: stops, profileIdentifier: navigationType)
        
        return options
    }
    
    
    static func generateRouteOptionsForCurrentLeg(from selectedRoute: Route?, userLocation: CLLocationCoordinate2D?, nextStopIndex: Int, navigationType: MBDirectionsProfileIdentifier) throws -> NavigationRouteOptions {
        
        guard let selectedRoute = selectedRoute else {
            throw MapboxError.noSelectedRoute
        }
        
        guard let userLocation = userLocation else {
            throw MapboxError.noInitalUserLocation
        }

        let initialWaypoint = Waypoint(coordinate: userLocation, coordinateAccuracy: -1, name: "Initial Location")
        let nextWaypoint = selectedRoute.routeOptions.waypoints[nextStopIndex]

        //TODO: Determine if we need to handle async for getting options from API
        let options = NavigationRouteOptions(waypoints: [initialWaypoint, nextWaypoint], profileIdentifier: navigationType)
        
        return options
    }
    
}
