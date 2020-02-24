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
        view.backgroundColor = #colorLiteral(red: 0.2890303433, green: 0.6429604888, blue: 0.8375045061, alpha: 1)
        return view
    }()
    
    //MARK: Lifecycle
    override init (frame:CGRect){
        super.init(frame:UIScreen.main.bounds)
        constraintContainerView()
        constaintChevronIcon()
        constraintCategoryLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- private func
    private func constraintContainerView() {
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor), containerView.topAnchor.constraint(equalTo: self.topAnchor), containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor), containerView.widthAnchor.constraint(equalToConstant:  self.frame.width * 0.25)]
        )}
    
    private func constaintChevronIcon() {
        self.addSubview(chevronIcon)
        chevronIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([chevronIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10), chevronIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor), chevronIcon.widthAnchor.constraint(equalToConstant: 20), chevronIcon.heightAnchor.constraint(equalToConstant: 20)])
    }
    
    private func constraintCategoryLabel() {
        self.addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([categoryLabel.topAnchor.constraint(equalTo: self.topAnchor), categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor), categoryLabel.leadingAnchor.constraint(equalTo: containerView.trailingAnchor), categoryLabel.trailingAnchor.constraint(equalTo: chevronIcon.leadingAnchor)])
    }
}
