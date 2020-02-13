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
    
    // MARK: - VIEWS
    lazy var mapView = MapView(frame: view.bounds)
    let sliderView = SliderView()
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
    lazy var startNavigationButton: UIButton = {
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
        mapView.delegate = self
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


