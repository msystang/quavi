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
// TODO: Determine AppUser model logic
//    let savedTours: [Tour]?
//    let savedPOI: [POI]?
//    let createdTours: [Tour]?

    init(from user: User) {
        self.userName = user.displayName
        self.email = user.email
        self.uid = user.uid
        self.dateCreated = user.metadata.creationDate
        self.photoURL = user.photoURL?.absoluteString
    }

    init?(from dict: [String: Any], id: String) {
        guard let userName = dict["userName"] as? String,
            let email = dict["email"] as? String,
            let photoURL = dict["photoURL"] as? String,
            /ODO - extend Date to convert from Timestamp?
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }

        self.userName = userName
        self.email = email
        self.uid = id
        self.dateCreated = dateCreated
        self.photoURL = photoURL
    }

    var fieldsDict: [String: Any] {
        return [
            "userName": self.userName ?? "",
            "email": self.email ?? ""
        ]
    }
}
