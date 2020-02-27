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
    
    lazy var confirmEditButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleConfirmButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelEditButton: UIButton = {
        var button = UIButton()
        let x = "X"
        button.setTitle("X", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleCancelButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var changeImageButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
        button.contentMode = .bottom
        return button
    }()
    
    lazy var userImage: UIImageView = {
            var imageView = UIImageView()
            imageView.backgroundColor = .white
            imageView.image = UIImage(systemName: "person.fill")
            imageView.tintColor = .systemYellow
    //        imageView.contentMode = .scaleAspectFill
            imageView.layer.borderWidth = 2
            return imageView
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
    
    //MARK: - Regular Properties
    
    var currentTextfield: UITextField?

    
    //MARK: - Life Cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegates()
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
    
    //MARK: - Objc functions
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleConfirmButtonPressed(){
        handleEditDismissal()
        //do additional setup for changing user info on firebase
    }
    
    @objc func handleCancelButtonPressed(){
        handleEditDismissal()
    }
    
    //MARK: - Setup Functions
    func setUpDelegates() {
        usernameTextField.delegate = self
        nameTextField.delegate = self
        emailTextField.delegate = self
    }
    
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
    
    private func setUpConstraints() {
        constrainTopBarView()
        constrainBackButton()
        constrainConfirmButton()
        constrainCancelEditButton()
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
    
    private func setUpStyling() {
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
        
        confirmEditButton.isHidden = true
        cancelEditButton.isHidden = true
    }
    
    //MARK: - edit buttons' functions
    
    func handleEditDismissal(){
        UIView.animate(withDuration: 1.0, animations: {
            self.nameTextField.isHidden = false
            self.usernameTextField.isHidden = false
            self.emailTextField.isHidden = false
            self.nameLabel.isHidden = false
            self.emailLabel.isHidden = false
            self.usernameLabel.isHidden = false
            self.userImage.isHidden = false
            self.changeImageButton.isHidden = false
            self.backButton.isHidden = false
            self.logoutButton.isHidden = false
            self.confirmEditButton.isHidden = true
            self.cancelEditButton.isHidden = true
            
//            self.setUpConstraints()
//            self.nameTextField.topAnchor.constraint(equalTo: self.userImage.bottomAnchor, constant: 70).isActive = true
            
            
            self.view.layoutIfNeeded()
        })
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
