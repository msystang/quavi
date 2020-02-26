//
//  MapViewController+Constraints.swift
//  quavi
//
//  Created by Sunni Tang on 2/3/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension MapViewController {
    //TODO: Add all constraints for objects here, marked and labeled
    
    //TODO: Create addSubview and addConstraint func for specific objects i.e. addCollectionViewSubviews(), addCollectionViewConstraints
    
    //TODO: rename to addMapViewSubviews()
    func addSubviews() {
        //TODO: -- re-assign this to the view when the collectionview is added
        view.addSubview(mapView)
        sliderView.addSubview(startNavigationButton)
        mapView.addSubview(bikeButton)
        mapView.addSubview(carButton)
        mapView.addSubview(walkButton)
    }
    
    //TODO: rename to addMapViewConstraints()
    func addConstraints() {
        setMapViewConstraints()
        setStartNavigationButtonConstraints()
    }
    
    //MARK: -mapView Constraints
    //TODO: make funcs private
    func setMapViewConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -500),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: view.bounds.height)
        ])
        
        
    }
    
    func setStartNavigationButtonConstraints(){
        startNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([startNavigationButton.topAnchor.constraint(equalTo: sliderView.topAnchor, constant: -(startNavigationButton.frame.height / 2)),
                                     startNavigationButton.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor, constant:  -5),
                                     startNavigationButton.heightAnchor.constraint(equalToConstant: 50),
                                     startNavigationButton.widthAnchor.constraint(equalToConstant: 50)])
    }
    
    //MARK: -collectionView Constraints
    
    //MARK: -tableView Constraints
    
    //MARK: -bike button constraints
    func setBikeButtonConstraints(){
        bikeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bikeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
                                     bikeButton.centerXAnchor.constraint(equalTo: mapView.centerXAnchor),
                                     bikeButton.heightAnchor.constraint(equalToConstant: 50),
                                     bikeButton.widthAnchor.constraint(equalToConstant: 50)])
    }
    
    //MARK: -car button constraints
    func setCarButtonConstraints(){
        carButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([carButton.topAnchor.constraint(equalTo: bikeButton.topAnchor),
                                     carButton.trailingAnchor.constraint(equalTo: bikeButton.leadingAnchor, constant: -40),
                                     carButton.heightAnchor.constraint(equalTo: bikeButton.heightAnchor),
                                     carButton.widthAnchor.constraint(equalTo: bikeButton.widthAnchor)])
    }
    
    //MARK: -walk button constraints
    func setWalkButtonConstraints(){
        walkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([walkButton.topAnchor.constraint(equalTo: bikeButton.topAnchor),
                                     walkButton.leadingAnchor.constraint(equalTo: bikeButton.trailingAnchor, constant: 40),
                                     walkButton.heightAnchor.constraint(equalTo: bikeButton.heightAnchor),
                                     walkButton.widthAnchor.constraint(equalTo: bikeButton.widthAnchor)])
    }
}
