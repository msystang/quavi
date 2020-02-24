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
        return label
    }()
    
    lazy var username: UILabel = {
        var label = UILabel()
        label.text = "tour_master"
        return label
    }()
    
    lazy var email: UILabel = {
        var label = UILabel()
        label.text = "dontworrybehappy@gmail.com"
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
        self.view.addSubview(editProfileButton)
        self.view.addSubview(userImage)
    }
    
    private func setUpConstraints() {
        constrainEditButton()
        constrainUserImage()
    }
    
    private func miscSetUp(){
        self.view.backgroundColor = .white
        self.userImage.layer.cornerRadius = 50
        self.userImage.layer.masksToBounds = true
    }
    
    //MARK: - Constraints
    
    
    func constrainEditButton() {
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            editProfileButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            editProfileButton.widthAnchor.constraint(equalToConstant: 30),
            editProfileButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func constrainUserImage() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            userImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            userImage.widthAnchor.constraint(equalToConstant: 100),
            userImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
