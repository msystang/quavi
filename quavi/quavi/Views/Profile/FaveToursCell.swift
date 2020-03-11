//
//  FaveToursCell.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class FaveToursCell: UITableViewCell {

    //MARK: - Lazy Properties
    lazy var tourImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "location.fill")
        image.tintColor = .black
        return image
    }()
    
    lazy var tourName: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubviews()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    
    func setUpSubviews(){
        contentView.addSubview(tourImage)
        contentView.addSubview(tourName)
    }
    
    func setUpConstraints() {
        constrainTourImage()
        constrainTourLabel()
    }
    
    //MARK: - Constraints
    
    func constrainTourImage() {
        tourImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tourImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            tourImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tourImage.heightAnchor.constraint(equalToConstant: 70),
            tourImage.widthAnchor.constraint(equalToConstant: 70)
        ])
    }

    
    func constrainTourLabel() {
        tourName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tourName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            tourName.leadingAnchor.constraint(equalTo: tourImage.trailingAnchor, constant: 10),
            tourName.heightAnchor.constraint(equalToConstant: 20),
            tourName.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
}
