//
//  POIPopUpGalleryCollectionViewCell.swift
//  quavi
//
//  Created by Alex 6.1 on 3/9/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class POIPopUpGalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "GalleryCell"
    
    lazy var poiGalleryImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(poiGalleryImageView)
        poiGalleryImageView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            poiGalleryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            poiGalleryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            poiGalleryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            poiGalleryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
