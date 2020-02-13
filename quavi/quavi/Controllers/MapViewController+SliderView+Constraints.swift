//
//  MapViewController+SliderView+Constraints.swift
//  quavi
//
//  Created by Alex 6.1 on 2/13/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//
import UIKit

extension MapViewController {
    
    func addSliderViewSubViews() {
        view.addSubview(sliderView)
        sliderView.addSubview(chevronArrows)
        sliderView.addSubview(categoriesCollectionView)
        sliderView.addSubview(poiTableView)
    }
    
    func addSliderViewConstraints() {
        constrainSliderView()
        constrainChevronImage()
        constrainCategoriesCollectionView()
        constrainPOITableView()
    }
    
    func createSliderViewConstraints() {
        halfScreenSliderViewConstraints = sliderView.topAnchor.constraint(equalTo: view.bottomAnchor, constant:  -sliderViewHeight + 450)
        halfScreenSliderViewConstraints?.isActive = true

        closedSliderViewConstraints = sliderView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
        closedSliderViewConstraints?.isActive = false

        fullScreenSliderViewConstraints = sliderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        fullScreenSliderViewConstraints?.isActive = false
        
        mapViewBottomConstraintHalf = mapView.bottomAnchor.constraint(equalTo: sliderView.topAnchor,constant: 75)
        mapViewBottomConstraintHalf?.isActive = true
        
        mapViewBottomConstraintClosed = mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        mapViewBottomConstraintClosed?.isActive = false
    }
    
    func setFullOpenSliderViewConstraints() {
        fullScreenSliderViewConstraints?.isActive = true
        halfScreenSliderViewConstraints?.isActive = false
        closedSliderViewConstraints?.isActive = false
    }
    
    func setHalfOpenSliderViewConstraints() {
        mapViewBottomConstraintHalf?.isActive = true
        mapViewBottomConstraintClosed?.isActive = false
        fullScreenSliderViewConstraints?.isActive = false
        halfScreenSliderViewConstraints?.isActive = true
        closedSliderViewConstraints?.isActive = false
    }
    
    func setClosedSliderViewConstraints() {
        mapViewBottomConstraintHalf?.isActive = false
        mapViewBottomConstraintClosed?.isActive = true
        fullScreenSliderViewConstraints?.isActive = false
        halfScreenSliderViewConstraints?.isActive = false
        closedSliderViewConstraints?.isActive = true
    }
    
    //MARK: -CONSTRAINTS
    func constrainSliderView() {
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([sliderView.leadingAnchor.constraint(equalTo: view.leadingAnchor), sliderView.trailingAnchor.constraint(equalTo: view.trailingAnchor), sliderView.heightAnchor.constraint(equalToConstant: sliderViewHeight)])
        createSliderViewConstraints()
    }
    
    
    func constrainPOITableView() {
        NSLayoutConstraint.activate([
            poiTableView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 10),
            poiTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            poiTableView.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor),
            poiTableView.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor)
        ])
    }
    
    func constrainChevronImage() {
        chevronArrows.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chevronArrows.topAnchor.constraint(equalTo: sliderView.topAnchor, constant: 10),
            chevronArrows.centerXAnchor.constraint(equalTo: sliderView.centerXAnchor),
            chevronArrows.bottomAnchor.constraint(equalTo: categoriesCollectionView.topAnchor, constant: -10),
            chevronArrows.widthAnchor.constraint(equalToConstant: 40),
            chevronArrows.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func constrainCategoriesCollectionView() {
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
