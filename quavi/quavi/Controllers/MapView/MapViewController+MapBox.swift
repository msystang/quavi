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
    func getSelectedRoute(navigationType:MBDirectionsProfileIdentifier) {
        //TODO: User's current location must require mapView to load first, must deal with async
        
        // For Testing...
        let testInitialLocation = CLLocationCoordinate2D(latitude: 40.7489288, longitude: -73.9869172)
        
        DispatchQueue.main.async {
            do {
                let options = try Tour.generateNavigationRouteOptions(from: Tour.dummyData, initialLocation: testInitialLocation, navigationType: navigationType)
                
                //Generate route from options
                //TODO: Make async
                self.generateRoute(from: options) { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let route):
                        self.selectedRoute = route
                        self.addMapAnnotations(from: route)
                        self.generatePolylineSource(from: route)
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
    
    func generatePolylineSource(from selectedRoute: Route) {
        //Draws line for the route based on waypoints and turns
        guard selectedRoute.coordinateCount > 0 else { return }
        
        guard let coordinates = selectedRoute.coordinates else { return }
        
        let polyline = MGLPolylineFeature(coordinates: coordinates, count: selectedRoute.coordinateCount)
        
        //If there's already a polyline, we reset the polyline to the new route. If not, it creates a new polyline
        //TODO: make enum for these keys
        
        if let source = mapView.style?.source(withIdentifier: "route-source") as? MGLShapeSource {
            source.shape = polyline
            generatePolylineStyle(source: source)
        } else {
            //TODO: Look into what options are?
            let source = MGLShapeSource(identifier: "route-source", features: [polyline], options: nil)
            mapView.style?.addSource(source)
            generatePolylineStyle(source: source)
        }
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
    
    private func designPolyLine(lineStyle:MGLLineStyleLayer){
        //MARK: - This switch statement is used to design the polyline based on the users mode of transportation
        switch modeOfTransit{
        case .automobile:
            lineStyle.lineDashPattern = NSExpression(forConstantValue: [2.5, 0])
            lineStyle.lineWidth = NSExpression(forConstantValue: 4)
            lineStyle.lineCap = NSExpression(forConstantValue: "round")
        case .cycling:
            lineStyle.lineDashPattern = NSExpression(forConstantValue: [8, 2])
            lineStyle.lineGapWidth = NSExpression(forConstantValue: 3)
            lineStyle.lineWidth = NSExpression(forConstantValue: 2)
        case .walking:
            lineStyle.lineDashPattern = NSExpression(forConstantValue: [3.5, 1.5])
            lineStyle.lineWidth = NSExpression(forConstantValue: 4)
        default:
            return
        }
        lineStyle.lineJoin = NSExpression(forConstantValue: "round")
        lineStyle.lineColor = NSExpression(forConstantValue: UIColor.yellow)
        
        mapView.style?.addLayer(lineStyle)
    }
    
    private func generatePolylineStyle(source: MGLShapeSource) {
        //MARK: -- We check to see if a lineStyle has been added, then we remove it from the mapview style later
        if let oldLineSyle  = mapView.style?.layer(withIdentifier: "route-style"){
            mapView.style?.removeLayer(oldLineSyle)
        }
        
        let lineStyle = MGLLineStyleLayer(identifier: "route-style", source: source)
        designPolyLine(lineStyle: lineStyle)
    }
}