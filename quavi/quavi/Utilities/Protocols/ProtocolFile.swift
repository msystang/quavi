//
//  File.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation

protocol WaypointConfirmationViewControllerDelegate: NSObject {
    func proceedToNextLegInTour(_ controller: POIPopUpViewController)
}
