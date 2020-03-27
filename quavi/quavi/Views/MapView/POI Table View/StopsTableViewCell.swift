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
    
    lazy var likeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(named: "duck_icon_hallow"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.masksToBounds = true
        button.layer.borderColor = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        button.backgroundColor = UIDesign.quaviOrange
        button.layer.borderWidth = 1.5
        button.layoutMargins = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        return button
    }()
    
    lazy var stopLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Light", size: 16)
        label.textColor = UIDesign.quaviWhite
        label.text = "Testing"
        label.numberOfLines = 0
        label.backgroundColor = .clear
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constrainStopImage()
        constrainLikeButton()
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
            stopImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            stopImage.widthAnchor.constraint(equalToConstant: 100),
            stopImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func constrainLikeButton() {
        self.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.bottomAnchor.constraint(equalTo: stopImage.bottomAnchor, constant: 12.5),
            likeButton.centerXAnchor.constraint(equalTo: stopImage.centerXAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 35),
            likeButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func constrainStopLabel() {
        self.addSubview(stopLabel)
        stopLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stopLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stopLabel.leadingAnchor.constraint(equalTo: stopImage.trailingAnchor, constant: 10),
            stopLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            stopLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
    
    
    
}
