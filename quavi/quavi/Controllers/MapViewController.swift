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
    
    lazy var bikeButton:UIButton = {
        let button = UIButton(image: UIImage(named: "bike")!, borderWidth: 2)
        return button
    }()
    
    lazy var carButton:UIButton = {
        let button = UIButton(image: UIImage(systemName: "car")!, borderWidth: 2)
        button.tintColor = .black
        return button
    }()
    
    lazy var walkButton:UIButton = {
        let button = UIButton(image: UIImage(named: "walk")!, borderWidth: 2)
        return button
    }()
    

    
    // TODO: Make Category enum case iterable and load directly, don't need this property. For MVP we can remove enum and get categories directly from the loaded tours.
    let sampleCategoryData: [CategoryData] = [
        CategoryData(name: Enums.categories.History.rawValue),
        CategoryData(name: Enums.categories.Art.rawValue),
        CategoryData(name: Enums.categories.Science.rawValue),
        CategoryData(name: Enums.categories.Religion.rawValue),
        CategoryData(name: Enums.categories.Yeet.rawValue)
    ]
    
    //TODO: Rename constraints to be more specific and indicate state of slider
    var halfScreenSliderViewConstraints: NSLayoutConstraint?
    var closedSliderViewConstraints: NSLayoutConstraint?
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
        getSelectedRoute(navigationType: .walking)
        
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addConstraints()
    }
    
    //MARK: -PRIVATE FUNCTIONS
    

    //TODO: Indicate what button by actual name of button. i.e. if name of button is tvCellSectionButton, name it tvCellSectionButtonPressed()
    //MARK: -OBJ-C FUNCTIONS
    @objc func buttonPressed(sender: UIButton) {
        print(sender.tag)
        if sampleData[sender.tag].isCellExpanded {
            sampleData[sender.tag].isCellExpanded = false
        } else {
            sampleData[sender.tag].isCellExpanded = true
        }
        let incides: IndexSet = [sender.tag]
        poiTableView.reloadSections(incides, with: .fade)
    }
    
    
    
}
