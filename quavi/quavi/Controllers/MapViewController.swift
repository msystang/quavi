//
//  MapViewController.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit
import Mapbox
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

class MapViewController: UIViewController {
    
    // MARK: -PROPERTIES
    var sampleData = POI.pointsOfinterest
    var selectedRoute: Route?
    
    // MARK: - VIEWS
    lazy var mapView = MapView(frame: view.bounds)
    let sliderView = SliderView()
    lazy var poiTableView = QuaviTableView()
    lazy var categoriesCollectionView = CollectionView(frame: view.bounds)
    var startNavigationButton = NavigationUIButton()
    
    lazy var chevronArrows: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "minus")
        image.tintColor = .gray
        image.isUserInteractionEnabled = true
        return image
    }()
    
    // TODO: Make Category enum case iterable and load directly, don't need this property. For MVP we can remove enum and get categories directly from the loaded tours.
    let sampleCategoryData: [CategoryData] = [
        CategoryData(name: Enums.categories.History.rawValue),
        CategoryData(name: Enums.categories.Art.rawValue),
        CategoryData(name: Enums.categories.Science.rawValue),
        CategoryData(name: Enums.categories.Religion.rawValue),
        CategoryData(name: Enums.categories.Yeet.rawValue)
    ]
    
    var sliderViewTopConstraintMidState: NSLayoutConstraint?
    var sliderViewTopConstraintsBottomState: NSLayoutConstraint?
    var fullScreenSliderViewConstraints: NSLayoutConstraint?
    
    var mapViewBottomConstraintHalf: NSLayoutConstraint?
    var mapViewBottomConstraintClosed: NSLayoutConstraint?
    
    var sliderViewState: Enums.sliderViewStates = .halfOpen
    let sliderViewHeight: CGFloat = 900
    
    var currentSelectedCategory: String = Enums.categories.History.rawValue {
        didSet { poiTableView.reloadData() }
    }
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        addSubviews()
        mapView.delegate = self
        getSelectedRoute()
        
        poiTableView.dataSource = self
        poiTableView.delegate = self
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        addSliderViewSubViews()
        addSliderViewConstraints()
        loadGestures()
        self.startNavigationButton.addTarget(self, action: #selector(startNavigationButtonPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addConstraints()
    }
    
    //MARK: -PRIVATE FUNCTIONS
    
    
    
}
