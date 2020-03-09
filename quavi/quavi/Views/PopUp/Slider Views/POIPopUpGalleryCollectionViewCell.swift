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
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override func prepareForReuse() {
        poiGalleryImageView.image = UIImage(named: "moMath2")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(poiGalleryImageView)
        poiGalleryImageView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            poiGalleryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            poiGalleryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            poiGalleryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            poiGalleryImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
    }
}
