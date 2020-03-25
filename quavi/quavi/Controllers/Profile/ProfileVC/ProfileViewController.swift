//
//  ProfileViewController.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/23/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    //MARK: - Lazy Properties
    
    lazy var profileInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 254/255, green: 233/255, blue: 154/255, alpha: 1)
        return view
    }()
    
    //MARK: profileInfoView Objects
    
    lazy var editProfileButton: UIButton = {
        var button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(editProfileButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var userImage: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(systemName: "ant")
        imageView.layer.borderWidth = 2
        imageView.tintColor = .brown
        return imageView
    }()
    lazy var fullnameLabel: UILabel = {
        var label = UILabel()
        label.text = "Bob Marley"
        label.textAlignment = .center
        return label
    }()
    
    lazy var usernameLabel: UILabel = {
        var label = UILabel()
        label.text = "tour_master"
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        var label = UILabel()
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
    var username: String?
    var email: String?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        setUpSubviews()
        setUpConstraints()
    
        setUsernameAndEmail()
        getAndSetUserPhoto()
        
        miscSetUp()
        setUpDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUsernameAndEmail()
        getAndSetUserPhoto()
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
    
    private func miscSetUp(){
        self.view.backgroundColor = .white
        self.userImage.layer.cornerRadius = 150/2
        self.userImage.layer.masksToBounds = true
    }
    
    private func setUsernameAndEmail() {
        FirestoreService.manager.getUsernameOrEmail(whichOne: "userName") { (result) in
            switch result {
            case .failure(let error):
                print("Error getting username: \(error.localizedDescription)")
            case .success(let username):
                self.usernameLabel.text = username
                print(username)
            }
        }
        
        FirestoreService.manager.getUsernameOrEmail(whichOne: "email") { (result) in
            switch result {
            case .failure(let error):
                print("Error getting email: \(error.localizedDescription)")
            case .success(let email):
                self.emailLabel.text = email
            }
        }
    }
    
    private func getAndSetUserPhoto() {
        if let url = Auth.auth().currentUser?.photoURL {
            FirebaseStorageService(imageType: .profileImage).getImage(photoUrl: url) { (result) in
                switch result {
                case .failure(let error):
                    self.showAlert(title: "Error", message: "Could not retrieve user photo: \(error.localizedDescription)")
                case .success(let image):
                    self.userImage.image = image
                }
            }
        }
    }
}
