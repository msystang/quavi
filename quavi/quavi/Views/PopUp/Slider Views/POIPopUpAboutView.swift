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
        label.textColor = UIDesign.quaviYellow
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var descriptionTextView: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .black
//        configureGradient()
        configurePOIName()
        configureImageView()
        configureDescriptionTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureGradient() {
        let gradient = GradientView()
        gradient.startColor = UIColor(red: 0.827, green: 0.148, blue: 0.416, alpha: 0.80)
        gradient.endColor = .systemBlue
        gradient.translatesAutoresizingMaskIntoConstraints = false
        addSubview(gradient)
        NSLayoutConstraint.pin(view: gradient, to: self)
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
