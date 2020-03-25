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
        view.backgroundColor = UIDesign.quaviDarkGrey
        return view
    }()
    
    //MARK: profileInfoView Objects
    
    lazy var editProfileButton: UIButton = {
        var button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = UIDesign.quaviOrange
        button.addTarget(self, action: #selector(editProfileButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var userImage: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(systemName: "person.fill")
        imageView.layer.borderWidth = 2
        imageView.tintColor = UIDesign.quaviLightGrey
        return imageView
    }()
    lazy var fullname: UILabel = {
        var label = UILabel()
        label.textColor = UIDesign.quaviWhite
        label.text = "Bob Marley"
        label.textAlignment = .center
        return label
    }()
    
    lazy var username: UILabel = {
        var label = UILabel()
        label.textColor = UIDesign.quaviWhite
        label.text = "tour_master"
        label.textAlignment = .center
        return label
    }()
    
    lazy var email: UILabel = {
        var label = UILabel()
        label.textColor = UIDesign.quaviWhite
        label.text = "dntWrryBHappy@gmail.com"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: favoritedView Objects
    
    lazy var favoritedView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.init(red: 255/255, green: 251/255, blue: 217/255, alpha: 1)
        return view
    }()
    
    lazy var faveToursLabel: UILabel = {
        var label = UILabel()
        label.text = "Favorited Tours:"
        return label
    }()
    
    lazy var tourNumber: UILabel = {
        var label = UILabel()
        label.text = "4"
        return label
    }()
    
    lazy var favePOILabel: UILabel = {
        var label = UILabel()
        label.text = "Favorited Locations:"
        return label
    }()
    
    lazy var POINumber: UILabel = {
        var label = UILabel()
        label.text = "3"
        return label
    }()
    
    //MARK: tableView & segmentedControl
    
    lazy var faveTypeSegmentControl: UISegmentedControl = {
        var sc = UISegmentedControl()
        sc.insertSegment(with: UIImage(systemName: "map"), at: 0, animated: true)
        sc.insertSegment(with: UIImage(systemName: "mappin"), at: 1, animated: true)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(switchTableView), for: .valueChanged)
        sc.backgroundColor = UIColor.init(red: 255/255, green: 251/255, blue: 217/255, alpha: 1)
        return sc
        }()
    
    lazy var favoritesTableView: UITableView = {
        let tv = UITableView()
        tv.register(FaveToursCell.self, forCellReuseIdentifier: "faveCell")
        return tv
        }()
    
    //MARK: - Regular Properties
    
    let toursTest = ["Historical LBGTQ Tour", "NYC Beer Tour", "NYC Speakeasies","Places of Worship"]
    let poiTest = ["Empire State Building", "National Museum of Mathematics", "Rubin Museum of art"]
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setUpSubviews()
        setUpConstraints()
        miscSetUp()
        setUpDelegates()
    }
    
    //MARK: - Objc Functions
    
    @objc func editProfileButtonPressed(){
        let editVC = EditProfileViewController()
        editVC.modalPresentationStyle = .fullScreen
        self.present(editVC, animated: true, completion: nil)
    }
    
    @objc func switchTableView() {
        favoritesTableView.reloadData()
    }
    
    //MARK: Regular Functions
    
    private func setUpDelegates() {
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
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
}
