//
//  Tour.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

struct Tours {
    var name: String
    var category: String
    var stops: [POI]
    
    static let dummyData: Tours = Tours(name: "DummyHistory", category: "History", stops: POI.pointsOfinterest)
}
