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
    lazy var poiGalleryCollectionView = POIPopUpGalleryCollectionView()
    
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
        poiGalleryCollectionViewContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func poiGalleryCollectionViewContraints() {
        addSubview(poiGalleryCollectionView)
        poiGalleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            poiGalleryCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            poiGalleryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            poiGalleryCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            poiGalleryCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }
    


}
