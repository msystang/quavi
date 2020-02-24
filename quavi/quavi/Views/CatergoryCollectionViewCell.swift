//
//  CatergoryCollectionViewCell.swift
//  quavi
//
//  Created by Mr Wonderful on 2/24/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class CatergoryCollectionViewCell: UICollectionViewCell {
    //MARK: -- Objects
       lazy var categoryLabel:UILabel = {
           let label = UILabel()
           label.font = UIFont(name: "Verdana-Bold", size: 18)
           label.text = "Category name"
           label.adjustsFontSizeToFitWidth = true
           label.textAlignment = .center
           return label
       }()
       
       lazy var chevronIcon:UIImageView = {
           let icon = UIImageView()
           icon.image = UIImage(systemName: "chevron.compact.right")
           icon.tintColor = .black
           return icon
       }()
       
       lazy var containerView:UIView = {
           let view = UIView()
           view.backgroundColor = .blue
           return view
       }()
}
