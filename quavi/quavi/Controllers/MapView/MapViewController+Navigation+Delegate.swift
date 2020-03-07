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
        
        let popupViewController = POIInfoViewController()
        
        #warning("send logic through a delegate")
        let waypointCount = selectedRoute?.routeOptions.waypoints.count
        if nextStopIndex == waypointCount{
            popupViewController.isAtLastLeg = true
        }
        //popupViewController.delegate = self
        
        navigationViewController.navigationService.stop()
        navigationViewController.present(popupViewController, animated: true)
        return false
    }
}

extension MapViewController: WaypointConfirmationViewControllerDelegate {
    func proceedToNextLegInTour(_ controller: POIInfoViewController) {
        
        controller.dismiss(animated: true, completion: {
            guard let navigationViewController = self.presentedViewController as? NavigationViewController else { return }
            
            guard navigationViewController.navigationService.routeProgress.route.legs.count > navigationViewController.navigationService.routeProgress.legIndex + 1 else { return }
            navigationViewController.navigationService.routeProgress.legIndex += 1
        })
    }
}
