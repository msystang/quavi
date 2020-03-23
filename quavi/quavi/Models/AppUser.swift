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
    let uid: String
    let email: String
    let userName: String?
    let photoURL: String?
    let isOnboarded: Bool
    let savedTours: [Tour]
    let savedPOI: [POI]
    let createdTours: [Tour]
    let dateCreated: Date?
    
    // MARK: - Initializers
    // Initializing a user in Firebase/Auth (creating a new user)
    init(from user: User) {
        self.uid = user.uid
        self.email = user.email ?? "Could not retrieve email"
        self.userName = user.displayName
        self.photoURL = user.photoURL?.absoluteString
        self.isOnboarded = false
        self.savedTours = []
        self.savedPOI = []
        self.createdTours = []
        self.dateCreated = user.metadata.creationDate
    }
    
    // Failing init for when we retreive user data from Firestore
    init?(from dict: [String: Any], uid: String) {
        guard let email = dict["email"] as? String,
            let userName = dict["userName"] as? String,
            let photoURL = dict["photoURL"] as? String,
            let isOnboarded = dict["isOnboarded"] as? Bool,
            let savedTours = (dict["savedTours"] as? [[String:Any]])?.compactMap( { Tour(from: $0)} ),
            let savedPOI = (dict["savedPOI"] as? [[String:Any]])?.compactMap( { POI(from: $0)} ),
            let createdTours = (dict["createdTours"] as? [[String:Any]])?.compactMap( { Tour(from: $0)} ),
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }
        
        self.uid = uid
        self.email = email
        self.userName = userName
        self.photoURL = photoURL
        self.isOnboarded = isOnboarded
        self.savedTours = savedTours
        self.savedPOI = savedPOI
        self.createdTours = createdTours
        self.dateCreated = dateCreated
    }
    
    var fieldsDict: [String: Any] {
        return [
            "email": self.email,
            "userName": self.userName ?? "",
            "photoURL": self.photoURL ?? "",
            "isOnboarded": self.isOnboarded,
            "savedTours": self.savedTours,
            "savedPOI": self.savedPOI,
            "createdTours": self.createdTours,
        ]
    }
}
