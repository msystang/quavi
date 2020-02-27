//
//  QuaviTabBarController.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/23/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

class QuaviTabBarController: UITabBarController {
    lazy var toursVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: CategorySelectionViewController())
        return navController
    }()
    
    lazy var profileVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: ProfileViewController())
        return navController
    }()
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toursVC.tabBarItem = UITabBarItem(title: "Tours", image: UIImage(systemName: "mappin.and.ellipse"), tag: 0)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        self.viewControllers = [toursVC, profileVC]
    }
}
