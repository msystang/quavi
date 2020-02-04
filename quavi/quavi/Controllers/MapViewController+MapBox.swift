//
//  MapViewController+MapBox.swift
//  quavi
//
//  Created by Sunni Tang on 2/3/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import Mapbox
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

extension MapViewController: MGLMapViewDelegate {
    // MARK: - Internal Methods
    //TODO: Refactor with initalLocation from user!
    func getSelectedRoute() {
        // For Testing...
        let testInitialLocation = CLLocationCoordinate2D(latitude: Tour.dummyData.stops.first!.lat, longitude: Tour.dummyData.stops.first!.long)
        let testProfileIdentifier = MBDirectionsProfileIdentifier.walking
        
        do {
            let options = try Tour.generateNavigationRouteOptions(from: Tour.dummyData, initialLocation: testInitialLocation, navigationType: testProfileIdentifier)
            
            //Generate route from options
            self.generateRoute(from: options) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let route):
                    self.selectedRoute = route
                    print("Succesfully got route. Lat: \(route.routeOptions.waypoints.first!.coordinate.latitude)")
                }
            }
        } catch let error {
            print("error in getSelectedRoute: \(error)")
        }
    }
    
    
    // MARK: - Private Functions
    private func generateRoute(from options: NavigationRouteOptions, completion: @escaping ((Result<Route, MapboxError>) -> ())) {
        
        _ = Directions.shared.calculate(options, completionHandler: { [weak self] (waypoints, routes, error) in
            
            guard let bestRoute = routes?.first else {
                completion(.failure(.generatingRouteError))
                return
            }
            completion(.success(bestRoute))
            
        })
    }
    
}
