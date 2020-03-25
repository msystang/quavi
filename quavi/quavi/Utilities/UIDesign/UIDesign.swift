//
//  UIDesign.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

struct UIDesign {
    
    static func styleBackgroundColor(_ view: UIView) {
        view.backgroundColor = UIColor(red: 0.204, green: 0.200, blue: 0.196, alpha: 1.0)
    }
    
    static func styleTabBar(_ tabBar: UITabBar) {
        tabBar.tintColor = .white
        tabBar.barTintColor = UIColor(red: 0.204, green: 0.200, blue: 0.196, alpha: 1.0)
    }
    
    static func styleTableView(_ tableView: UITableView) {
        tableView.backgroundColor = UIColor(red: 0.204, green: 0.200, blue: 0.196, alpha: 1.0)
    }

}
