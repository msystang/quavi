//
//  TourCategoryCollectionViewCell.swift
//  quavi
//
//  Created by Alex 6.1 on 2/24/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class TourCategoryCollectionViewCell: UICollectionViewCell {
    //MARK: -- Object Properties
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Light", size: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .systemYellow
        self.addSubview(categoryLabel)
        setUpConstraints()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:-- Private constraints
    private func setUpConstraints() {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
    }
    
    func setUpCells(cell: TourCategoryCollectionViewCell, data: String) {
        self.categoryLabel.text = data
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.height/2
    }
}
