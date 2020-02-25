//
//  quaviTests.swift
//  quaviTests
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import XCTest
import CoreLocation
import Quick
import Nimble
import MapboxDirections
import MapboxCoreNavigation

@testable import quavi

class quaviTests: QuickSpec {
    
    override func spec() {
        let testInitialLocation = CLLocationCoordinate2D(latitude: 40.7000, longitude: -74.0000)
        let testPointA = POI(name: "Point A", isCellExpanded: false, lat: 40.7011, long: -74.0011, shortDesc: "Short Description A", longDesc: "Long Discription A", tableViewImage: UIImage(), popoverImage: UIImage())
        let testPointB = POI(name: "Point B", isCellExpanded: false, lat: 40.7022, long: -74.0022, shortDesc: "Short Description B", longDesc: "Long Discription B", tableViewImage: UIImage(), popoverImage: UIImage())
        
        
        //MARK: - POI Model
        //Arrange & Act: Create test POI above. POI model has a computed variable waypoint
        describe("A POI") {
            context("when instantiated with a latitude and longitude of type Double") {
                it("should compute a waypoint property with coordinate.latitude and coordinate.longitude values of type CLLocationDegrees") {
                    
                    //Assert: Assert that the waypoint is computed correctly by testing the original latitude to the latitude of the computed waypoint
                    XCTAssert(testPointA.lat == testPointA.waypoint.coordinate.latitude, "Expected latitude of \(testPointA.lat) but got \(testPointA.waypoint.coordinate.latitude)")
                    
                    // Look into what Predicate types are to use Quick/Nimble language below
                    //                    expect(testPointA.lat).to(testPointA.waypoint.coordinate.latitude)
                }
            }
        }
        
        //MARK: - Tour Model
        describe("A tour") {
            //Arrange: create test Tour
            let testTour = Tour(name: "Name", category: "Category", stops: [testPointA, testPointB])
            var testOptions: NavigationRouteOptions?
            var testRoute: Route?
            var nextStopIndex = 0
            
            func generateRoute(from options: NavigationRouteOptions, completion: @escaping ((Result<Route, MapboxError>) -> ())) {
                
                _ = Directions.shared.calculate(options, completionHandler: { [weak self] (waypoints, routes, error) in
                    
                    guard let bestRoute = routes?.first else {
                        completion(.failure(.generatingRouteError))
                        return
                    }
                    completion(.success(bestRoute))
                    
                })
            }
            
            context("when we apply generateTourRouteOptions") {
                it("should return a NavigationRouteOption with properties such as waypoints that are all the POI of the tour from which we can generate a MapboxDirections type Route") {
                    //Act: using generateTourRouteOptions func on test data
                    do {
                        testOptions = try Tour.generateTourRouteOptions(from: testTour, navigationType: .walking)
                        //Assert: assert that we get the expected number of waypoints from test data (we should get 3: testPoint A, testPointB, testInitialLocation)
                        expect(testOptions!.waypoints.count).to(equal(2))
                        
                        
                        generateRoute(from: testOptions!) { (result) in
                            switch result {
                            case .failure(let error):
                                fail("Could not generate route: \(error)")
                            case .success(let route):
                                testRoute = route
                                expect(route.routeOptions.waypoints.count).to(equal(2))
                            }
                        }
                        
                        
                    } catch {
                        fail("Could not generate nagivation route options: \(error)")
                    }
                }
            }
            
            
            
        }
        
    }
}

/*
 class quaviTestsUsingXCTest: XCTest {
 
 override func setUp() {
 // Put setup code here. This method is called before the invocation of each test method in the class.
 }
 
 override func tearDown() {
 // Put teardown code here. This method is called after the invocation of each test method in the class.
 }
 
 //MARK: - Tour Model
 func testGenerateNavigationRouteOptions() {
 //Arrange: create test POI, Tour, and initialLocation
 let testInitialLocation = CLLocationCoordinate2D(latitude: 40.7000, longitude: -74.0000)
 let testPointA = POI(name: "Point A", isCellExpanded: false, lat: 40.7011, long: -74.0011, shortDesc: "Short Description A", longDesc: "Long Discription A", tableViewImage: UIImage(), popoverImage: UIImage())
 let testPointB = POI(name: "Point B", isCellExpanded: false, lat: 40.7022, long: -74.0022, shortDesc: "Short Description B", longDesc: "Long Discription B", tableViewImage: UIImage(), popoverImage: UIImage())
 let testTour = Tour(name: "Name", category: "Category", stops: [testPointA, testPointB])
 
 //Act: using generateTourRouteOptions func on test data
 do {
 let testOptions = try Tour.generateTourRouteOptions(from: testTour, navigationType: .walking)
 //Assert: assert that we get the expected number of waypoints from test data (we should get 3: testPoint A, testPointB, testInitialLocation)
 XCTAssert(testOptions.waypoints.count == 2, "Expected 2 waypoints but got \(testOptions.waypoints.count)")
 } catch {
 XCTFail("Could not generate nagivation route options: \(error)")
 }
 }
 
 //MARK: - POI Model
 func testWaypointComputedVariable() {
 //Arrange & Act: Create test POI. POI model has a computed variable waypoint
 let testPointA = POI(name: "Point A", isCellExpanded: false, lat: 40.7011, long: -74.0011, shortDesc: "Short Description A", longDesc: "Long Discription A", tableViewImage: UIImage(), popoverImage: UIImage())
 
 //Assert: Assert that the waypoint is computed correctly by testing the original latitude to the latitude of the computed waypoint
 XCTAssert(testPointA.lat == testPointA.waypoint.coordinate.latitude, "Expected latitude of \(testPointA.lat) but got \(testPointA.waypoint.coordinate.latitude)")
 }
 }
 */
