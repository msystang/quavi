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
        label.textColor = UIDesign.quaviOrange
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = "Category name"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    lazy var chevronIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "chevron.compact.right")
        icon.tintColor = UIDesign.quaviOrange
        return icon
    }()
    
    lazy var containerView:UIView = {
        let view = UIView()
        view.backgroundColor = UIDesign.quaviOrange
        return view
    }()
    
//    lazy var amountOfTourLabel:UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "Verdana-Bold", size: 50)
//        label.text = "7"
//        label.textColor = .white
//        label.adjustsFontSizeToFitWidth = true
//        label.textAlignment = .center
//        return label
//    }()
//
//
//    lazy var numberOfTourLabel:UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "Verdana-Bold", size: 12)
//        label.text = "# OF TOURS"
//        label.textColor = .white
//        label.adjustsFontSizeToFitWidth = true
//        label.textAlignment = .center
//        return label
//    }()
    
    lazy var numberOfTourLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 12)
        label.text = "# OF TOURS"
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    //MARK: Lifecycle
    override init (frame:CGRect){
        super.init(frame:UIScreen.main.bounds)
        constraintContainerView()
        constaintChevronIcon()
        constraintCategoryLabel()
        constraintNumberOfTourLabel()
        constraintAmountOfTourLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- private func
    private func constraintContainerView() {
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.widthAnchor.constraint(equalToConstant:  self.frame.width * 0.25)]
        )}
    
    private func constraintNumberOfTourLabel() {
        containerView.addSubview(numberOfTourLabel)
        numberOfTourLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([numberOfTourLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
                                     numberOfTourLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
                                     numberOfTourLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
                                     numberOfTourLabel.heightAnchor.constraint(equalToConstant: 30)])
    }
    
    private func constraintAmountOfTourLabel() {
        containerView.addSubview(amountOfTourLabel)
        amountOfTourLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([amountOfTourLabel.topAnchor.constraint(equalTo: numberOfTourLabel.bottomAnchor, constant: -30),
                                     amountOfTourLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                                     amountOfTourLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                                     amountOfTourLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)])
    }
    
    private func constraintCategoryLabel() {
           self.addSubview(categoryLabel)
           categoryLabel.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([categoryLabel.topAnchor.constraint(equalTo: self.topAnchor),
                                        categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                        categoryLabel.leadingAnchor.constraint(equalTo: containerView.trailingAnchor),
                                        categoryLabel.trailingAnchor.constraint(equalTo: chevronIcon.leadingAnchor)])
       }
    
    private func constaintChevronIcon() {
        self.addSubview(chevronIcon)
        chevronIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ chevronIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                                        chevronIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                        chevronIcon.widthAnchor.constraint(equalToConstant: 20),
                                        chevronIcon.heightAnchor.constraint(equalToConstant: 20)])
    }
    
    
}
