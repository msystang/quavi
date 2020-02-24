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
    }
    
     func continueButtonConstraints(){
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -20), continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), continueButton.heightAnchor.constraint(equalToConstant: 100), continueButton.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    func reachedLabelContraints() {
        reachedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reachedLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            reachedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            reachedLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            reachedLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func pointNameLabelContraints() {
        reachedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reachedLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            reachedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            reachedLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            reachedLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
