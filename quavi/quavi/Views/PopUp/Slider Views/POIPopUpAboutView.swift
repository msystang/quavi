//
//  POIPopUpAboutView.swift
//  quavi
//
//  Created by Alex 6.1 on 3/2/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class POIPopUpAboutView: UIView {
    
    let padding: CGFloat = 20

    lazy var poiName: UILabel = {
        var label = UILabel()
        return label
    }()
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    lazy var descriptionTextView: UITextView = {
        var textView = UITextView()
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configurePOIName()
        configureImageView()
        configureDescriptionTextView()
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
            poiName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            poiName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: poiName.bottomAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureDescriptionTextView() {
        addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }

    
    
}
