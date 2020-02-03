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
    }
    
    func addConstraints() {
        setMapViewConstraints()
    }
    
    //MARK: -mapView Constraints
    func setMapViewConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
    
}
