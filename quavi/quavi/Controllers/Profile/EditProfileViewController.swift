//
//  EditProfileViewController.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/25/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    //MARK: - Lazy Properties
    lazy var userImage: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .systemYellow
        imageView.layer.borderWidth = 5
        
        return imageView
    }()
    
    lazy var changeImageButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        return button
    }()
    
    //MARK: labels
    
    lazy var nameLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    //MARK: Textfields
    
    lazy var nameTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Name"
        return textField
    }()
    
    lazy var usernameTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Username"
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email"
        return textField
    }()
    
    
    //MARK: - Life Cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpConstraints()
        miscSetUp()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    
    func setUpSubviews() {
        self.view.addSubview(userImage)
        self.view.addSubview(changeImageButton)
        self.view.addSubview(nameTextField)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(emailTextField)
    }
    
    func setUpConstraints() {
        constrainUserImageView()
        constrainChangeImageButton()
        constrainTextFields(textField: nameTextField, textFieldAbove: nil)
        constrainTextFields(textField: usernameTextField, textFieldAbove: nameTextField)
        constrainTextFields(textField: emailTextField, textFieldAbove: usernameTextField)
        
    }
    
    private func miscSetUp(){
        self.view.backgroundColor = .white
        self.userImage.layer.cornerRadius = 150/2
        self.userImage.layer.masksToBounds = true
        
        changeImageButton.layer.cornerRadius = 50/2
    }
    
    
    //MARK: - Constraints

    func constrain() {
        
    }
    
    func constrainUserImageView() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
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
            changeImageButton.heightAnchor.constraint(equalToConstant: 50),
            changeImageButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func constrainTextFields(textField: UITextField, textFieldAbove: UITextField?) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            textField.heightAnchor.constraint(equalToConstant: 30),
            textField.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        if textFieldAbove == nil {
            textField.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 50).isActive = true
        } else {
            textField.topAnchor.constraint(equalTo: textFieldAbove!.bottomAnchor, constant: 30).isActive = true
        }
    }
    
    
}
