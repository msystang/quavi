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
    
    private func isTourAtLastLeg() {
        let waypointCount = (selectedRoute?.routeOptions.waypoints.count)!
        isAtLastLeg = nextStopIndex == waypointCount - 1 ? true : false
    }
    
    func navigationViewController(_ navigationViewController: NavigationViewController, didArriveAt waypoint: Waypoint) -> Bool {
        isTourAtLastLeg()
        nextStopIndex += 1
        navigationViewController.navigationService.stop()
        navigationViewController.navigationService.endNavigation(feedback: nil)

        navigationViewController.dismiss(animated: true, completion: nil)
        return false
    }
    
        func navigationViewControllerDidDismiss(_ navigationViewController: NavigationViewController, byCanceling canceled: Bool) {
            print(nextStopIndex)
            navigationViewController.dismiss(animated: true, completion: nil)
        }
}
