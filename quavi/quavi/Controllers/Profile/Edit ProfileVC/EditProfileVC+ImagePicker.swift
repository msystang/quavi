//
//  EditProfileVC+ImagePicker.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 3/24/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit
import Photos
import FirebaseAuth

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else {
            print("Error grabbing image")
            return
        }
        self.userImage.image = image
        
        FirebaseStorageService(imageType: .profileImage).uploadProfileImage(image: image) { (result) in
            switch result {
            case .failure(let error):
                self.showAlert(title: "Error", message: "Problem saving user photo: \(error.localizedDescription)")
            case .success(let url):
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.photoURL = url
                changeRequest?.commitChanges(completion: { (error) in
                    if error == nil {
                        print("User photoURL changed!")
                    } else {
                        print("error setting photoURL: \(error?.localizedDescription)")
                    }
                    FirestoreService.manager.updateCurrentUser(photoURL: url) { (result) in
                        switch result {
                        case .failure(let error):
                            self.showAlert(title: "Error", message: "Problem saving photoURL: \(error.localizedDescription)")
                        case .success(()):
                            print("photoURL saved")
                        }
                    }
                })
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
