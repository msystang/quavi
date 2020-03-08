//
//  POIInfoViewController+Navigation+Delegate.swift
//  quavi
//
//  Created by Mr Wonderful on 3/8/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import MapboxNavigation
import MapboxDirections
import MapboxCoreNavigation

extension POIInfoViewController: NavigationViewControllerDelegate{
    func navigationViewController(_ navigationViewController: NavigationViewController, didArriveAt waypoint: Waypoint) -> Bool {
        let waypointCount = (selectedRoute?.routeOptions.waypoints.count)!
         if nextStopIndex == waypointCount - 1{
                isAtLastLeg = true
                }else{
                isAtLastLeg = false
                }
        navigationViewController.navigationService.stop()
        navigationViewController.navigationService.endNavigation(feedback: nil)
        navigationViewController.dismiss(animated: true, completion: nil)
        return false
    }
}
