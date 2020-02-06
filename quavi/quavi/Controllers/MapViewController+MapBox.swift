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
    //TODO: Draw polyline for route
    //TODO: Place polyline on mapView
    
    // MARK: - Internal Methods
    //TODO: Refactor with initalLocation from user!
    func getSelectedRoute() {
        //TODO: User's current location must require mapView to load first, must deal with async
        
        // For Testing...
        let testInitialLocation = CLLocationCoordinate2D(latitude: 40.758896, longitude: -73.985130)
        let testProfileIdentifier = MBDirectionsProfileIdentifier.walking
        
        
        DispatchQueue.main.async {
            do {
                let options = try Tour.generateNavigationRouteOptions(from: Tour.dummyData, initialLocation: testInitialLocation, navigationType: testProfileIdentifier)
                
                //Generate route from options
                //TODO: Make async
                self.generateRoute(from: options) { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let route):
                        self.selectedRoute = route
                        self.testSelectedRoute()
                        self.addMapAnnotations(from: route)
                    }
                }
            } catch let error {
                print("error in getSelectedRoute: \(error)")
            }
        }
    }
    
    func addMapAnnotations(from selectedRoute: Route) {
        //Creating points as an array of MGLPointAnnotations then adding as annotations in mapView
        //TODO: Remove annotation for first annotation
        let waypoints = selectedRoute.routeOptions.waypoints
        var routePoints = [MGLPointAnnotation]()
        
        waypoints.forEach { (waypoint) in
            let pointAnnotation = MGLPointAnnotation()
            pointAnnotation.coordinate = waypoint.coordinate
            pointAnnotation.title = waypoint.name ?? "Could not get name for waypoint"
            
            routePoints.append(pointAnnotation)
        }
        
        mapView.addAnnotations(routePoints)
    }
    
    // MARK: - MapBox Delegate Methods
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
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
