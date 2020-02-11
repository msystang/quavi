//
//  MapViewController+Navigation+Delegate.swift
//  quavi
//
//  Created by Mr Wonderful on 2/11/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import Mapbox
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

extension MapViewController:NavigationMapViewDelegate{
    
    func navigationViewController(_ navigationViewController: NavigationViewController, didArriveAt waypoint: Waypoint)-> Bool {
        
        let poiInfoViewController = POIInfoViewController()
        navigationViewController.present(poiInfoViewController, animated: true, completion: nil)
        return false
    }
    
}
