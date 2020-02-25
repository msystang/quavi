//
//  CategorySelectionViewController+Delegate.swift
//  quavi
//
//  Created by Mr Wonderful on 2/25/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

//MARK: -- Extension
extension CategorySelectionViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let transformation = CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
        cell.layer.transform = transformation
        cell.alpha = 0.0

        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
}
