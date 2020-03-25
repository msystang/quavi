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

extension MapViewController: NavigationViewControllerDelegate{
    func navigationViewController(_ navigationViewController: NavigationViewController, didArriveAt waypoint: Waypoint)-> Bool {
        // When the user arrives, present a view controller that prompts the user to continue to their next destination
        // This vc is where we could show information about a destination
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
        let poiInfoViewController = POIInfoViewController()
        poiInfoViewController.nextStopIndex += 1
        poiInfoViewController.poiForTour = poiForTour
        poiInfoViewController.selectedTour = selectedTour
        poiInfoViewController.selectedRoute = selectedRoute
        
        let waypointCount = selectedRoute?.routeOptions.waypoints.count
        if nextStopIndex == waypointCount{
        poiInfoViewController.isAtLastLeg = true
        }else{
        poiInfoViewController.isAtLastLeg = false
        }
        
        poiInfoViewController.modalPresentationStyle = .fullScreen
        navigationViewController.navigationService.stop()
        navigationViewController.present(poiInfoViewController, animated: true)
        return false
    }
    
    func navigationViewControllerDidDismiss(_ navigationViewController: NavigationViewController, byCanceling canceled: Bool) {
         print(nextStopIndex)
        navigationViewController.dismiss(animated: true, completion: nil)
    }
}

