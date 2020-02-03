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
    let name: String
    let category: String
    let stops: [POI]
    
    static let dummyData: Tour = Tour(name: "DummyHistory", category: "History", stops: POI.pointsOfinterest)
    
    private func generateWaypoints(from tour: Tour) -> [Waypoint] {
        let waypoints = tour.stops.map { $0.waypoint }
        return waypoints
    }
    
    func generateNaviationRouteOptions(from tour: Tour, initialLocation: CLLocationCoordinate2D?, navigationType: MBDirectionsProfileIdentifier, completion: @escaping ((Result<NavigationRouteOptions, MapboxError>) -> ())) {
        
        //TODO: Handle else statement
        guard let initialLocation = initialLocation else { return }
        
        let initialWaypoint = Waypoint(coordinate: initialLocation, coordinateAccuracy: -1, name: "Initial Location")
        let stops = generateWaypoints(from: tour)
        
        var waypoints = [Waypoint]()
        waypoints.append(initialWaypoint)
        waypoints.append(contentsOf: stops)
        
        let options = NavigationRouteOptions(waypoints: waypoints, profileIdentifier: navigationType)
        
        completion(.success(options))
        completion(.failure(MapboxError.generatingOptionsError))
    }
    
    //TODO: make generateRoute(from options:...) func in MapVC
    
}
