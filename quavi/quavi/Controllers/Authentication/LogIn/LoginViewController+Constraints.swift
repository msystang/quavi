//
//  LoginViewController+Constraints.swift
//  quavi
//
//  Created by Sunni Tang on 2/20/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    //MARK: - UI Constraint Methods
    func addSubviews() {
        view.addSubview(logInStackView)
        view.addSubview(imageView)
        view.addSubview(createAccountButton)
        view.addSubview(forgotPasswordButton)
    }
    
    func addConstraints() {
        setLogInStackViewConstraints()
        setImageViewConstraints()
        setCreateAccountButtonConstraints()
        setForgotPasswordButtonConstraints()
    }
    
    //MARK: - Private Functions
    private func setLogInStackViewConstraints() {
        logInStackView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logInStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            logInStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2),
            emailTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            passwordTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            loginButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3),
            loginButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            //imageView.bottomAnchor.constraint(equalTo: logInStackView.topAnchor, constant: 30),
            //imageView.leadingAnchor.constraint(equalTo: logInStackView.leadingAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.width * 0.75),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.75)
        ])
    }
    
    private func setCreateAccountButtonConstraints() {
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.leadingAnchor.constraint(equalTo: logInStackView.leadingAnchor),
            createAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setForgotPasswordButtonConstraints() {
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: logInStackView.leadingAnchor),
            forgotPasswordButton.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: 5),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
