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
        view.addSubview(containerView)
        view.addSubview(pageControl)
    }
    
    func continueButtonConstraints() {
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -20), continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), continueButton.heightAnchor.constraint(equalToConstant: 100), continueButton.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    func easterEggButtonConstraints() {
        easterEggButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([easterEggButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5), easterEggButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5), easterEggButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2), easterEggButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: easterEggButton.bottomAnchor, constant: 15), containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor), containerView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.70), containerView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.95) ])
    }
    func pageControlConstraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([pageControl.topAnchor.constraint(equalTo: containerView.bottomAnchor), pageControl.widthAnchor.constraint(equalTo: containerView.widthAnchor), pageControl.heightAnchor.constraint(equalToConstant: 20)])
    }
}
