//
//  StopsTableViewCell.swift
//  moveTheViewPlease
//
//  Created by Alex 6.1 on 2/2/20.
//  Copyright © 2020 aglegaspi. All rights reserved.
//

import UIKit

// TODO: Rename to POITableViewCell
class StopsTableViewCell: UITableViewCell {
    
    //MARK: -- Views
    lazy var stopImage: UIImageView = {
        var view = UIImageView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var stopLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Light", size: 16)
        label.textColor = .black
        label.text = "Testing"
        label.numberOfLines = 0
        label.backgroundColor = .clear
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constrainStopImage()
        constrainStopLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:-- Private constraints
    private func constrainStopImage() {
        self.addSubview(stopImage)
        stopImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stopImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stopImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stopImage.widthAnchor.constraint(equalToConstant: 100),
            stopImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func constrainStopLabel() {
        self.addSubview(stopLabel)
        stopLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stopLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stopLabel.leadingAnchor.constraint(equalTo: stopImage.trailingAnchor, constant: 10),
            stopLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stopLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
    
    
    
}
