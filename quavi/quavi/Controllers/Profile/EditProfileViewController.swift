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
    
    //MARK: - Functions
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
    
    func setUpConstraints() {
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
        
        confirmEditButton.isHidden = true
        cancelEditButton.isHidden = true
    }
    
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

extension EditProfileViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == nameTextField {
            
            handleTextFieldFirstResponder(toChangeConstraintsOf: nameTextField, disable: usernameTextField, disable: emailTextField, disable: usernameLabel, disable: emailLabel)
            currentTextfield = nameTextField
            
        } else if textField == usernameTextField {
            
            handleTextFieldFirstResponder(toChangeConstraintsOf: usernameTextField, disable: nameTextField, disable: emailTextField, disable: nameLabel, disable: emailLabel)
            currentTextfield = usernameTextField
            
        }  else if textField == emailTextField {
            
            handleTextFieldFirstResponder(toChangeConstraintsOf: emailTextField, disable: nameTextField, disable: usernameTextField, disable: nameLabel, disable: usernameLabel)
            currentTextfield = emailTextField
        }
    }
    
    func handleTextFieldFirstResponder(toChangeConstraintsOf selectedTextfield: UITextField, disable textfield1: UITextField, disable textfield2: UITextField, disable label1: UILabel, disable label2: UILabel) {
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
            
            textfield1.isHidden = true
            textfield2.isHidden = true
            label1.isHidden = true
            label2.isHidden = true
            self?.userImage.isHidden = true
            self?.changeImageButton.isHidden = true
            self?.backButton.isHidden = true
            self?.logoutButton.isHidden = true
            self?.confirmEditButton.isHidden = false
            self?.cancelEditButton.isHidden = false
            
            selectedTextfield.topAnchor.constraint(equalTo: self!.view.topAnchor, constant: 110).isActive = true
            self?.view.layoutIfNeeded()
        })
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
