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
        return sampleCategoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category: Enums.categories = .History
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



