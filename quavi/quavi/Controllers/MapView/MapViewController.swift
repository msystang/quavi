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
    
    var halfScreenSliderViewConstraints: NSLayoutConstraint?
    var closedSliderViewConstraints: NSLayoutConstraint?
    var fullScreenSliderViewConstraints: NSLayoutConstraint?
    
    var mapViewTopConstraint: NSLayoutConstraint?
    var mapViewBottomConstraintHalf: NSLayoutConstraint?
    var mapViewBottomConstraintClosed: NSLayoutConstraint?
    
    var sliderViewState: Enums.sliderViewStates = .halfOpen
    let sliderViewHeight: CGFloat = 900
    
    var selectedSections = Set<Int>()
    
    // MARK: - Lazy UI Variables
    lazy var mapView = MapView(frame: view.bounds)
    lazy var poiTableView = QuaviTableView()
    lazy var toursCollectionView = CollectionView(frame: view.bounds)
    
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
        button.backgroundColor = .blue
        return button
    }()
    
    lazy var walkButton:UIButton = {
        let button = UIButton(image: UIImage(named: "walk")!, borderWidth: 2, tag: 2)
        button.addTarget(self, action: #selector(handleSelectingModeOfTransportation(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .red
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(handleBackButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Internal Properties
    
    //TODO: For Testing... Refactor with initalLocation from user!
    var userLocation = CLLocationCoordinate2D(latitude: 40.747034, longitude: -73.985096)
    
    var toursForCategory = [Tour]() {
        didSet {
            toursCollectionView.reloadData()
        }
    }
    
    var selectedTour: Tour?
    
    var poiForTour = [POI]() {
        didSet {
            self.poiTableView.reloadData()
            getSelectedRoute(navigationType: modeOfTransit)
            print("Reload poiTBV. poiForTour.count = \(poiForTour.count)")
        }
    }
    
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
            switchTransitButtonState()
        }
    }
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        addSubviews()
        
        setDelegates()
        setDataSources()
        
        setBikeButtonConstraints()
        setCarButtonConstraints()
        setWalkButtonConstraints()
        addSliderViewSubViews()
        addSliderViewConstraints()
        loadGestures()
        
        addTargetToNavigationButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
        addConstraints()
        switchTransitButtonState()
    }
    
    //MARK: - Internal Methods
    func loadPOIs(for tour: Tour) {
        print("Selected tour: \(selectedTour?.name)")
        DispatchQueue.main.async {
            let dispatchGroup = DispatchGroup()
            var poisFromDR = [POI]()
            
            tour.stops.forEach {
                dispatchGroup.enter()
                FirestoreService.manager.getPOI(from: $0) { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                        dispatchGroup.leave()
                    case .success(let poi):
                        dispatchGroup.leave()
                        poisFromDR.append(poi)
                    }
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                self.poiForTour = poisFromDR.sorted { $0.index < $1.index }
            }
        }
    }
    
    //MARK: -PRIVATE FUNCTIONS
    private func setDelegates() {
        mapView.delegate = self
        poiTableView.delegate = self
        toursCollectionView.delegate = self
    }
    
    private func setDataSources() {
        poiTableView.dataSource = self
        toursCollectionView.dataSource = self
    }
    
    private func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func addTargetToNavigationButton() {
        self.startNavigationButton.addTarget(self, action: #selector(startNavigationButtonPressed), for: .touchUpInside)
    }
    
    private func switchTransitButtonState() {
        changeTransitButtonBackgroundColor()
        changeTransitButtonAlpha()
    }
    
    private func changeTransitButtonAlpha() {
        carButton.alpha = modeOfTransit == .automobile ? 1 : 0.5
        walkButton.alpha = modeOfTransit == .walking ? 1 : 0.5
        bikeButton.alpha = modeOfTransit == .cycling ? 1 : 0.5
    }
    
    private func changeTransitButtonBackgroundColor() {
        carButton.backgroundColor = modeOfTransit == .automobile ? UIDesign.quaviOrange : .white
        walkButton.backgroundColor = modeOfTransit == .walking ? UIDesign.quaviOrange : .white
        bikeButton.backgroundColor = modeOfTransit == .cycling ? UIDesign.quaviOrange : .white
    }
    
    //MARK: -OBJ-C FUNCTIONS
    @objc func handleSelectingModeOfTransportation(sender:UIButton) {
        guard selectedRoute != nil else {
            self.showAlert(title: "Quack!", message: "Please select a tour first.")
            return
        }
        
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
    
    @objc func handleBackButtonPressed(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    #warning("delete this and use a delegate to like a POI")
    
    @objc func handleShowingAlert() {
        self.showAlert(title: "Quack!", message: "The like feature is in working progress. Please continue to enjoy all the other features of the app ")
    }
}
