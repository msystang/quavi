//
//  File.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

protocol WaypointConfirmationViewControllerDelegate: NSObject {
    func proceedToNextLegInTour(_ controller: POIInfoViewController)
}

//onBoarding delegate
 protocol QuaviOnBoardingDelegate: AnyObject {
    
    func quaviOnBoarding(_ quaviOnBoarding: OnBoarding, currentPage index: Int)
    func quaviOnBoarding(_ quaviOnBoarding: OnBoarding, tapped index: Int)
    
}
//  extension to onBoarding delegate to make functions not required when conforming
extension QuaviOnBoardingDelegate {
    func quaviOnBoarding(_ quaviOnBoarding: OnBoarding, currentPage index: Int){}
    
    func quaviOnBoarding(_ quaviOnBoarding: OnBoarding, tapped index: Int){}
}


//onBoarding dataSource
 protocol QuaviOnBoardingDataSource: AnyObject {
    func quaviOnboardBackgroundColorFor(_ quickGrubOnBoarding: OnBoarding, atIndex index: Int) -> UIColor?
    func quaviOnboardNumberOfPages(_ quickGrubOnBoarding: OnBoarding) -> Int
    func quaviOnboardPageForIndex(_ quickGrubOnBoarding: OnBoarding, index: Int) -> QuaviOnBoardingPage?
    func quaviOnboardViewForOverlay(_ quickGrubOnBoarding: OnBoarding) -> QuaviOnboardOverlay?
    func quaviOnboardOverlayForPosition(_ quickGrubOnBoarding: OnBoarding, overlay: QuaviOnboardOverlay, for position: Double)
    
}

//  extension to onBoarding dataSource to make functions not required when conforming
extension QuaviOnBoardingDataSource{
      func quaviOnboardOverlayForPosition(_ quickGrubOnBoarding: OnBoarding, overlay: QuaviOnboardOverlay, for position: Double) {}
      func quaviOnboardViewForOverlay(_ quickGrubOnBoarding: OnBoarding) -> QuaviOnboardOverlay? {
          return QuaviOnboardOverlay()
      }
}
