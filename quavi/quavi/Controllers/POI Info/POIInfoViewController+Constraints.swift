//
//  File.swift
//  quavi
//
//  Created by Mr Wonderful on 2/11/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//
import UIKit

extension POIInfoViewController{
    
    func addSubviews() {
        view.addSubview(continueButton)
        view.addSubview(easterEggButton)
    }
    
     func continueButtonConstraints() {
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -20), continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), continueButton.heightAnchor.constraint(equalToConstant: 100), continueButton.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    func easterEggButtonConstraints() {
        easterEggButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([easterEggButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5), easterEggButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5), easterEggButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2), easterEggButton.heightAnchor.constraint(equalToConstant: 50)])
    }

}
