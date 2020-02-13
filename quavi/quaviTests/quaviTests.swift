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

@testable import quavi

class quaviTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: - Tour Model
    func testGenerateNavigationRouteOptions() {
        //Arrange: create test POI, Tour, and initialLocation
        let testPointA = POI(name: "Point A", isCellExpanded: false, lat: 40.7011, long: -74.0011, shortDesc: "Short Description A", longDesc: "Long Discription A", tableViewImage: UIImage(), popoverImage: UIImage())
        let testPointB = POI(name: "Point B", isCellExpanded: false, lat: 40.7022, long: -74.0022, shortDesc: "Short Description B", longDesc: "Long Discription B", tableViewImage: UIImage(), popoverImage: UIImage())
        let testTour = Tour(name: "Name", category: "Category", stops: [testPointA, testPointB])
        let testInitialLocation = CLLocationCoordinate2D(latitude: 40.7000, longitude: -74.0000)
        
        //Act: using generateNavigationRouteOptions func on test data
        do {
            let testOptions = try Tour.generateNavigationRouteOptions(from: testTour, initialLocation: testInitialLocation, navigationType: .walking)
            //Assert: assert that we get the expected number of waypoints from test data (we should get 3: testPoint A, testPointB, testInitialLocation)
            XCTAssert(testOptions.waypoints.count == 3, "Expected 3 waypoints but got \(testOptions.waypoints.count)")
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
