//
//  ProfileViewController.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/23/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    
    //MARK: - Regular Properties
    
    let toursTest = ["Historical LBGTQ Tour", "NYC Beer Tour", "NYC Speakeasies","Places of Worship"]
    let poiTest = ["Empire State Building", "National Museum of Mathematics", "Rubin Museum of art"]
    var sampleData = POI.pointsOfinterest
    
    
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
    
    //MARK: - Tour views + tableviewss
    lazy var faveTourTableView: UITableView = {
        let tv = UITableView()
        tv.register(FavePOICell.self, forCellReuseIdentifier: Enums.cellIdentifiers.favePOICell.rawValue)
        tv.register(FaveToursCell.self, forCellReuseIdentifier: Enums.cellIdentifiers.faveTourCell.rawValue)
        return tv
    }()
    
    lazy var tourPOITVView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var faveTourPOITableView: UITableView = {
        let tv = UITableView()
        
        return tv
    }()
    
    //MARK: POI tableView & segmentedControl
    
    lazy var faveTypeSegmentControl: UISegmentedControl = {
        var sc = UISegmentedControl()
        sc.insertSegment(with: UIImage(systemName: "map"), at: 0, animated: true)
        sc.insertSegment(with: UIImage(systemName: "mappin"), at: 1, animated: true)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(switchTableView(_:)), for: .valueChanged)
        sc.backgroundColor = UIColor.init(red: 255/255, green: 251/255, blue: 217/255, alpha: 1)
        return sc
        }()
    
//    lazy var favoritePOITableView: UITableView = {
//        let tv = UITableView()
////        tv.register(FavePOICell.self, forCellReuseIdentifier: Enums.cellIdentifiers.favePOICell.rawValue)
//        return tv
//        }()
    
    
    
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setUpDelegates()
        setUpSubviews()
        
        miscSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpConstraints()
    }
    
    //MARK: - Objc Functions
    
    @objc func editProfileButtonPressed(){
        let editVC = EditProfileViewController()
        editVC.modalPresentationStyle = .fullScreen
        self.present(editVC, animated: true, completion: nil)
    }
    
    @objc func switchTableView(_ sender: UISegmentedControl) {
        faveTourTableView.reloadData()
            
    }
    
    //MARK: Regular Functions
    
    private func setUpDelegates() {
//        favoritePOITableView.delegate = self
//        favoritePOITableView.dataSource = self
        faveTourTableView.delegate = self
        faveTourTableView.dataSource = self
        
    }
    
    
    private func miscSetUp(){
        self.view.backgroundColor = .white
        self.userImage.layer.cornerRadius = 150/2
        self.userImage.layer.masksToBounds = true
        self.faveTourTableView.alpha = 1
//        self.favoritePOITableView.alpha = 0
    }
}
