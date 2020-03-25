//
//  UIDesign.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

struct UIDesign {
    
    static let quaviDarkGrey = UIColor(red: 0.161, green: 0.122, blue: 0.122, alpha: 1.0)
    static let quaviOrange = UIColor(red: 0.930, green: 0.191, blue: 0.153, alpha: 1.0)
    static let quaviYellow = UIColor.systemYellow
    static let quaviWhite = UIColor(red: 1.000, green: 1.000, blue: 0.843, alpha: 1.0)
    
    static func styleBackgroundColor(_ view: UIView) {
        view.backgroundColor = quaviDarkGrey
    }
    
    static func styleTabBar(_ tabBar: UITabBar) {
        tabBar.tintColor = .white
        tabBar.barTintColor = quaviDarkGrey
    }
    
    static func styleTableView(_ tableView: UITableView) {
        tableView.backgroundColor = quaviDarkGrey
    }

}
