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
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    lazy var changeImageButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
        button.contentMode = .bottom
        return button
    }()
    
    lazy var topBarView: UIView = {
        var view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var logoutButton: UIButton = {
        var button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    
    lazy var backButton: UIButton = {
        var button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return button
    }()
    
    //MARK: labels
    
    lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Full Name"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        var label = UILabel()
        label.text = "Username"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        var label = UILabel()
        label.text = "E-mail Address"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.textColor = .darkGray
        return label
    }()
    
    //MARK: Textfields
    
    lazy var nameTextField: UITextField = {
        var textField = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        textField.borderStyle = .none
        textField.placeholder = "Name"
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var usernameTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Username"
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Email"
        textField.backgroundColor = .white
        return textField
    }()
    
    
    
    //MARK: - Life Cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpConstraints()
        miscSetUp()
//        changeImageButton.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    }
    
    override func viewDidLayoutSubviews() {
        nameTextField.styleTextView()
        usernameTextField.styleTextView()
        emailTextField.styleTextView()
    }
    
    //MARK: - Functions
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUpSubviews() {
        self.view.addSubview(topBarView)
        self.topBarView.addSubview(backButton)
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
        constrainLogoutButton()
        
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
        
        changeImageButton.layer.cornerRadius = 30/2
        changeImageButton.layer.masksToBounds = true
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

extension UITextField {
    func styleTextView() {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - -4, width: self.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 69/255, green: 69/255, blue: 69/255, alpha: 1).cgColor
        
        self.layer.addSublayer(bottomLine)
        
        self.borderStyle = .none
        self.backgroundColor = .white
    }
}
