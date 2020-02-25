//
//  QuaviTableView.swift
//  quavi
//
//  Created by Alex 6.1 on 2/13/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class QuaviTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor = .clear
        register(StopsTableViewCell.self, forCellReuseIdentifier: Enums.cellIdentifiers.StopCell.rawValue)
        separatorStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
  
}
