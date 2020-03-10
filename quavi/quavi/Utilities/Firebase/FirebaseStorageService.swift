//
//  FirebaseStorageService.swift
//  quavi
//
//  Created by Sunni Tang on 3/10/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseStorage

class FirebaseStorageService {F
    enum ImageType {
        case profileImage
        case quaviTourPOIImage
        case quaviTourTBVImage
        case userTourImage
    }
    
    static var profileImageManager = FirebaseStorageService(imageType: .profileImage)
    static var quaviTourPOIImageManager = FirebaseStorageService(imageType: .quaviTourPOIImage)
    static var quaviTourTBVImageManager = FirebaseStorageService(imageType: .quaviTourTBVImage)
    static var userTourImage = FirebaseStorageService(imageType: .userTourImage)
    
    private let storage: Storage!
    private let storageReference: StorageReference
    private let imagesFolderReference: StorageReference
    
    private init(imageType: ImageType) {
        storage = Storage.storage()
        storageReference = storage.reference()
        
        switch imageType {
        case .profileImage:
            imagesFolderReference = storageReference.child("profile-images")
        case .quaviTourPOIImage:
            imagesFolderReference = storageReference.child("POI-Images")
        case .quaviTourTBVImage:
            imagesFolderReference = storageReference.child("TableView-Images")
        case .userTourImage:
            imagesFolderReference = storageReference.child("user-tour-images")
            
        }
    }
    
    func storeImage(image: Data,  completion: @escaping (Result<URL,Error>) -> ()) {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        let uuid = UUID()
        let imageLocation = imagesFolderReference.child(uuid.description)
        imageLocation.putData(image, metadata: metadata) { (responseMetadata, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                //Try to get the actual URL for our image
                imageLocation.downloadURL { (url, error) in
                    guard error == nil else {completion(.failure(error!));return}
                    //MARK: TODO - set up custom app errors
                    guard let url = url else {completion(.failure(error!));return}
                    completion(.success(url))
                }
            }
        }
    }
    
    // TODO: refactor based on if we use URL or String
    func getImage(photoUrl: URL? = nil, photoUrlStr: String? = nil, completion: @escaping (Result<UIImage,Error>) -> ()) {
        
        if let photoUrl = photoUrl {
            imagesFolderReference.storage.reference(forURL: photoUrl.absoluteString).getData(maxSize: 5000000) { (data, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data, let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }
        }
        
        if let photoUrlStr = photoUrlStr {
            imagesFolderReference.storage.reference(forURL: photoUrlStr).getData(maxSize: 5000000) { (data, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data, let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }
        }
    }

}


