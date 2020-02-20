//
//  File.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

protocol WaypointConfirmationViewControllerDelegate: NSObject {
    func proceedToNextLegInTour(_ controller: POIInfoViewController)
}

//onBoarding delegate
 protocol QuaviOnBoardingDelegate: AnyObject {
    
    func quaviOnBoarding(_ quaviOnBoarding: OnBoarding, currentPage index: Int)
    func quaviOnBoarding(_ quaviOnBoarding: OnBoarding, tapped index: Int)
    
}

extension QuaviOnBoardingDelegate {
    func quaviOnBoarding(_ quaviOnBoarding: OnBoarding, currentPage index: Int){}
    
    func quaviOnBoarding(_ quaviOnBoarding: OnBoarding, tapped index: Int){}
}
