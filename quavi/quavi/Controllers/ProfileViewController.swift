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
    
    lazy var logoutButton: UIButton = {
        var button = UIButton()
        
        return button
    }()
    
    lazy var userImage: UIImageView = {
        var imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "plus")
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
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
