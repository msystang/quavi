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
        view.addSubview(categoriesCollectionView)
        sliderView.addSubview(poiTableView)
    }
    
    func addSliderViewConstraints() {
        constrainSliderView()
        constrainChevronImage()
        constrainCategoriesCollectionView()
        constrainPOITableView()
    }
    
    func createSliderViewConstraints() {
        mapViewBottomConstraintHalf = mapView.bottomAnchor.constraint(equalTo: sliderView.topAnchor,constant: 275)
        halfScreenSliderViewConstraints = sliderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -390)
        NSLayoutConstraint.activate([mapViewBottomConstraintHalf!,halfScreenSliderViewConstraints!])
        
        mapViewBottomConstraintClosed = mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        closedSliderViewConstraints = sliderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        fullScreenSliderViewConstraints = sliderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 95)
        NSLayoutConstraint.deactivate([mapViewBottomConstraintClosed!,closedSliderViewConstraints!, fullScreenSliderViewConstraints! ])
    }
    
    func setFullOpenSliderViewConstraints() {
        fullScreenSliderViewConstraints?.isActive = true
        halfScreenSliderViewConstraints?.isActive = true
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
        
        NSLayoutConstraint.activate([
            sliderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sliderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sliderView.heightAnchor.constraint(equalToConstant: sliderViewHeight)
        ])
        createSliderViewConstraints()
    }
    
    
    func constrainPOITableView() {
        NSLayoutConstraint.activate([
            poiTableView.topAnchor.constraint(equalTo: chevronArrows.bottomAnchor, constant: 10),
            poiTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            poiTableView.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor),
            poiTableView.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor)
        ])
    }
    
    func constrainChevronImage() {
        chevronArrows.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chevronArrows.topAnchor.constraint(equalTo: sliderView.topAnchor, constant: 5),
            chevronArrows.centerXAnchor.constraint(equalTo: sliderView.centerXAnchor),
            chevronArrows.widthAnchor.constraint(equalToConstant: 40),
            chevronArrows.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func constrainCategoriesCollectionView() {
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoriesCollectionView.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor),
            categoriesCollectionView.bottomAnchor.constraint(equalTo: sliderView.topAnchor, constant: -15),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func constrainTVSectionArrow(button: UIButton, sectionHeaderArrows:UIImageView) {
        sectionHeaderArrows.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionHeaderArrows.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -10),
            sectionHeaderArrows.topAnchor.constraint(equalTo: button.topAnchor, constant: button.frame.height/2),
            sectionHeaderArrows.heightAnchor.constraint(equalToConstant: 25),
            sectionHeaderArrows.widthAnchor.constraint(equalToConstant: 20)
            
            
        ])
    }
    
    func constrainTVSectionImage(button: UIButton, sectionHeaderImage:UIImageView){
        sectionHeaderImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([sectionHeaderImage.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 5), sectionHeaderImage.centerYAnchor.constraint(equalTo: button.centerYAnchor), sectionHeaderImage.heightAnchor.constraint(equalToConstant: 60), sectionHeaderImage.widthAnchor.constraint(equalToConstant: 60)])
    }
}
