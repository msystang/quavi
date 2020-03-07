//
//  POIPopUpGallery.swift
//  quavi
//
//  Created by Alex 6.1 on 3/3/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class POIPopUpGallery: UIView {
    
    let padding: CGFloat = 20

    lazy var poiName: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.text = "Sorry, No Title Provided!"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
configurePOIName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurePOIName() {
        addSubview(poiName)
        poiName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            poiName.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            poiName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            poiName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            poiName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    


}
