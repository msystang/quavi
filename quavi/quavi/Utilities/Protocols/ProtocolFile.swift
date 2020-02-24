//
//  File.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

protocol WaypointConfirmationViewControllerDelegate: NSObject {
    func proceedToNextLegInTour(_ controller: POIPopUpViewController)
}


//onBoarding delegate
protocol QuaviOnBoardingDelegate: AnyObject {
    
    func quaviOnBoarding(_ quaviOnBoarding: OnBoardingView, tapped index: Int)
    
}
//  extension to onBoarding delegate to make functions not required when conforming
extension QuaviOnBoardingDelegate {
    
    func quaviOnBoarding(_ quaviOnBoarding: OnBoardingView, tapped index: Int){}
}


//onBoarding dataSource
protocol QuaviOnBoardingDataSource: AnyObject {
    func quaviOnboardBackgroundColorFor(_ quaviOnBoarding: OnBoardingView, atIndex index: Int) -> UIColor?
    func quaviOnboardNumberOfPages(_ quaviOnBoarding: OnBoardingView) -> Int
    func quaviOnboardPageForIndex(_ quaviOnBoarding: OnBoardingView, index: Int) -> QuaviOnBoardingPage?
    func quaviOnboardViewForOverlay(_ quaviOnBoarding: OnBoardingView) -> QuaviOnboardOverlay?
    func quaviOnboardOverlayForPosition(_ quaviOnBoarding: OnBoardingView, overlay: QuaviOnboardOverlay, for position: Double)
    
}

//  extension to onBoarding dataSource to make functions not required when conforming
extension QuaviOnBoardingDataSource{
    func quaviOnboardOverlayForPosition(_ quaviOnBoarding: OnBoardingView, overlay: QuaviOnboardOverlay, for position: Double) {}
    func quaviOnboardViewForOverlay(_ quaviOnBoarding: OnBoardingView) -> QuaviOnboardOverlay? {
        return QuaviOnboardOverlay()
    }
}

