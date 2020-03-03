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
import FirebaseFirestore

struct Tour {
    // MARK: - Internal Properties
    let id: String
    let creatorID: String
    let name: String
    let category: String
    let stops: [POI]
    let dateCreated: Date?
    
    // MARK: - Static Properties
    static let dummyData: Tour = Tour(creatorID: "quavi", name: "DummyHistory", category: "History", stops: POI.pointsOfinterest)
    
    // MARK: - Static Functions
    static func generateTourRouteOptions(from tour: Tour, navigationType: MBDirectionsProfileIdentifier) throws -> NavigationRouteOptions {
        
        // Get all waypoints for tops in tour
        let stops = tour.stops.map { $0.waypoint }
        
        // Create RouteOptions from waypoints
        //TODO: Determine if we need to handle async for getting options from API
        let options = NavigationRouteOptions(waypoints: stops, profileIdentifier: navigationType)
        
        return options
    }
    
    // MARK: - Initializers
    init(creatorID: String, name: String, category: String, stops: [POI]) {
        self.id = "tour-\(UUID().description)"
        self.creatorID = creatorID
        self.name = name
        self.category = category
        self.stops = stops
        self.dateCreated = Date()
    }
    
    init?(from dict: [String: Any], id: String) {
        guard let creatorID = dict["creatorID"] as? String,
            let name = dict["name"] as? String,
            let category = dict["category"] as? String,
            // Temp property
            let stops = dict["stops"] as? [POI],
                //TODO: Handle nested objects from Firebase
//            let stops = (dict["stops"] as? [[String:Any]])?.compactMap(POI(from: $0)),
        let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }
        
        self.id = id
        self.creatorID = creatorID
        self.name = name
        self.category = category
        self.stops = stops
        self.dateCreated = dateCreated
    }
    
    var fieldsDict: [String: Any] {
        return [
            "creatorID": self.creatorID,
            "name": self.name,
            "category": self.category,
            "stops": self.stops ,
            "dateCreated": self.dateCreated ?? ""
        ]
    }
    
    
}
