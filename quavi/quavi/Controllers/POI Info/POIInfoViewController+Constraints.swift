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
        view.addSubview(bikeButton)
        view.addSubview(carButton)
        view.addSubview(walkButton)
        view.addSubview(cancelTourButton)
        pageControl.addSubview(rightChevron)
        pageControl.addSubview(leftChevron)
    }
    
    func continueButtonConstraints() {
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -40), continueButton.trailingAnchor.constraint(equalTo: presentModesOfTransport.leadingAnchor, constant: -20), continueButton.heightAnchor.constraint(equalToConstant: 40), continueButton.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    func easterEggButtonConstraints() {
        easterEggButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([easterEggButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10), easterEggButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15), easterEggButton.widthAnchor.constraint(equalToConstant: 35), easterEggButton.heightAnchor.constraint(equalToConstant: 35)])
    }
    
    func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: easterEggButton.bottomAnchor, constant: 50), containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor), containerView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.65), containerView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.95) ])
    }
    
    func pageControlConstraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([pageControl.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -10), pageControl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor), pageControl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor), pageControl.heightAnchor.constraint(equalToConstant: 25)])
    }
    
    func likeButtonConstraints() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([likeButton.heightAnchor.constraint(equalToConstant: 50), likeButton.widthAnchor.constraint(equalToConstant: 50), likeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: likeButton.frame.height / 2 ), likeButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)])
    }
    
    func presentModesOfTransportConstraints() {
        presentModesOfTransport.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([presentModesOfTransport.bottomAnchor.constraint(equalTo: continueButton.bottomAnchor), presentModesOfTransport.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), presentModesOfTransport.heightAnchor.constraint(equalToConstant: 40), presentModesOfTransport.widthAnchor.constraint(equalToConstant: 40)])
    }
    
    func cancelTourButtonConstraints() {
        cancelTourButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([cancelTourButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), cancelTourButton.bottomAnchor.constraint(equalTo: continueButton.bottomAnchor),cancelTourButton.heightAnchor.constraint(equalToConstant: 40), cancelTourButton.widthAnchor.constraint(equalToConstant: 40)])
    }
    
    func bikeButtonConstraints() {
        bikeButton.translatesAutoresizingMaskIntoConstraints = false
        bikeButtonTopConstraint = bikeButton.topAnchor.constraint(equalTo: presentModesOfTransport.topAnchor, constant:  0)
        newBikeButtonTopConstraint = bikeButton.topAnchor.constraint(equalTo: presentModesOfTransport.topAnchor, constant:  -70)
        NSLayoutConstraint.activate([bikeButtonTopConstraint!, bikeButton.centerXAnchor.constraint(equalTo: presentModesOfTransport.centerXAnchor), bikeButton.heightAnchor.constraint(equalToConstant: 50), bikeButton.widthAnchor.constraint(equalToConstant: 50)])
    }
    
    func carButtonConstraints() {
        carButton.translatesAutoresizingMaskIntoConstraints = false
        carButtonTopConstraint = carButton.topAnchor.constraint(equalTo: bikeButton.topAnchor, constant:  0)
        newCarButtonTopConstraint = carButton.topAnchor.constraint(equalTo: bikeButton.topAnchor, constant:  -70)
        NSLayoutConstraint.activate([carButtonTopConstraint!, carButton.centerXAnchor.constraint(equalTo: presentModesOfTransport.centerXAnchor), carButton.heightAnchor.constraint(equalToConstant: 50), carButton.widthAnchor.constraint(equalToConstant: 50)])
    }
    
    func walkButtonConstraints() {
        walkButton.translatesAutoresizingMaskIntoConstraints = false
        walkButtonTopConstraint = walkButton.topAnchor.constraint(equalTo: carButton.topAnchor, constant:  0)
        newWalkButtonTopConstraint = walkButton.topAnchor.constraint(equalTo: carButton.topAnchor, constant:  -70)
        NSLayoutConstraint.activate([walkButtonTopConstraint!, walkButton.centerXAnchor.constraint(equalTo: presentModesOfTransport.centerXAnchor), walkButton.heightAnchor.constraint(equalToConstant: 50), walkButton.widthAnchor.constraint(equalToConstant: 50)])
    }
    
     func rightChevronConstraint() {
         pageControl.addSubview(rightChevron)
         rightChevron.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([rightChevron.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10), rightChevron.topAnchor.constraint(equalTo: pageControl.topAnchor), rightChevron.heightAnchor.constraint(equalTo: pageControl.heightAnchor), rightChevron.widthAnchor.constraint(equalTo: rightChevron.heightAnchor)])
     }
    
     func leftChevronConstraint() {
          pageControl.addSubview(leftChevron)
          leftChevron.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leftChevron.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10), leftChevron.topAnchor.constraint(equalTo: pageControl.topAnchor), leftChevron.heightAnchor.constraint(equalTo: pageControl.heightAnchor), leftChevron.widthAnchor.constraint(equalTo: leftChevron.heightAnchor)])
      }
}
