//
//  POI.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit
import MapboxDirections

struct POI {
    let name: String
    let index: Int
    let lat: Double
    let long: Double
    let shortDesc: String
    let longDesc: String
    let tableViewImage: String
    let poiImages: [String]
    
    // MARK: - Computed Variables
    var waypoint: Waypoint {
        let coordinate = CLLocationCoordinate2D(latitude: self.lat, longitude: self.long)
        let waypoint = Waypoint(coordinate: coordinate, coordinateAccuracy: -1, name: self.name)
        return waypoint
    }
    
    // MARK: - Initializers

    // Initializing a POI in Firestore (creating a new POI)
    init(name: String, index: Int, lat: Double, long: Double, shortDesc: String, longDesc: String, tableViewImage: String, poiImages: [String]) {
        self.id = "poi-\(UUID().description)"
        self.name = name
        self.index = index
        self.lat = lat
        self.long = long
        self.shortDesc = shortDesc
        self.longDesc = longDesc
        self.tableViewImage = tableViewImage
        self.poiImages = poiImages
    }
    
    // Failing init for when we retreive POI data from Firestore
    init?(from dict: [String: Any]) {
        guard let id = dict["name"] as? String,
        let name = dict["name"] as? String,
        let index = dict["index"] as? Int,
        let lat = dict["lat"] as? Double,
        let long = dict["long"] as? Double,
        let shortDesc = dict["shortDesc"] as? String,
        let longDesc = dict["longDesc"] as? String,
        let tableViewImage = dict["tableViewImage"] as? String,
        let poiImages = dict["poiImages"] as? [String]
        else { return nil }
        
        self.id = id
        self.name = name
        self.index = index
        self.lat = lat
        self.long = long
        self.shortDesc = shortDesc
        self.longDesc = longDesc
        self.tableViewImage = tableViewImage
        self.poiImages = poiImages
    }
    
    // Failing init for when we retreive a specific POI by id from Firestore
    init?(from dict: [String: Any], id: String) {
        guard let name = dict["name"] as? String,
        let index = dict["index"] as? Int,
        let lat = dict["lat"] as? Double,
        let long = dict["long"] as? Double,
        let shortDesc = dict["shortDesc"] as? String,
        let longDesc = dict["longDesc"] as? String,
        let tableViewImage = dict["tableViewImage"] as? String,
        let poiImages = dict["poiImages"] as? [String]
        else { return nil }
        
        self.id = id
        self.name = name
        self.index = index
        self.lat = lat
        self.long = long
        self.shortDesc = shortDesc
        self.longDesc = longDesc
        self.tableViewImage = tableViewImage
        self.poiImages = poiImages
    }
    
    // Dictionary used for uploading data into Firestore
    var fieldsDict: [String: Any] {
        return [
            "id": self.id,
            "name": self.name,
            "index": self.index,
            "lat": self.lat,
            "long": self.long,
            "shortDesc": self.shortDesc,
            "longDesc": self.longDesc,
            "tableViewImage": self.tableViewImage,
            "poiImages": self.poiImages
        ]
    }
    
}
