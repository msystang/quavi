//
//  SignUpViewController+Constraints.swift
//  quavi
//
//  Created by Sunni Tang on 2/20/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension SignUpViewController {
    // MARK: - Constraint Methods
    func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(signUpStackView)
        view.addSubview(signUpButton)
    }
    
    func addConstraints() {
        setTitleLabelConstraints()
        setSignUpStackViewConstraints()
        setSignUpButtonConstraints()
    }
    
    //MARK: - Private Functions
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.bottomAnchor.constraint(equalTo: signUpStackView.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: signUpStackView.leadingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setSignUpStackViewConstraints() {
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            signUpStackView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            signUpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpStackView.heightAnchor.constraint(lessThanOrEqualToConstant: 100),
            usernameTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            emailTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            passwordTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
        ])
    }
    
    
    private func setSignUpButtonConstraints() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signUpStackView.bottomAnchor, constant: 30),
            signUpButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            signUpButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            signUpButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

}
