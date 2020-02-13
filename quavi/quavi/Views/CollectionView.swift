//
//  CollectionView.swift
//  quavi
//
//  Created by Alex 6.1 on 2/13/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: Enums.cellIdentifiers.categoryCell.rawValue)
        backgroundColor = .clear
    }
}
