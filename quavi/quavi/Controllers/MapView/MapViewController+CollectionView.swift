//
//  MapViewController+CollectionView.swift
//  quavi
//
//  Created by Alex 6.1 on 2/13/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension MapViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toursForCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tour = toursForCategory[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.tourCell.rawValue, for: indexPath) as? TourCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setUpCells(cell: cell, data: tour.name)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect(x: 50, y: 50, width:  50, height: 45))
        label.text = toursForCategory[indexPath.row].name
        label.sizeToFit()
        return CGSize(width: label.frame.width, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTour = toursForCategory[indexPath.row]
        self.selectedTour = selectedTour
        
        self.loadPOIs(for: selectedTour)
        
    }
    
}



