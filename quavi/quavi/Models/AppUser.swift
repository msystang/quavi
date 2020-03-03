//
//  AppUser.swift
//  quavi
//
//  Created by Sunni Tang on 3/2/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct AppUser {
    let email: String?
    let uid: String
    let userName: String?
    let dateCreated: Date?
    let photoURL: String?
//    let isOnboarded: Bool
//    let savedTours: [Tour]?
//    let savedPOI: [POI]?
//    // TODO: Change to user generated tour model
//    let createdTours: [Tour]?
    
    // Initializing a user in Firebase/Auth (creating a new user)
    init(from user: User) {
        self.userName = user.displayName
        self.email = user.email
        self.uid = user.uid
        self.dateCreated = user.metadata.creationDate
        self.photoURL = user.photoURL?.absoluteString
//        self.isOnboarded = false
//        self.savedTours = nil
//        self.savedPOI = nil
//        self.createdTours = nil
    }

    // Failing init for when we retreive user data from Firestore
    init?(from dict: [String: Any], id: String) {
        guard let userName = dict["userName"] as? String,
            let email = dict["email"] as? String,
            let photoURL = dict["photoURL"] as? String,
            //TODO: Update using dictionary logic from failing inits in other models
//            let isOnboarded = dict["isOnboarded"] as? Bool,
//            let savedTours = dict["savedTours"] as? [Tour],
////            let savedTours = (dict["savedTours"] as? [[String:Any]])?.compactMap(Tour(from: $0)),
//            let savedPOI = dict["savedPOI"] as? [POI],
//            let createdTours = dict["createdTours"] as? [Tour],
            //TODO - extend Date to convert from Timestamp?
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }

        self.userName = userName
        self.email = email
        self.uid = id
        self.dateCreated = dateCreated
        self.photoURL = photoURL
//        self.isOnboarded = isOnboarded
//        self.savedTours = savedTours
//        self.savedPOI = savedPOI
//        self.createdTours = createdTours
    }

    var fieldsDict: [String: Any] {
        return [
            "userName": self.userName ?? "",
            "email": self.email ?? "",
//            "isOnboarded": self.isOnboarded ?? false,
//            "savedTours": self.savedTours ?? [],
//            "savedPOI": self.savedPOI ?? [],
//            "createdTours": self.createdTours ?? []
        ]
    }
}

//update entry in firestore for specific fields
