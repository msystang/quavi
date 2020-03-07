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
        view.addSubview(likeButton)
        view.addSubview(presentModesOfTransport)
    }
    
    func continueButtonConstraints() {
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -20), continueButton.trailingAnchor.constraint(equalTo: presentModesOfTransport.leadingAnchor, constant: -20), continueButton.heightAnchor.constraint(equalToConstant: 40), continueButton.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    func easterEggButtonConstraints() {
        easterEggButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([easterEggButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10), easterEggButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15), easterEggButton.widthAnchor.constraint(equalToConstant: 35), easterEggButton.heightAnchor.constraint(equalToConstant: 35)])
    }
    
    func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: easterEggButton.bottomAnchor, constant: 30), containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor), containerView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.65), containerView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.95) ])
    }
    
    func pageControlConstraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([pageControl.bottomAnchor.constraint(equalTo: containerView.topAnchor), pageControl.widthAnchor.constraint(equalTo: containerView.widthAnchor), pageControl.heightAnchor.constraint(equalToConstant: 20)])
    }
    
    func likeButtonConstraints() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([likeButton.heightAnchor.constraint(equalToConstant: 50), likeButton.widthAnchor.constraint(equalToConstant: 50), likeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: likeButton.frame.height / 2 ), likeButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)])
    }
    
    func presentModesOfTransportConstraints() {
        presentModesOfTransport.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([presentModesOfTransport.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -20), presentModesOfTransport.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), presentModesOfTransport.heightAnchor.constraint(equalToConstant: 40), presentModesOfTransport.widthAnchor.constraint(equalToConstant: 40)])
    }
}
