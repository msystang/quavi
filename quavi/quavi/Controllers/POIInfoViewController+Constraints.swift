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
        view.addSubview(ContinueButton)
    }
    
     func continueButtonConstraints(){
        
        ContinueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ContinueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -20), ContinueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor), ContinueButton.heightAnchor.constraint(equalToConstant: 100), ContinueButton.widthAnchor.constraint(equalToConstant: 100)])
    }

}
