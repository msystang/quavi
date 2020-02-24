//
//  CategoryTableViewCell.swift
//  quavi
//
//  Created by Mr Wonderful on 2/24/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    lazy var categoryLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    lazy var chevronIcon:UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "chevron.right")
        icon.tintColor = .black
        return icon
    }()
    
    lazy var containerView:UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        constraintContainerView()
        constaintChevronIcon()
        constraintCategoryLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func constraintContainerView() {
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor), containerView.topAnchor.constraint(equalTo: self.topAnchor), containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor), containerView.widthAnchor.constraint(equalToConstant:  self.frame.width * 0.25)]
        )}
    
    private func constaintChevronIcon() {
        self.addSubview(chevronIcon)
        chevronIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([chevronIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10), chevronIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor), chevronIcon.widthAnchor.constraint(equalToConstant: 40), chevronIcon.heightAnchor.constraint(equalToConstant: 40)])
    }
    
    private func constraintCategoryLabel() {
        self.addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([categoryLabel.topAnchor.constraint(equalTo: self.topAnchor), categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor), categoryLabel.leadingAnchor.constraint(equalTo: containerView.trailingAnchor), categoryLabel.trailingAnchor.constraint(equalTo: chevronIcon.leadingAnchor)])
    }
}
