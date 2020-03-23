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
    //    let stops: [POI]
    let stops: [DocumentReference]
    let dateCreated: Date?
    
    // MARK: - Static Properties
//        static let dummyData: Tour = Tour(creatorID: "quavi", name: "DummyHistory", category: "History", stops: POI.pointsOfinterest)
    
    // MARK: - Static Functions
    static func generateTourRouteOptions(from tour: Tour, navigationType: MBDirectionsProfileIdentifier) throws -> NavigationRouteOptions {
        
        let pois = Tour.getPOIFromStops(tour: tour)
        
        // Get all waypoints for stops in tour
        let waypoints = pois.map { $0.waypoint }
        
        // Create RouteOptions from waypoints
        //TODO: Determine if we need to handle async for getting options from API
        let options = NavigationRouteOptions(waypoints: waypoints, profileIdentifier: navigationType)
        
        return options
    }
    
    private static func getPOIFromStops(tour: Tour) -> [POI] {
        var stops = [POI]()
//
//        //Determine if this is the right thread
//        DispatchQueue.global(qos: .utility).async {
//            tour.stops.forEach { (documentReference) in
//                FirestoreService.manager.getPOI(from: documentReference) { (result) in
//
//                    switch result {
//                    case .failure(let error):
//                        print(error)
//                    case .success(let poi):
//                        stops.append(poi)
//                    }
//                }
//            }
//        }
        return stops
    }
    
    // MARK: - Initializers
    // Initializing a Tour in Firestore (creating a new Tour)
    init(creatorID: String, name: String, category: String, stops: [DocumentReference]) {
        //        init(creatorID: String, name: String, category: String, stops: [POI]) {
        self.id = "t-\(UUID().description)"
        self.creatorID = creatorID
        self.name = name
        self.category = category
        self.stops = stops
        self.dateCreated = Date()
    }
    
    // Failing init for when we retreive Tour data from Firestore
    init?(from dict: [String: Any]) {
        guard let id = dict["id"] as? String,
            let creatorID = dict["creatorID"] as? String,
            let name = dict["name"] as? String,
            let category = dict["category"] as? String,
            let stops = dict["stops"] as? [DocumentReference],
            //            let stops = dict["stops"] as? [POI],
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue()
            else { return nil }
        
        self.id = id
        self.creatorID = creatorID
        self.name = name
        self.category = category
        self.stops = stops
        self.dateCreated = dateCreated
    }
    
    // Failing init for when we retreive Tour data from Firestore from a specific creator
    init?(from dict: [String: Any], creatorID: String) {
        guard let id = dict["id"] as? String,
            let name = dict["name"] as? String,
            let category = dict["category"] as? String,
            let stops = dict["stops"] as? [DocumentReference],
            //            let stops = dict["stops"] as? [POI],
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue()
            else { return nil }
        
        self.id = id
        self.creatorID = creatorID
        self.name = name
        self.category = category
        self.stops = stops
        self.dateCreated = dateCreated
    }
    
    // Failing init for when we retreive a specific Tour from Firestore
    init?(from dict: [String: Any], id: String) {
        guard let creatorID = dict["creatorID"] as? String,
            let name = dict["name"] as? String,
            let category = dict["category"] as? String,
            let stops = dict["stops"] as? [DocumentReference],
            //            let stops = dict["stops"] as? [POI],
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue()
            else { return nil }
        
        self.id = id
        self.creatorID = creatorID
        self.name = name
        self.category = category
        self.stops = stops
        self.dateCreated = dateCreated
    }
    
    // Dictionary used for uploading data into Firestore
    var fieldsDict: [String: Any] {
        return [
            "id": self.id,
            "creatorID": self.creatorID,
            "name": self.name,
            "category": self.category,
            // TODO: Handle saving as nested dictionary object
            "stops": self.stops,
            "dateCreated": self.dateCreated ?? ""
        ]
    }
    
    
}
