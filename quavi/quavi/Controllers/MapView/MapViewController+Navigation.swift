//
//  MapViewController+Navigation.swift
//  quavi
//
//  Created by Mr Wonderful on 2/10/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import MapboxNavigation
import MapboxDirections
import MapboxCoreNavigation

extension MapViewController {

    @objc func startNavigationButtonPressed() {
        // TODO: Handle error (enum or alert?)
        guard let currentLegRoute = currentLegRoute else { return }

        let navigationService = MapboxNavigationService(route: currentLegRoute, simulating: .always )
        let navigationOptions = NavigationOptions(navigationService: navigationService)
        let navigationVC = NavigationViewController(for: currentLegRoute, options: navigationOptions)
        navigationVC.delegate = self
        navigationVC.modalPresentationStyle = .fullScreen
        
        // Use this property to indicate when to change continue button to finish tour in POIInfoVC
        nextStopIndex += 1
        print("Index for next stop: \(nextStopIndex)")
        
        //TODO: For testing - remove after we use actual user location!
        userLocation = currentLegRoute.coordinates?.last ?? CLLocationCoordinate2D(latitude: 40.7489288, longitude: -73.9869172)
        
        present(navigationVC, animated: true)
    }

}
