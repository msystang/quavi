//
//  CategoryData.swift
//  moveTheViewPlease
//
//  Created by Radharani Ribas-Valongo on 2/3/20.
//  Copyright © 2020 aglegaspi. All rights reserved.
//

import Foundation

//TODO: Refactor by directly using category enum or categories directly from firebase
enum Category: String, CaseIterable {
    case history = "History"
    case culture = "Culture"
    case foodAndDrink = "Food and Drink"
    case spiritual = "Spiritual"
}
