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
    
    lazy var favoritedPOIImage: UIImageView = {
        var view = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        view.tintColor = .white
        view.backgroundColor = UIDesign.quaviOrange
        view.image = UIImage(named: "duck_icon_hallow")
        view.layer.cornerRadius = view.frame.height / 2
        view.layer.masksToBounds = true
        view.layer.borderColor = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderWidth = 1.5
        view.layoutMargins = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        return view
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
        constrainFavoritePOIImage()
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
    
    private func constrainFavoritePOIImage() {
        self.addSubview(favoritedPOIImage)
        favoritedPOIImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritedPOIImage.bottomAnchor.constraint(equalTo: stopImage.bottomAnchor, constant: 12.5),
            favoritedPOIImage.centerXAnchor.constraint(equalTo: stopImage.centerXAnchor),
            favoritedPOIImage.widthAnchor.constraint(equalToConstant: 35),
            favoritedPOIImage.heightAnchor.constraint(equalToConstant: 35)
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
