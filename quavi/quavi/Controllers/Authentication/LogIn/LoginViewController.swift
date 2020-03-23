//
//  LoginViewController.swift
//  quavi
//
//  Created by Sunni Tang on 2/20/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - UI Objects
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Quavi"
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Email"
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var logInStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create New Account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(createAccountButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addSubviews()
        addConstraints()

    }

    //MARK: - Objective-C Functions
    @objc func loginButtonPressed() {
        loginButton.isEnabled = false
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            showAlert(title: "Error", message: "Please fill out all fields.")
            return
        }
        
        //TODO:remove whitespace (if any) from email/password
        guard email.isValidEmail else {
            showAlert(title: "Error", message: "Please enter a valid email")
            return
        }
        
        guard password.isValidPassword else {
            showAlert(title: "Error", message: "Please enter a valid password. Passwords must have at least 8 characters.")
            return
        }
        
        //TODO: Handle login button pressed with firebaseAuth service using email and passwordl
    }
    
    @objc func forgotPasswordButtonPressed() {
        let forgotPasswordVC = ForgotPasswordViewController()
        forgotPasswordVC.modalPresentationStyle = .formSheet
        present(forgotPasswordVC, animated: true, completion: nil)
    }
    
    @objc func createAccountButtonPressed() {
        let signupVC = SignUpViewController()
        signupVC.modalPresentationStyle = .formSheet
        present(signupVC, animated: true, completion: nil)
    }
}
