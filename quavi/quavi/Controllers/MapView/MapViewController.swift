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
    
    // MARK: - UI Properties
    let sliderView = SliderView()
    var startNavigationButton = NavigationUIButton()
    
    // MARK: - Lazy UI Variables
    lazy var mapView = MapView(frame: view.bounds)
    lazy var poiTableView = QuaviTableView()
    lazy var categoriesCollectionView = CollectionView(frame: view.bounds)
    
    // MARK: - Computed Lazy UI Variables
    lazy var chevronArrows: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "minus")
        image.tintColor = .gray
        image.isUserInteractionEnabled = true
        return image
    }()
    
    lazy var bikeButton:UIButton = {
        let button = UIButton(image: UIImage(named: "bike")!, borderWidth: 2, tag: 1)
        button.addTarget(self, action: #selector(handleSelectingModeOfTransportation(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var carButton:UIButton = {
        let button = UIButton(image: UIImage(named: "car")!, borderWidth: 2, tag: 0)
         button.addTarget(self, action: #selector(handleSelectingModeOfTransportation(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var walkButton:UIButton = {
        let button = UIButton(image: UIImage(named: "walk")!, borderWidth: 2, tag: 2)
         button.addTarget(self, action: #selector(handleSelectingModeOfTransportation(sender:)), for: .touchUpInside)
        return button
    }()
    

    // MARK: - Internal Properties
    // TODO: Refactor sampleData to tours when pulling from firebase
    var sampleData = POI.pointsOfinterest
    // TODO: Make Category enum case iterable and load directly, don't need this property. For MVP we can remove enum and get categories directly from the loaded tours.
    let sampleCategoryData = ["Quavi History","LGBTQ History","Secret History","4th Dimension History"]
    var currentSelectedCategory: String = Enums.categories.History.rawValue {
        didSet { poiTableView.reloadData() }
    }
    //TODO: For Testing... Refactor with initalLocation from user!
    var userLocation = CLLocationCoordinate2D(latitude: 40.7489288, longitude: -73.9869172)
    
    var selectedRoute: Route?
    var currentLegRoute: Route?

    var nextStopIndex = 0 {
        didSet {
            guard let waypointCount = selectedRoute?.routeOptions.waypoints.count else {return}
            if nextStopIndex > waypointCount {
                nextStopIndex = 0
            }
        }
    }
    
    var modeOfTransit = MBDirectionsProfileIdentifier.automobile {
        didSet{
            getSelectedRoute(navigationType: modeOfTransit)
        }
    }
    
    var halfScreenSliderViewConstraints: NSLayoutConstraint?
    var closedSliderViewConstraints: NSLayoutConstraint?
    var fullScreenSliderViewConstraints: NSLayoutConstraint?
    
    var mapViewTopConstraint: NSLayoutConstraint?
    var mapViewBottomConstraintHalf: NSLayoutConstraint?
    var mapViewBottomConstraintClosed: NSLayoutConstraint?
    
    var sliderViewState: Enums.sliderViewStates = .halfOpen
    let sliderViewHeight: CGFloat = 900

    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        addSubviews()
        mapView.delegate = self
        
        poiTableView.dataSource = self
        poiTableView.delegate = self
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self

        setBikeButtonConstraints()
        setCarButtonConstraints()
        setWalkButtonConstraints()
        addSliderViewSubViews()
        addSliderViewConstraints()
        
        loadGestures()
        
        self.startNavigationButton.addTarget(self, action: #selector(startNavigationButtonPressed), for: .touchUpInside)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        categoriesCollectionView.showsHorizontalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addConstraints()
        getSelectedRoute(navigationType: modeOfTransit)
    }
    
    //MARK: -PRIVATE FUNCTIONS
    

    //MARK: -OBJ-C FUNCTIONS
    @objc func handleSelectingModeOfTransportation(sender:UIButton) {
        switch sender.tag{
        case 0:
            modeOfTransit = .automobile
        case 1:
            modeOfTransit = .cycling
        case 2:
            modeOfTransit = .walking
        default :
            return
        }
    }
    
}
