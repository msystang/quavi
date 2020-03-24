//
//  EditProfileVC+ImagePicker.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 3/24/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit
import Photos

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else {
            print("Error grabbing image")
            return
        }
        self.userImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
