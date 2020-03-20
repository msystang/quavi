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
    let id: String
    let name: String
// TODO: Refactor isCellExpanded logic to VC (not model)
//    var isCellExpanded: Bool
    let lat: Double
    let long: Double
    let shortDesc: String
    let longDesc: String
    let tableViewImage: String
    let poiImage: [String]
    
    
    // MARK: - Computed Variables
    var waypoint: Waypoint {
        let coordinate = CLLocationCoordinate2D(latitude: self.lat, longitude: self.long)
        let waypoint = Waypoint(coordinate: coordinate, coordinateAccuracy: -1, name: self.name)
        return waypoint
    }
    
    // MARK: - Static Variables
    // TODO: remove after fully transferred over getting data from Firestore
    static let pointsOfinterest:[POI] = []
//    static let pointsOfinterest:[POI] = [
//        POI(
//            name: "Empire State Building",
//            isCellExpanded: false,
//            lat: 40.748817,
//            long: -73.985428,
//            shortDesc: "The Empire State Building is a 102-story Art Deco skyscraper in Midtown Manhattan, New York City. It was designed by Shreve, Lamb & Harmon and completed in 1931. The building has a roof height of 1,250 feet (380 m) and stands a total of 1,454 feet (443.2 m) tall, including its antenna. Its name is derived from 'Empire State', the nickname of New York.",
//            longDesc: "The site of the Empire State Building, located in Midtown South on the west side of Fifth Avenue between West 33rd and 34th Streets, was originally part of an early 18th-century farm, then became the site of the Waldorf–Astoria Hotel in 1893. In 1929, Empire State Inc. acquired the site and devised plans for a skyscraper there. The design for the Empire State Building was changed fifteen times until it was ensured to be the world's tallest building. Construction started on March 17, 1930, and the building opened thirteen and a half months afterward on May 1, 1931. Despite the publicity surrounding the building's construction, its owners failed to make a profit until the early 1950s. Since its opening, the building's Art Deco architecture and open-air observation deck has made it a popular attraction, with around 4 million tourists from around the world visiting the building's 86th and 102nd floor observatories every year. The building stands near other major Midtown tourist attractions including Pennsylvania Station, Madison Square Garden, Koreatown, and Macy's Herald Square.",
//            tableViewImage: UIImage(named: "empireState1")!,
//            popoverImage: UIImage(named: "empireState2")!),
//        POI(
//            name: "National Museum of Mathematics",
//            isCellExpanded: false,
//            lat: 40.743445,
//            long: -73.987228,
//            shortDesc: "The National Museum of Mathematics or MoMath is a museum dedicated to mathematics in Manhattan, New York City. It opened on December 15, 2012. It is located at 11 East 26th Street between Fifth and Madison Avenues, across from Madison Square Park in the NoMad neighborhood.",
//            longDesc: "In 2006 the Goudreau Museum on Long Island, at the time the only museum in the United States dedicated to mathematics, closed its doors. In response, a group led by founder and former CEO Glen Whitney met to explore the opening of a new museum. They received a charter from the New York State Department of Education in 2009, and raised over 22 million dollars in under four years. With this funding, a 19,000 square feet (1,800 m2) space was leased in the Goddard Building at 11-13 East 26th Street, located in the Madison Square North Historic District. Despite some opposition to the architectural plans within the local community, permission for construction was granted by the New York City Landmarks Preservation Commission and the Department of Buildings.",
//            tableViewImage: UIImage(named: "moMath1")!,
//            popoverImage: UIImage(named: "moMath2")!),
//        POI(
//            name: "Rubin Museum of Art",
//            isCellExpanded: false,
//            lat: 40.7422526,
//            long: -73.9974155,
//            shortDesc: "The Rubin Museum of Art is a dynamic environment that stimulates learning, promotes understanding, and inspires personal connections to the ideas, cultures, and art of Himalayan regions.",
//            longDesc: """
//            The Rubin Museum of Art is a dynamic environment that stimulates learning, promotes understanding, and inspires personal connections to the ideas, cultures, and art of Himalayan regions.
//
//            We believe in taking an open and active approach to engaging learners at all levels and helping them to understand our world. We do this by encouraging deep connections and transformational experiences in a welcoming, enjoyable, and beautiful environment.
//
//            Visitors are at our core. We share with all communities our collection and broadly conceived exhibitions as a catalyst for dialogues about art and culture.
//            """,
//            tableViewImage: UIImage(named: "theRubin1")!,
//            popoverImage: UIImage(named: "theRubin2")!)
//    ]
    

    // Initializing a POI in Firestore (creating a new POI)
    init(name: String, lat: Double, long: Double, shortDesc: String, longDesc: String, tableViewImage: String, poiImage: [String]) {
        self.id = "poi-\(UUID().description)"
        self.name = name
        self.lat = lat
        self.long = long
        self.shortDesc = shortDesc
        self.longDesc = longDesc
        self.tableViewImage = tableViewImage
        self.poiImage = poiImage
    }
    
    // Failing init for when we retreive POI data from Firestore
    init?(from dict: [String: Any]) {
        guard let id = dict["name"] as? String,
        let name = dict["name"] as? String,
        let lat = dict["lat"] as? Double,
        let long = dict["long"] as? Double,
        let shortDesc = dict["shortDesc"] as? String,
        let longDesc = dict["longDesc"] as? String,
        let tableViewImage = dict["tableViewImage"] as? String,
        let poiImage = dict["poiImage"] as? [String]
        else { return nil }
        
        self.id = id
        self.name = name
        self.lat = lat
        self.long = long
        self.shortDesc = shortDesc
        self.longDesc = longDesc
        self.tableViewImage = tableViewImage
        self.poiImage = poiImage
    }
    
    // Failing init for when we retreive a specific POI from Firestore
    init?(from dict: [String: Any], id: String) {
        guard let name = dict["name"] as? String,
        let lat = dict["lat"] as? Double,
        let long = dict["long"] as? Double,
        let shortDesc = dict["shortDesc"] as? String,
        let longDesc = dict["longDesc"] as? String,
        let tableViewImage = dict["tableViewImage"] as? String,
        let poiImage = dict["poiImage"] as? [String]
        else { return nil }
        
        self.id = id
        self.name = name
        self.lat = lat
        self.long = long
        self.shortDesc = shortDesc
        self.longDesc = longDesc
        self.tableViewImage = tableViewImage
        self.poiImage = poiImage
    }
    
    // Dictionary used for uploading data into Firestore
    var fieldsDict: [String: Any] {
        return [
            "id": self.id,
            "name": self.name,
            "lat": self.lat,
            "long": self.long,
            "shortDesc": self.shortDesc,
            "longDesc": self.longDesc,
            "tableViewImage": self.tableViewImage,
            "poiImage": self.poiImage
        ]
    }
    
}
