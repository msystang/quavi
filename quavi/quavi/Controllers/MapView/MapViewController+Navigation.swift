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
        guard let currentLegRoute = currentLegRoute else {
            self.showAlert(title: "Quack!", message: "Please select a tour first.")
            return
        }

        let navigationService = MapboxNavigationService(route: currentLegRoute, simulating: .always )
        let navigationOptions = NavigationOptions(navigationService: navigationService)
        let navigationVC = NavigationViewController(for: currentLegRoute, options: navigationOptions)
        navigationVC.delegate = self
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }

}
