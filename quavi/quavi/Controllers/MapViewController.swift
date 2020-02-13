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
// TODO: Create new file and instantiante a view. Put UI properties into a view in separate file and reference it here. Refactor constraints to reference view. MapViewController+UIObjects
    
    var sampleData = POI.pointsOfinterest
    
    // MARK: - Lazy UI Variables
    lazy var mapView: NavigationMapView = {
        // TODO: Refactor code, see what makes sense to go here
        let mapView = NavigationMapView(frame: view.bounds)
        mapView.styleURL = MGLStyle.darkStyleURL
        mapView.delegate = self
        mapView.setUserTrackingMode(.followWithCourse, animated: true, completionHandler: nil)
        mapView.tintColor = .yellow
        mapView.showsUserLocation = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return mapView
    }()
    
    lazy var sliderView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var poiTableView = QuaviTableView()
    
    lazy var chevronArrows: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "minus")
        image.tintColor = .gray
        image.isUserInteractionEnabled = true
        return image
    }()
    
    lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: Enums.cellIdentifiers.categoryCell.rawValue)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    //TODO:- Adds image to button
    lazy var startNavigationButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setTitle("GO", for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderColor = #colorLiteral(red: 0.2046233416, green: 0.1999312043, blue: 0.1955756545, alpha: 1)
        button.layer.borderWidth = 2
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(startNavigationButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Internal Properties
    var selectedRoute: Route?
    
    // TODO: Make Category enum case iterable and load directly, don't need this property. For MVP we can remove enum and get categories directly from the loaded tours.
    let sampleCategoryData: [CategoryData] = [
        CategoryData(name: Enums.categories.History.rawValue),
        CategoryData(name: Enums.categories.Art.rawValue),
        CategoryData(name: Enums.categories.Science.rawValue),
        CategoryData(name: Enums.categories.Religion.rawValue),
        CategoryData(name: Enums.categories.Yeet.rawValue)
    ]
    
    //TODO: Rename constraints to be more specific and indicate state of slider
    var sliderViewTopConstraints: NSLayoutConstraint?
    var newSliderViewTopConstraints: NSLayoutConstraint?
    var fullScreenSliderViewConstraints: NSLayoutConstraint?
    
    var mapViewBottomConstraintHalf: NSLayoutConstraint?
    var mapViewBottomConstraintClosed: NSLayoutConstraint?
    
    var sliderViewState: Enums.sliderViewStates = .halfOpen
    let sliderViewHeight: CGFloat = 900
    
    var currentSelectedCategory: String = Enums.categories.History.rawValue {
        didSet {
            poiTableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        addSubviews()
        getSelectedRoute()
        
        poiTableView.dataSource = self
        poiTableView.delegate = self
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        addSliderViewSubViews()
        addSliderViewConstraints()
        loadGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addConstraints()
        
    }
    
    //MARK: -PRIVATE FUNCTIONS
    
    //TODO: Add to constraints extension file
    private func addSliderViewSubViews() {
        view.addSubview(sliderView)
        sliderView.addSubview(chevronArrows)
        sliderView.addSubview(categoriesCollectionView)
        sliderView.addSubview(poiTableView)
    }
    
    //TODO: Add to constraints extension file
    private func addSliderViewConstraints() {
        constrainSliderView()
        constrainChevronImage()
        constrainCategoriesCollectionView()
        constrainPOITableView()
    }
    
    //TODO: Create extension of MapViewController file called MapViewController+SliderView and add anything related to that file
    private func loadGestures() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeDown.direction = .down
        self.sliderView.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.sliderView.addGestureRecognizer(swipeUp)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        self.chevronArrows.addGestureRecognizer(tap)
    }
    
    func directionOfChevron(state: Enums.sliderViewStates) {
        
        switch state {
        case .halfOpen:
            self.chevronArrows.image = UIImage(systemName: "minus")
        case .fullOpen:
            self.chevronArrows.image = UIImage(systemName: "chevron.compact.down")
        case .closed:
            self.chevronArrows.image = UIImage(systemName: "chevron.compact.up")
            
        }
    }

    //TODO: add to constraints extension
    private func createSliderViewConstraints() {
        sliderViewTopConstraints = sliderView.topAnchor.constraint(equalTo: view.bottomAnchor, constant:  -sliderViewHeight + 450)
        sliderViewTopConstraints?.isActive = true

        newSliderViewTopConstraints = sliderView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -65)
        newSliderViewTopConstraints?.isActive = false

        fullScreenSliderViewConstraints = sliderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        fullScreenSliderViewConstraints?.isActive = false
        
        mapViewBottomConstraintHalf = mapView.bottomAnchor.constraint(equalTo: sliderView.topAnchor,constant: 75)
        mapViewBottomConstraintHalf?.isActive = true
        
        mapViewBottomConstraintClosed = mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        mapViewBottomConstraintClosed?.isActive = false
    }
    
    private func setFullOpenSliderViewConstraints() {
        fullScreenSliderViewConstraints?.isActive = true
        sliderViewTopConstraints?.isActive = false
        newSliderViewTopConstraints?.isActive = false
    }
    
    private func setHalfOpenSliderViewConstraints() {
        mapViewBottomConstraintHalf?.isActive = true
        mapViewBottomConstraintClosed?.isActive = false
        fullScreenSliderViewConstraints?.isActive = false
        sliderViewTopConstraints?.isActive = true
        newSliderViewTopConstraints?.isActive = false
    }
    
    private func setClosedSliderViewConstraints() {
        mapViewBottomConstraintHalf?.isActive = false
        mapViewBottomConstraintClosed?.isActive = true
        fullScreenSliderViewConstraints?.isActive = false
        sliderViewTopConstraints?.isActive = false
        newSliderViewTopConstraints?.isActive = true
    }
    
    //TODO: Create extension of MapViewController file called MapViewController+CollectionView and add anything related to that file
    private func handleCollectionViewCellPressed(item: Int) {
        if item == 0 {
            currentSelectedCategory = Enums.categories.History.rawValue
        } else if item == 1 {
            currentSelectedCategory = Enums.categories.Art.rawValue
        } else if item == 2 {
            currentSelectedCategory = Enums.categories.Science.rawValue
        } else if item == 3 {
            currentSelectedCategory = Enums.categories.Religion.rawValue
        } else if item == 4 {
            currentSelectedCategory = Enums.categories.Yeet.rawValue
        }
    }
    
    //TODO: Move to slider view extension file
    //MARK: -RESPOND TO GESTURE
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        print(gesture)
        
        if let tapGesture = gesture as? UITapGestureRecognizer {
            print("tapped")
            switch tapGesture.numberOfTouches {
            case 1:
                print("one tap")
                
                
                sliderViewState = .halfOpen
                
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
                    self?.setHalfOpenSliderViewConstraints()
                    self?.directionOfChevron(state: .halfOpen)
                    self?.view.layoutIfNeeded()
                    self?.sliderView.alpha = 1.0
                    self?.poiTableView.alpha = 1.0
                    self?.categoriesCollectionView.alpha = 1.0
                    }, completion: nil)
            case 2:
                print("two tap")
            default:
                print("dunno know")
            }
            
        }
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.down:
                print("Swiped down")
                
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
                    
                    switch self?.sliderViewState {
                    case .fullOpen:
                        self?.setHalfOpenSliderViewConstraints()
                        self?.sliderViewState = .halfOpen
                    case .halfOpen:
                        self?.setClosedSliderViewConstraints()
                        self?.sliderViewState = .closed
                    case .closed:
                        print("it's already closed")
                    case .none:
                        return
                    }
                    
                    if self?.sliderViewState == .closed {
                        self?.directionOfChevron(state: .closed)
                    } else if self?.sliderViewState == .halfOpen {
                        self?.directionOfChevron(state: .halfOpen)
                    } else if self?.sliderViewState == .fullOpen {
                        self?.directionOfChevron(state: .fullOpen)
                    }
                    self?.view.layoutIfNeeded()
                    
                    if self?.sliderViewState == .closed {
                        self?.sliderView.alpha = 0.5
                        self?.poiTableView.alpha = 0
                        self?.categoriesCollectionView.alpha = 0
                    }
                    
                    }, completion: nil)
                
            case UISwipeGestureRecognizer.Direction.up:
                print("Swiped Up")
                
                
                
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
                    
                    switch self?.sliderViewState {
                    case .fullOpen:
                        print("it's fully opened")
                    case .halfOpen:
                        self?.setFullOpenSliderViewConstraints()
                        self?.sliderViewState = .fullOpen
                    case .closed:
                        self?.setHalfOpenSliderViewConstraints()
                        self?.sliderViewState = .halfOpen
                    case .none:
                        return
                    }
                    
                    if self?.sliderViewState == .closed {
                        self?.directionOfChevron(state: .closed)
                    } else if self?.sliderViewState == .halfOpen {
                        self?.directionOfChevron(state: .halfOpen)
                    } else if self?.sliderViewState == .fullOpen {
                        self?.directionOfChevron(state: .fullOpen)
                    }
                    self?.view.layoutIfNeeded()
                    
                    self?.sliderView.alpha = 1.0
                    self?.poiTableView.alpha = 1.0
                    self?.categoriesCollectionView.alpha = 1.0
                    }, completion: nil)
                
            default:
                break
            }
            
        }
        
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
    
    
    //TODO: Add to constraints file, specific for the sliderView, collectionView, or TableView (indicate with MARK)
    //MARK: -CONSTRAINTS
    private func constrainSliderView() {
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([sliderView.leadingAnchor.constraint(equalTo: view.leadingAnchor), sliderView.trailingAnchor.constraint(equalTo: view.trailingAnchor), sliderView.heightAnchor.constraint(equalToConstant: sliderViewHeight)])
        createSliderViewConstraints()
    }
    
    
    private func constrainPOITableView() {
        NSLayoutConstraint.activate([
            poiTableView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 10),
            poiTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            poiTableView.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor),
            poiTableView.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor)
        ])
    }
    
    private func constrainChevronImage() {
        chevronArrows.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chevronArrows.topAnchor.constraint(equalTo: sliderView.topAnchor, constant: 10),
            chevronArrows.centerXAnchor.constraint(equalTo: sliderView.centerXAnchor),
            chevronArrows.bottomAnchor.constraint(equalTo: categoriesCollectionView.topAnchor, constant: -10),
            chevronArrows.widthAnchor.constraint(equalToConstant: 40),
            chevronArrows.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func constrainCategoriesCollectionView() {
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoriesCollectionView.topAnchor.constraint(equalTo: chevronArrows.bottomAnchor, constant: 10),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor),
            categoriesCollectionView.bottomAnchor.constraint(equalTo: poiTableView.topAnchor, constant: -10),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }



}



//TODO: Make file extension of MapViewController named MapViewController+CollectionView
extension MapViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sampleCategoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = sampleCategoryData[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Enums.cellIdentifiers.categoryCell.rawValue, for: indexPath) as? CategoriesCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setUpCells(cell: cell, data: category)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleCollectionViewCellPressed(item: indexPath.item)
        print(currentSelectedCategory)
        
    }
    
}


