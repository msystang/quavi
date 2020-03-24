//
//  FirestoreService.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

import FirebaseFirestore

import FirebaseAuth

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
    
    // nested objects in Firebase come back as an Array of document references, figure out how to use the pointer to get the document ID of the POI to cast as dictionary into POI. DocumentReference.documentID
    // Make network call to get POI in firebase then turn into POI
    // Make private func to get POI from Document References
    
//    func getPOI(from documentReference: DocumentReference, completion: @escaping (Result<POI,Error>) -> ()) {
//        let id = documentReference.documentID
//        db.collection(FireStoreCollections.POI.rawValue).document(id).getDocument { (snapshot, error) in
//
//            if let error = error {
//                completion(.failure(error))
//            } else if let snapshot = snapshot {
//                if let poiDict = snapshot.data() {
//                    if let poi = POI(from: poiDict, id: id) {
//                        completion(.success(poi))
//                    }
//                }
//            }
//        }
//
//    }
    
    
    func getPOIs(from tour: Tour, completion: @escaping (Result<[POI],Error>) -> ()) {

        let tourReference = db.collection("tour").document(tour.id)

        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let tourDocument: DocumentSnapshot
            do {
                try tourDocument = transaction.getDocument(tourReference)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }

        
            
            guard let stopsDict = tourDocument.data(), let stops = tourDocument.data()?["stops"] as? [DocumentReference] else {
                let error = NSError(
                    domain: "AppErrorDomain",
                    code: -1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Unable to retrieve population from snapshot \(tourDocument)"
                    ]
                )
                errorPointer?.pointee = error
                return nil
            }

            var pois = [POI]()
            
            stops.forEach { (documentReference) in
                //Handle this else
                guard let poi = POI(from: stopsDict, id: documentReference.documentID) else { return }
                pois.append(poi)
            }
            
            pois.sort { $0.index < $1.index }
            
            return nil
        }) { (object, error) in
            if let error = error {
                print("Transaction failed: \(error)")
            } else {
                print("Transaction successfully committed!")
            }
        }

    }
    
    func getUsernameOrEmail(whichOne usernameOrEmail: String, completion: @escaping (Result<String, Error>) -> ()) {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("error, no user logged in")
            return
        }
        let document = db.collection("users").document(userID)
        
        document.getDocument { (snapshot, error) in
            if error == nil {
                guard let data = snapshot?.data()?[usernameOrEmail] else {
                    print("could not find field")
                    return
                }
                
                if let result = data as? String {
                    print(result)
                    completion(.success(result))
                } else {
                    print("failure downcasting experience as string")
                }
            } else {
                completion(.failure(error!))
            }
        }
    }
    
    private init () {}
}
