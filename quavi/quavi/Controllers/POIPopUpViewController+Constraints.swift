//
//  POIPopUpViewController+Constraints.swift
//  quavi
//
//  Created by Alex 6.1 on 2/24/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension POIPopUpViewController{
    
    func addSubviews() {
        view.addSubview(reachedLabel)
        view.addSubview(pointNameLabel)
        view.addSubview(continueTourButton)
        view.addSubview(cancelTourButton)
    }
    
    func addConstraints() {
        reachedLabelContraints()
        pointNameLabelContraints()
        continueTourButtonConstraints()
        cancelTourButtonConstraints()
    }
    
    func reachedLabelContraints() {
        reachedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reachedLabel.bottomAnchor.constraint(equalTo: pointNameLabel.topAnchor, constant: -10),
            reachedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            reachedLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            reachedLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func pointNameLabelContraints() {
        pointNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pointNameLabel.bottomAnchor.constraint(equalTo: continueTourButton.topAnchor, constant: -20),
            pointNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            pointNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            pointNameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func continueTourButtonConstraints() {
        continueTourButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //continueTourButton.topAnchor.constraint(equalTo: pointNameLabel.bottomAnchor, constant: 30),
            continueTourButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            continueTourButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueTourButton.heightAnchor.constraint(equalToConstant: 100),
            continueTourButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func cancelTourButtonConstraints() {
        cancelTourButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelTourButton.topAnchor.constraint(equalTo: continueTourButton.bottomAnchor, constant: 15),
            cancelTourButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelTourButton.heightAnchor.constraint(equalToConstant: 75),
            cancelTourButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

}
