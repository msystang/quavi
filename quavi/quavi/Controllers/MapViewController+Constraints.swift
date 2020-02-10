//
//  MapViewController+Constraints.swift
//  quavi
//
//  Created by Sunni Tang on 2/3/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension MapViewController {
    func addSubviews() {
        view.addSubview(mapView)
        //TODO: -- re-assign this to the view when the collectionview is added
        mapView.addSubview(startNavigationButton)
    }
    
    func addConstraints() {
        setMapViewConstraints()
        setStartNavigationButtonConstraints()
    }
    
    //MARK: -mapView Constraints
    func setMapViewConstraints() {
        //TODO: Move bottom constraint down to hide mapbox i button
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }

    func setStartNavigationButtonConstraints(){
        startNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startNavigationButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -15),
            startNavigationButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -30),
            startNavigationButton.heightAnchor.constraint(equalToConstant: 40),
            startNavigationButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
