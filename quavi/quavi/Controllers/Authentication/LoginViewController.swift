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
        //TODO: Add target for loginButtonPressed func
        return button
    }()
    
    lazy var logInStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create New Account", for: .normal)
        button.showsTouchWhenHighlighted = true
        //TODO: Add target for createAccountButtonPressed func
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addSubviews()
        addConstraints()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
