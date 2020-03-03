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
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.text = "Sorry, No Title Provided!"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "empireState2")
        return imageView
    }()
    
    lazy var descriptionTextView: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textView.text = "Quavi's intentions are to change how people explore the areas within and surrounding them. In a world full of information we yearn to have options for various categories while being able to share this information with others. Quavi solves this need by providing curated self guided tours for the everyday person and the ability to make and share tours. It's easy to use and fun interface will make you a stan automatically. Stay tuned for Quavi to take over the world of tourism by storm!"
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
            poiName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            poiName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: poiName.bottomAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureDescriptionTextView() {
        addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }

    
    
}
