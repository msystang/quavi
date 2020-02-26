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
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .systemYellow
//        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 3
        return imageView
    }()
    
    lazy var changeImageButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.setBackgroundImage(UIImage(systemName: "camera"), for: .normal)
        return button
    }()
    
    //MARK: labels
    
    lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Full Name"
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        var label = UILabel()
        label.text = "Username"
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        var label = UILabel()
        label.text = "E-mail Address"
        return label
    }()
    
    //MARK: Textfields
    
    lazy var nameTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Name"
        textField.backgroundColor = .darkGray
        return textField
    }()
    
    lazy var usernameTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Username"
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Email"
        return textField
    }()
    
    
    
    //MARK: - Life Cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpConstraints()
        miscSetUp()
        changeImageButton.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        print(nameTextField.layer.sublayers?.count)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpStyling()
    }
    
    //MARK: - Functions
    
    func setUpSubviews() {
        self.view.addSubview(userImage)
        self.view.addSubview(changeImageButton)
        self.view.addSubview(nameTextField)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(nameLabel)
        self.view.addSubview(usernameLabel)
        self.view.addSubview(emailLabel)
    }
    
    func setUpConstraints() {
        constrainUserImageView()
        constrainChangeImageButton()
        constrainTextFields(textField: nameTextField, textFieldAbove: nil)
        constrainTextFields(textField: usernameTextField, textFieldAbove: nameTextField)
        constrainTextFields(textField: emailTextField, textFieldAbove: usernameTextField)
        constrainTextFieldLabels(label: nameLabel, textFieldBelow: nameTextField)
        constrainTextFieldLabels(label: usernameLabel, textFieldBelow: usernameTextField)
        constrainTextFieldLabels(label: emailLabel, textFieldBelow: emailTextField)
        
    }
    
    func setUpStyling() {
        styleTextViews(textfield: nameTextField)
        styleTextViews(textfield: usernameTextField)
        styleTextViews(textfield: emailTextField)
    }
    
    private func miscSetUp(){
        self.view.backgroundColor = .white
        self.userImage.layer.cornerRadius = 150/2
        self.userImage.layer.masksToBounds = true
        
//        changeImageButton.layer.cornerRadius = 50/2
//        changeImageButton.contentMode = .scaleAspectFit
//        changeImageButton.layer.masksToBounds = true
        }
    
    
    //MARK: - Constraints
    
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
    
    func constrainTextFieldLabels(label: UILabel, textFieldBelow: UITextField) {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: textFieldBelow.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: textFieldBelow.topAnchor, constant: 5),
            label.heightAnchor.constraint(equalToConstant: 30),
            label.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
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
    
    //MARK: - Styling functions
    func styleTextViews(textfield: UITextField) {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - -4, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 69/255, green: 69/255, blue: 69/255, alpha: 1).cgColor
        
        textfield.layer.addSublayer(bottomLine)
        
        textfield.borderStyle = .none
        textfield.backgroundColor = .white
    }
    
}
