//
//  Enums.swift
//  moveTheViewPlease
//
//  Created by Radharani Ribas-Valongo on 2/6/20.
//  Copyright © 2020 aglegaspi. All rights reserved.
//
import UIKit

struct Enums {
//TODO: Separate enums and put Category enum as a model, other enums that are not models go in Enum folder
    enum categories: String {
        case History, Art, Science, Religion, Yeet
    }
    
    enum cellIdentifiers: String {
        case categoryCell, StopCell
    }
    
    enum sliderViewStates {
        case closed, halfOpen, fullOpen
    }
    
    enum presentModeOfTransport {
        case show, hide
    }
}

