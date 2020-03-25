//
//  EditProfileVC+Constraints.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension EditProfileViewController {
    
    func setUpSubviews() {
        self.view.addSubview(topBarView)
        self.topBarView.addSubview(backButton)
        self.topBarView.addSubview(confirmEditButton)
        self.topBarView.addSubview(cancelEditButton)
        self.view.addSubview(logoutButton)
        
        self.view.addSubview(userImage)
        self.view.addSubview(changeImageButton)
        self.view.addSubview(nameTextField)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(nameLabel)
        self.view.addSubview(usernameLabel)
        self.view.addSubview(emailLabel)
        self.view.addSubview(logoutButton)
    }
    
    func setUpConstraints() {
        constrainTopBarView()
        constrainBackButton()
        constrainConfirmButton()
        constrainCancelEditButton()
        constrainLogoutButton()
        
        constrainUserImageView()
        constrainChangeImageButton()
        
    }
    
    func removeAllNonTextFieldConstraints() {
        
    }
    
    func setUpTextFieldConstraints() {
        constrainTextFields(textField: nameTextField, textFieldAbove: nil)
        constrainTextFields(textField: usernameTextField, textFieldAbove: nameTextField)
        constrainTextFields(textField: emailTextField, textFieldAbove: usernameTextField)
        constrainTextFieldLabels(label: nameLabel, textFieldBelow: nameTextField)
        constrainTextFieldLabels(label: usernameLabel, textFieldBelow: usernameTextField)
        constrainTextFieldLabels(label: emailLabel, textFieldBelow: emailTextField)
    }
    //MARK: - TopBarView Constraints
    func constrainTopBarView() {
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topBarView.topAnchor.constraint(equalTo: self.view.topAnchor),
            topBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            topBarView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func constrainBackButton(){
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topBarView.topAnchor, constant: 40),
            backButton.leadingAnchor.constraint(equalTo: topBarView.leadingAnchor, constant: 20),
            backButton.bottomAnchor.constraint(equalTo: topBarView.bottomAnchor, constant: -10),
            backButton.widthAnchor.constraint(equalToConstant: 30)

        ])
    }
    
    func constrainLogoutButton() {
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50),
            logoutButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 30),
            logoutButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func constrainConfirmButton() {
        confirmEditButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            confirmEditButton.topAnchor.constraint(equalTo: topBarView.topAnchor, constant: 40),
            confirmEditButton.trailingAnchor.constraint(equalTo: topBarView.trailingAnchor, constant: -10),
            confirmEditButton.bottomAnchor.constraint(equalTo: topBarView.bottomAnchor, constant: -10),
            confirmEditButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func constrainCancelEditButton() {
        cancelEditButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelEditButton.topAnchor.constraint(equalTo: topBarView.topAnchor, constant: 40),
            cancelEditButton.leadingAnchor.constraint(equalTo: topBarView.leadingAnchor, constant: 20),
            cancelEditButton.bottomAnchor.constraint(equalTo: topBarView.bottomAnchor, constant: -10),
            cancelEditButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
       func constrainUserImageView() {
           userImage.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               userImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
               userImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
               userImage.heightAnchor.constraint(equalToConstant: 150),
               userImage.widthAnchor.constraint(equalToConstant: 150)
           ])
       }
       
       func constrainChangeImageButton() {
           changeImageButton.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               changeImageButton.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: -50),
               changeImageButton.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: -50),
               changeImageButton.heightAnchor.constraint(equalToConstant: 40),
               changeImageButton.widthAnchor.constraint(equalToConstant: 40)
           ])
       }
       //MARK: - labels 4 textFields Constraints
       func constrainTextFieldLabels(label: UILabel, textFieldBelow: UITextField) {
           label.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               label.leadingAnchor.constraint(equalTo: textFieldBelow.leadingAnchor),
               label.bottomAnchor.constraint(equalTo: textFieldBelow.topAnchor, constant: 5),
               label.heightAnchor.constraint(equalToConstant: 30),
               label.widthAnchor.constraint(equalToConstant: 300)
           ])
       }
       //MARK: - Textfield Constraints
       func constrainTextFields(textField: UITextField, textFieldAbove: UITextField?) {
           textField.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
               textField.heightAnchor.constraint(equalToConstant: 40),
               textField.widthAnchor.constraint(equalToConstant: 300)
           ])
           
           if textFieldAbove == nil {
               textField.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 70).isActive = true
           } else {
               textField.topAnchor.constraint(equalTo: textFieldAbove!.bottomAnchor, constant: 50).isActive = true
           }
       }
}
