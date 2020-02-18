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
    var modeOfTransit = MBDirectionsProfileIdentifier.automobile{
        didSet{
            getSelectedRoute(navigationType: modeOfTransit)
        }
    }
    
    // MARK: - VIEWS
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    lazy var mapView = MapView(frame: view.bounds)
    let sliderView = SliderView()
    lazy var poiTableView = QuaviTableView()
    lazy var categoriesCollectionView = CollectionView(frame: view.bounds)
    var startNavigationButton = NavigationUIButton()
    
    var sliderViewState: Enums.sliderViewStates = .halfOpen
    
    var scrollViewTopAnchor: NSLayoutConstraint?
    var scrollViewBottomAnchor: NSLayoutConstraint?
    
    let sliderViewHeight: CGFloat = 900
    
    
    lazy var chevronArrows: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "minus")
        image.tintColor = .gray
        image.isUserInteractionEnabled = true
        return image
    }()
    
    lazy var bikeButton: UIButton = {
        let button = UIButton(image: UIImage(named: "bike")!, borderWidth: 2, tag: 1)
        button.addTarget(self, action: #selector(handleSelectingModeOfTransportation(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var carButton: UIButton = {
        let button = UIButton(image: UIImage(named: "car")!, borderWidth: 2, tag: 0)
        button.addTarget(self, action: #selector(handleSelectingModeOfTransportation(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var walkButton: UIButton = {
        let button = UIButton(image: UIImage(named: "walk")!, borderWidth: 2, tag: 2)
        button.addTarget(self, action: #selector(handleSelectingModeOfTransportation(sender:)), for: .touchUpInside)
        return button
    }()
    
    
    // TODO: Make Category enum case iterable and load directly, don't need this property. For MVP we can remove enum and get categories directly from the loaded tours.
    let sampleCategoryData: [CategoryData] = [
        CategoryData(name: .History),
        CategoryData(name: .Art),
        CategoryData(name: .Science),
        CategoryData(name: .Religion),
        CategoryData(name: .Yeet)
    ]
    
    
    var currentSelectedCategory: Enums.categories = .History {
        didSet { poiTableView.reloadData() }
    }
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        addSubviews()
        configureScrollView()
        
        configureDelegates()
        getSelectedRoute(navigationType: modeOfTransit)
        
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
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        //scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewTopAnchor = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        scrollViewTopAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 600)
        ])
        
    }
    
    func configureDelegates() {
        mapView.delegate = self
        
        poiTableView.dataSource = self
        poiTableView.delegate = self
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
    }
    
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
