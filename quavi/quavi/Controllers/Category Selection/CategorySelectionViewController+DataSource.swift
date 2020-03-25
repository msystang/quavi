//
//  CategorySelectionViewController+DataSource.swift
//  quavi
//
//  Created by Mr Wonderful on 2/25/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension CategorySelectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.categoryCell.rawValue, for: indexPath) as? CatergoryCollectionViewCell else {return UICollectionViewCell()}
        
        let category = categories[indexPath.row]
    
        cell.categoryLabel.text = category
        //cell.amountOfTourLabel.text = String(tourCountForCategory[indexPath.row])
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIDesign.quaviOrange.cgColor
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        let mapVC = MapViewController()
        
        let toursForCaregory = allTours.filter { (tour) -> Bool in
            tour.category == category
        }
        
        mapVC.toursForCategory = toursForCaregory
        navigationController?.pushViewController(mapVC, animated: true)
    }
}

extension CategorySelectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        let virticalCellCGSize = CGSize(width: (collectionView.frame.size.width - 20), height: collectionView.frame.size.height / 6)
        return virticalCellCGSize
    }
}

