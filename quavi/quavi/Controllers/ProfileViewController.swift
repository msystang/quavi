//
//  ProfileViewController.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/23/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Lazy Properties
    
    lazy var profileInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    lazy var editProfileButton: UIButton = {
        var button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var userImage: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        return imageView
    }()
    lazy var fullname: UILabel = {
        var label = UILabel()
        label.text = "Bob Marley"
        label.textAlignment = .center
        return label
    }()
    
    lazy var username: UILabel = {
        var label = UILabel()
        label.text = "tour_master"
        label.textAlignment = .center
        return label
    }()
    
    lazy var email: UILabel = {
        var label = UILabel()
        label.text = "dontworrybehappy@gmail.com"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var favoritedToursView: UIView = {
        var view = UIView()
        return view
    }()
    
    lazy var faveToursLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    lazy var favoritesTableView: UITableView = {
        let tv = UITableView()
        
        return tv
    }()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setUpSubviews()
        setUpConstraints()
        miscSetUp()
    }
    
    //MARK: - Function
    private func setUpSubviews() {
        self.view.addSubview(profileInfoView)
        self.profileInfoView.addSubview(editProfileButton)
        self.profileInfoView.addSubview(userImage)
        self.profileInfoView.addSubview(fullname)
        self.profileInfoView.addSubview(username)
        self.profileInfoView.addSubview(email)
        self.view.addSubview(favoritesTableView)
    }
    
    private func setUpConstraints() {
        constrainProfileInfoView()
        constrainEditButton()
        constrainUserImage()
        constrainFullName()
        constrainUsername()
        constrainEmail()
        constrainTableView()
    }
    
    private func miscSetUp(){
        self.view.backgroundColor = .white
        self.userImage.layer.cornerRadius = 150/2
        self.userImage.layer.masksToBounds = true
    }
    
    private func setUpFontSizes() {
        
    }
    //MARK: - Constraints
    
    func constrainProfileInfoView(){
        profileInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileInfoView.topAnchor.constraint(equalTo: self.view.topAnchor),
            profileInfoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileInfoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileInfoView.heightAnchor.constraint(equalToConstant: 450)
        ])
    }
    
    
    func constrainEditButton() {
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: self.profileInfoView.topAnchor, constant: 50),
            editProfileButton.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: -10),
            editProfileButton.widthAnchor.constraint(equalToConstant: 30),
            editProfileButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func constrainUserImage() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.profileInfoView.topAnchor, constant: 100),
            userImage.leadingAnchor.constraint(equalTo: self.profileInfoView.leadingAnchor, constant: 15),
            userImage.widthAnchor.constraint(equalToConstant: 150),
            userImage.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func constrainFullName() {
        fullname.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullname.topAnchor.constraint(equalTo: self.profileInfoView.topAnchor, constant: 100),
            fullname.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20),
            fullname.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: -20),
            fullname.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func constrainUsername() {
        username.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: fullname.bottomAnchor, constant: 5),
            username.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: 20),
            username.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: -20),
            username.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func constrainEmail() {
        email.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 5),
            email.trailingAnchor.constraint(equalTo: self.profileInfoView.trailingAnchor, constant: 20),
            email.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: -20),
            username.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func constrainTableView() {
        favoritesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 10),
            favoritesTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            favoritesTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
