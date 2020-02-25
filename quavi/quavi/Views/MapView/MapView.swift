//
//  MapView.swift
//  quavi
//
//  Created by Alex 6.1 on 2/13/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit
import Mapbox
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

class MapView: NavigationMapView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        styleURL = MGLStyle.darkStyleURL
        setUserTrackingMode(.followWithCourse, animated: true, completionHandler: nil)
        tintColor = .yellow
        showsUserLocation = true
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}
