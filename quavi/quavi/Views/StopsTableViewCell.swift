//
//  StopsTableViewCell.swift
//  moveTheViewPlease
//
//  Created by Alex 6.1 on 2/2/20.
//  Copyright © 2020 aglegaspi. All rights reserved.
//

import UIKit

class StopsTableViewCell: UITableViewCell {
    //MARK: -- Data types
    
    //MARK: -- Objects
    lazy var stopLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Light", size: 26)
        label.textColor = .black
        label.text = "Testing"
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureStopLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:-- Private constraints
    private func configureStopLabelConstraints() {
        self.addSubview(stopLabel)
        stopLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stopLabel.topAnchor.constraint(equalTo: self.topAnchor), stopLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor), stopLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor), stopLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
