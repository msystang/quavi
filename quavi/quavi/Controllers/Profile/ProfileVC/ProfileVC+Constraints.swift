//
//  ProfileVC+Constraints.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//
import UIKit

extension ProfileViewController {
    
    func setUpSubviews() {
        self.view.addSubview(profileInfoView)
        self.profileInfoView.addSubview(editProfileButton)
        self.profileInfoView.addSubview(userImage)
        self.profileInfoView.addSubview(fullnameLabel)
        self.profileInfoView.addSubview(usernameLabel)
        self.profileInfoView.addSubview(emailLabel)
        
        self.view.addSubview(favoritedView)
        self.favoritedView.addSubview(faveToursLabel)
        self.favoritedView.addSubview(tourNumber)
        self.favoritedView.addSubview(favePOILabel)
        self.favoritedView.addSubview(POINumber)
        
        self.view.addSubview(faveTypeSegmentControl)

        self.view.addSubview(favoritesTableView)
    }
    
    func setUpConstraints() {
        constrainProfileInfoView()
        constrainEditButton()
        constrainUserImage()
        constrainFullName()
        constrainUsername()
        constrainEmail()
        
        constrainfavoritedView()
        constrainFaveToursLabel()
        constrainTourNumberLabel()
        constrainFavePOILabel()
        constrainPOINumberLabel()
        
        constrainFaveTypeSegmentControl()
        
        constrainTableView()
    }
    
    //MARK: profileInfoView Constraints
    private func constrainProfileInfoView(){
        profileInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileInfoView.topAnchor.constraint(equalTo: self.view.topAnchor),
            profileInfoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileInfoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileInfoView.heightAnchor.constraint(equalToConstant: 270)
        ])
    }
    
    
    private func constrainEditButton() {
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: self.profileInfoView.topAnchor, constant: 50),
            editProfileButton.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: -10),
            editProfileButton.widthAnchor.constraint(equalToConstant: 30),
            editProfileButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func constrainUserImage() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.profileInfoView.topAnchor, constant: 50),
            userImage.leadingAnchor.constraint(equalTo: self.profileInfoView.leadingAnchor, constant: 15),
            userImage.widthAnchor.constraint(equalToConstant: 150),
            userImage.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func constrainFullName() {
        fullnameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullnameLabel.topAnchor.constraint(equalTo: self.profileInfoView.topAnchor, constant: 120),
            fullnameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20),
            fullnameLabel.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: -20),
            fullnameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func constrainUsername() {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: fullnameLabel.bottomAnchor, constant: 5),
            usernameLabel.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: -20),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func constrainEmail() {
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            emailLabel.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: -20),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    //MARK: favoritedView Constraints
    
    private func constrainfavoritedView() {
        favoritedView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoritedView.topAnchor.constraint(equalTo: profileInfoView.bottomAnchor),
            favoritedView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            favoritedView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            favoritedView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func constrainFaveToursLabel() {
        faveToursLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            faveToursLabel.leadingAnchor.constraint(equalTo: favoritedView.leadingAnchor, constant: 10),
            faveToursLabel.topAnchor.constraint(equalTo: favoritedView.topAnchor, constant: 10),
            faveToursLabel.widthAnchor.constraint(equalToConstant: 140),
            faveToursLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func constrainTourNumberLabel() {
        tourNumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tourNumber.topAnchor.constraint(equalTo: favoritedView.topAnchor, constant: 10),
            tourNumber.trailingAnchor.constraint(equalTo: favoritedView.trailingAnchor, constant: -10),
            tourNumber.widthAnchor.constraint(equalToConstant: 20),
            tourNumber.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func constrainFavePOILabel() {
        favePOILabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favePOILabel.bottomAnchor.constraint(equalTo: favoritedView.bottomAnchor, constant: -10),
            favePOILabel.leadingAnchor.constraint(equalTo: favoritedView.leadingAnchor, constant: 10),
            favePOILabel.widthAnchor.constraint(equalToConstant: 170),
            favePOILabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func constrainPOINumberLabel() {
        POINumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            POINumber.bottomAnchor.constraint(equalTo: favoritedView.bottomAnchor, constant: -10),
            POINumber.trailingAnchor.constraint(equalTo: favoritedView.trailingAnchor, constant: -10),
            POINumber.widthAnchor.constraint(equalToConstant: 20),
            POINumber.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    //MARK: tableView & segmented control Constraints
    
    private func constrainFaveTypeSegmentControl() {
        faveTypeSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            faveTypeSegmentControl.topAnchor.constraint(equalTo: favoritedView.bottomAnchor),
            faveTypeSegmentControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            faveTypeSegmentControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            faveTypeSegmentControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func constrainTableView() {
        favoritesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo: faveTypeSegmentControl.bottomAnchor),
            favoritesTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            favoritesTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
