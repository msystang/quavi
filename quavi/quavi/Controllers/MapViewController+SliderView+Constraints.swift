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
        contentView.addSubview(sliderView)
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

    
    //MARK: -CONSTRAINTS
    func constrainSliderView() {
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sliderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 200),
            sliderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sliderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sliderView.heightAnchor.constraint(equalToConstant: sliderViewHeight)])
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
    
    func constrainTVSectionArrow(button: UIButton, sectionHeaderArrows:UIImageView) {
        sectionHeaderArrows.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionHeaderArrows.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -10),
            sectionHeaderArrows.topAnchor.constraint(equalTo: button.topAnchor, constant: button.frame.height/2),
            sectionHeaderArrows.heightAnchor.constraint(equalToConstant: 25),
            sectionHeaderArrows.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
}
