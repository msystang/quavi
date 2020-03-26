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
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Quavi_Logo_White")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Email"
        textField.backgroundColor = UIDesign.quaviLightGrey
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIDesign.quaviLightGrey
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIDesign.quaviLightGrey, for: .normal)
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
        button.setTitleColor(UIDesign.quaviLightGrey, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create New Account", for: .normal)
        button.setTitleColor(UIDesign.quaviOrange, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(createAccountButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIDesign.quaviDarkGrey
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
        FirebaseAuthService.manager.loginUser(email: email, password: password) { (result) in
            self.handleLoginResponse(with: result)
        }
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
    
    //MARK: - Private Functions
    private func handleLoginResponse(with result: Result<(), Error>) {
        switch result {
        case .success:
            let window = uiWindow()
            
            UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromRight, animations: {
                window.rootViewController = QuaviTabBarController()
            }, completion: nil)
            
        case .failure(let error):
            showAlert(title: "Error", message: "Could not log in: \(error.localizedDescription)")
            loginButton.isEnabled = true
        }
    }
    
    private func uiWindow() -> UIWindow {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else {
                showAlert(title: "Error", message: "Could not switch view controllers")
                return UIWindow()
        }
        return window
    }
}
