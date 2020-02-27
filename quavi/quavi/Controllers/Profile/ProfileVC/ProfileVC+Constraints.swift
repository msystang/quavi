//
//  ProfileVC+Constraints.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//
import UIKit

extension ProfileViewController {
    
    //MARK: profileInfoView Constraints
    func constrainProfileInfoView(){
        profileInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileInfoView.topAnchor.constraint(equalTo: self.view.topAnchor),
            profileInfoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileInfoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileInfoView.heightAnchor.constraint(equalToConstant: 270)
        ])
    }
    
    
    func constrainEditButton() {
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: self.profileInfoView.topAnchor, constant: 50),
            editProfileButton.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: -10),
            editProfileButton.widthAnchor.constraint(equalToConstant: 30),
            editProfileButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func constrainUserImage() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.profileInfoView.topAnchor, constant: 100),
            userImage.leadingAnchor.constraint(equalTo: self.profileInfoView.leadingAnchor, constant: 15),
            userImage.widthAnchor.constraint(equalToConstant: 150),
            userImage.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func constrainFullName() {
        fullname.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullname.topAnchor.constraint(equalTo: self.profileInfoView.topAnchor, constant: 120),
            fullname.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20),
            fullname.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: -20),
            fullname.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func constrainUsername() {
        username.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: fullname.bottomAnchor, constant: 5),
            username.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: 20),
            username.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: -20),
            username.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func constrainEmail() {
        email.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10),
            email.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: 20),
            email.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: -20),
            username.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    //MARK: favoritedView Constraints
    
    func constrainfavoritedView() {
        favoritedView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoritedView.topAnchor.constraint(equalTo: profileInfoView.bottomAnchor),
            favoritedView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            favoritedView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            favoritedView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func constrainFaveToursLabel() {
        faveToursLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            faveToursLabel.leadingAnchor.constraint(equalTo: favoritedView.leadingAnchor, constant: 10),
            faveToursLabel.topAnchor.constraint(equalTo: favoritedView.topAnchor, constant: 10),
            faveToursLabel.widthAnchor.constraint(equalToConstant: 140),
            faveToursLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func constrainTourNumberLabel() {
        tourNumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tourNumber.topAnchor.constraint(equalTo: favoritedView.topAnchor, constant: 10),
            tourNumber.trailingAnchor.constraint(equalTo: favoritedView.trailingAnchor, constant: -10),
            tourNumber.widthAnchor.constraint(equalToConstant: 20),
            tourNumber.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func constrainFavePOILabel() {
        favePOILabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favePOILabel.bottomAnchor.constraint(equalTo: favoritedView.bottomAnchor, constant: -10),
            favePOILabel.leadingAnchor.constraint(equalTo: favoritedView.leadingAnchor, constant: 10),
            favePOILabel.widthAnchor.constraint(equalToConstant: 170),
            favePOILabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func constrainPOINumberLabel() {
        POINumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            POINumber.bottomAnchor.constraint(equalTo: favoritedView.bottomAnchor, constant: -10),
            POINumber.trailingAnchor.constraint(equalTo: favoritedView.trailingAnchor, constant: -10),
            POINumber.widthAnchor.constraint(equalToConstant: 20),
            POINumber.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    //MARK: tableView & segmented control Constraints
    
    func constrainFaveTypeSegmentControl() {
        faveTypeSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            faveTypeSegmentControl.topAnchor.constraint(equalTo: favoritedView.bottomAnchor),
            faveTypeSegmentControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            faveTypeSegmentControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            faveTypeSegmentControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func constrainTableView() {
        favoritesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo: faveTypeSegmentControl.bottomAnchor),
            favoritesTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            favoritesTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
