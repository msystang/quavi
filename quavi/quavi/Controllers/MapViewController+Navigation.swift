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
        guard let selectedRoute = selectedRoute else { return }

        let navigationVC = NavigationViewController(for: selectedRoute)
        navigationVC.modalPresentationStyle = .fullScreen

        present(navigationVC, animated: true)
    }

}
