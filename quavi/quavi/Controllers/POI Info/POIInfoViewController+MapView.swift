//
//  POIInfoViewController+MapView.swift
//  quavi
//
//  Created by Sunni Tang on 3/6/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import Mapbox
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

extension POIInfoViewController: MGLMapViewDelegate {
    
    // MARK: - Internal Methods
    func generateRouteForNextLeg(from selectedRoute: Route?, nextStopIndex: Int, navigationType: MBDirectionsProfileIdentifier) {
        
        guard let selectedRoute = selectedRoute else {
            return
        }
        waypointCount = selectedRoute.routeOptions.waypoints.count
        guard nextStopIndex < waypointCount - 1 else { return }
        
        let initialWaypoint = Waypoint(coordinate: userLocation, coordinateAccuracy: -1, name: "Initial Location")
        
        let nextWaypoint = selectedRoute.routeOptions.waypoints[nextStopIndex]

        //TODO: Determine if we need to handle async for getting options from API
        let options = NavigationRouteOptions(waypoints: [initialWaypoint, nextWaypoint], profileIdentifier: navigationType)
        
        DispatchQueue.main.async {
            self.generateRoute(from: options) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let route):
                    self.currentLegRoute = route
                    self.generatePolylineSource(from: route)
                }
            }
        }

    }
    

    func getSelectedRoute(navigationType:MBDirectionsProfileIdentifier) {
        //TODO: User's current location must require mapView to load first, must deal with async
        
        DispatchQueue.main.async {
            do {
                let options = try Tour.generateTourRouteOptions(from: Tour.dummyData, navigationType: navigationType)
                
                //Generate route from options
                //TODO: Make async
                self.generateRoute(from: options) { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let route):
                        self.selectedRoute = route
                        self.addMapAnnotations(from: route)
                        self.generateRouteForNextLeg(from: route, nextStopIndex: self.nextStopIndex, navigationType: navigationType)
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
        
        view4.addAnnotations(routePoints)
    }
    
    func generatePolylineSource(from selectedRoute: Route) {
        //Draws line for the route based on waypoints and turns
        guard selectedRoute.coordinateCount > 0 else { return }
        
        guard let coordinates = selectedRoute.coordinates else { return }
        
        let polyline = MGLPolylineFeature(coordinates: coordinates, count: selectedRoute.coordinateCount)
        
        //If there's already a polyline, we reset the polyline to the new route. If not, it creates a new polyline
        //TODO: make enum for these keys
        
        if let source = view4.style?.source(withIdentifier: "route-source") as? MGLShapeSource {
            source.shape = polyline
            generatePolylineStyle(source: source)
        } else {
            //TODO: Look into what options are?
            let source = MGLShapeSource(identifier: "route-source", features: [polyline], options: nil)
            view4.style?.addSource(source)
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
        
        view4.style?.addLayer(lineStyle)
    }
    
    private func generatePolylineStyle(source: MGLShapeSource) {
        //MARK: -- We check to see if a lineStyle has been added, then we remove it from the mapview style later
        if let oldLineSyle  = view4.style?.layer(withIdentifier: "route-style"){
            view4.style?.removeLayer(oldLineSyle)
        }
        
        let lineStyle = MGLLineStyleLayer(identifier: "route-style", source: source)
        designPolyLine(lineStyle: lineStyle)
    }

}
