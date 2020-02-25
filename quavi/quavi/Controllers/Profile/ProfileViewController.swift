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
    
    //MARK: profileInfoView Objects
    
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
    
    //MARK: favoritedView Objects
    
    lazy var favoritedView: UIView = {
        var view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    lazy var faveToursLabel: UILabel = {
        var label = UILabel()
        label.text = "Favorited Tours:"
        return label
    }()
    
    lazy var tourNumber: UILabel = {
        var label = UILabel()
        label.text = "0"
        return label
    }()
    
    lazy var favePOILabel: UILabel = {
        var label = UILabel()
        label.text = "Favorited Locations:"
        return label
    }()
    
    lazy var POINumber: UILabel = {
        var label = UILabel()
        label.text = "0"
        return label
    }()
    
    //MARK: tableView & segmentedControl
    
    lazy var faveTypeSegmentControl: UISegmentedControl = {
        var sc = UISegmentedControl()
        sc.insertSegment(with: UIImage(systemName: "map"), at: 0, animated: true)
        sc.insertSegment(with: UIImage(systemName: "mappin"), at: 1, animated: true)
        sc.selectedSegmentIndex = 0
        return sc
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
    
    //MARK: - Functions
    private func setUpSubviews() {
        self.view.addSubview(profileInfoView)
        self.profileInfoView.addSubview(editProfileButton)
        self.profileInfoView.addSubview(userImage)
        self.profileInfoView.addSubview(fullname)
        self.profileInfoView.addSubview(username)
        self.profileInfoView.addSubview(email)
        
        self.view.addSubview(favoritedView)
        self.favoritedView.addSubview(faveToursLabel)
        self.favoritedView.addSubview(tourNumber)
        self.favoritedView.addSubview(favePOILabel)
        self.favoritedView.addSubview(POINumber)
        
        self.view.addSubview(faveTypeSegmentControl)

        self.view.addSubview(favoritesTableView)
    }
    
    private func setUpConstraints() {
        constrainProfileInfoView()
        constrainEditButton()
        constrainUserImage()
        constrainFullName()
        constrainUsername()
        constrainEmail()
        
        constrainfavoritedView()
        constrainFaveToursLabel()
        constrainTourNumberLabel()
        constrainFavePOILabel()
        constrainPOINumberLabel()
        
        constrainFaveTypeSegmentControl()
        
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
            profileInfoView.heightAnchor.constraint(equalToConstant: 270)
        ])
    }
    
    //MARK: profileInfoView Constraints
    
    
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
    
    //MARK: favoritedView Constraints
    
    func constrainfavoritedView() {
        favoritedView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoritedView.topAnchor.constraint(equalTo: profileInfoView.bottomAnchor),
            favoritedView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            favoritedView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            favoritedView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func constrainFaveToursLabel() {
        faveToursLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            faveToursLabel.leadingAnchor.constraint(equalTo: favoritedView.leadingAnchor, constant: 10),
            faveToursLabel.topAnchor.constraint(equalTo: favoritedView.topAnchor, constant: 10),
            faveToursLabel.widthAnchor.constraint(equalToConstant: 140),
            faveToursLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func constrainTourNumberLabel() {
        tourNumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tourNumber.topAnchor.constraint(equalTo: favoritedView.topAnchor, constant: 10),
            tourNumber.trailingAnchor.constraint(equalTo: favoritedView.trailingAnchor, constant: -10),
            tourNumber.widthAnchor.constraint(equalToConstant: 20),
            tourNumber.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func constrainFavePOILabel() {
        favePOILabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favePOILabel.bottomAnchor.constraint(equalTo: favoritedView.bottomAnchor, constant: -10),
            favePOILabel.leadingAnchor.constraint(equalTo: favoritedView.leadingAnchor, constant: 10),
            favePOILabel.widthAnchor.constraint(equalToConstant: 170),
            favePOILabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func constrainPOINumberLabel() {
        POINumber.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            POINumber.bottomAnchor.constraint(equalTo: favoritedView.bottomAnchor, constant: -10),
            POINumber.trailingAnchor.constraint(equalTo: favoritedView.trailingAnchor, constant: -10),
            POINumber.widthAnchor.constraint(equalToConstant: 20),
            POINumber.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func constrainFaveTypeSegmentControl() {
        faveTypeSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            faveTypeSegmentControl.topAnchor.constraint(equalTo: favoritedView.bottomAnchor),
            faveTypeSegmentControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            faveTypeSegmentControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            faveTypeSegmentControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func constrainTableView() {
        favoritesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo: faveTypeSegmentControl.bottomAnchor),
            favoritesTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            favoritesTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
