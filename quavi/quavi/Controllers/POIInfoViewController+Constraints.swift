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
    

}
