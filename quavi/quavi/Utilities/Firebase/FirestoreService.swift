//
//  FireStoreService.swift
//  quavi
//
//  Created by Sunni Tang on 3/9/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseFirestore

fileprivate enum FireStoreCollections: String {
    case users
    case tour
    case POI
}

class FirestoreService {
    static let manager = FirestoreService()
    
    private let db = Firestore.firestore()
    
    //MARK: AppUsers
    func createAppUser(user: AppUser, completion: @escaping (Result<(), Error>) -> ()) {
        var fields = user.fieldsDict
        fields["dateCreated"] = Date()
        db.collection(FireStoreCollections.users.rawValue).document(user.uid).setData(fields) { (error) in
            
            if let error = error {
                completion(.failure(error))
                print(error)
            }
            
            completion(.success(()))
        }
    }
    
    func updateCurrentUser(userName: String? = nil, photoURL: URL? = nil, completion: @escaping (Result<(), Error>) -> ()){
        guard let userId = FirebaseAuthService.manager.currentUser?.uid else {
            //MARK: TODO - handle can't get current user
            return
        }
        var updateFields = [String:Any]()
        
        if let user = userName {
            updateFields["userName"] = user
        }
        
        if let photo = photoURL {
            updateFields["photoURL"] = photo.absoluteString
        }
        
        
        //PUT request
        db.collection(FireStoreCollections.users.rawValue).document(userId).updateData(updateFields) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
            
        }
    }
    
    func getAllUsers(completion: @escaping (Result<[AppUser], Error>) -> ()) {
        db.collection(FireStoreCollections.users.rawValue).getDocuments { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                let users = snapshot?.documents.compactMap({ (snapshot) -> AppUser? in
                    let userID = snapshot.documentID
                    let user = AppUser(from: snapshot.data(), uid: userID)
                    return user
                })
                completion(.success(users ?? []))
            }
        }
    }
    
    //MARK: Tours
    func createTour(tour: Tour, completion: @escaping (Result<(), Error>) -> ()) {
        var fields = tour.fieldsDict
        fields["dateCreated"] = Date()
        db.collection(FireStoreCollections.tour.rawValue).addDocument(data: fields) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func getAllTours(completion: @escaping (Result<[Tour], Error>) -> ()) {
        
        db.collection(FireStoreCollections.tour.rawValue).getDocuments { (snapshot, error) in
            
            if let error = error {
                completion(.failure(error))
            } else {
                let tours = snapshot?.documents.compactMap({ (snapshot) -> Tour? in
                    let tourID = snapshot.documentID
                    let tour = Tour(from: snapshot.data(), id: tourID)
                    return tour
                })
                completion(.success(tours ?? []))
            }
        }
    }
    
    func getTours(for category: Category, completion: @escaping (Result<[Tour],Error>) -> ()) {
        
    }
    
    func getTours(for userID: String, completion: @escaping (Result<[Tour], Error>) -> ()) {
        db.collection(FireStoreCollections.tour.rawValue).whereField("creatorID", isEqualTo: userID).getDocuments { (snapshot, error) in
            
            if let error = error {
                completion(.failure(error))
            } else {
                let tours = snapshot?.documents.compactMap({ (snapshot) -> Tour? in
                    let tourID = snapshot.documentID
                    let tour = Tour(from: snapshot.data(), id: tourID)
                    return tour
                })
                completion(.success(tours ?? []))
            }
        }
    }
    
    //MARK: POI
    func createPOI(poi: POI, completion: @escaping (Result<(),Error>) -> ()) {
        var fields = poi.fieldsDict
        
        db.collection(FireStoreCollections.POI.rawValue).addDocument(data: fields) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func getPOIs(for userID: String, completion: @escaping (Result<[POI], Error>) -> ()) {
        db.collection(FireStoreCollections.POI.rawValue).whereField("userID", isEqualTo: userID).getDocuments { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                let pois = snapshot?.documents.compactMap({ (snapshot) -> POI? in
                    let poiID = snapshot.documentID
                    let poi = POI(from: snapshot.data(), id: poiID)
                    return poi
                })
                completion(.success(pois ?? []))
            }
        }
    }
    
    func getPOI(from documentReferences: DocumentReference, completion: @escaping (Result<POI,Error>) -> ()) {
//        
//        let fb = db.collection(FireStoreCollections.POI.rawValue).whereField("id", isEqualTo: documentReference.documentID)
//        fb.getDocument
//        
//        db.collection(FireStoreCollections.POI.rawValue).whereField("id", isEqualTo: documentReference.documentID).getDocuments { (snapshot, error) in
//            
//            if let error = error {
//                completion(.failure(error))
//            } else {
//                let poi = snapshot?.documents.compactMap({ (snapshot) -> POI? in
//                    let poiID = snapshot.documentID
//                    let poi = POI(from: snapshot.data(), id: poiID)
//                    return poi
//                })
//                completion(.success(pois ?? []))
//            }
//        }
//        
    }
    
    private init () {}
}
