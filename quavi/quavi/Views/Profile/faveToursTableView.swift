//
//  faveToursTableView.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 3/10/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

class FaveToursTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        register(FaveToursCell.self, forCellReuseIdentifier: Enums.cellIdentifiers.faveTourCell.rawValue)
        backgroundColor = .systemPink
        
//        separatorStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
  
}
