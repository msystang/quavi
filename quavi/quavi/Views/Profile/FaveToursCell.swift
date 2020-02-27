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
        image.image = UIImage(systemName: "person")
        return image
    }()
    
    lazy var tourName: UILabel = {
        var label = UILabel()

        return label
    }()
    //MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    
    func setUpSubviews(){
        self.contentView.addSubview(tourImage)
    }
    
    func setUpConstraints() {
        constrainTourImage()
    }
    
    
    //MARK: - Constraints
    
    func constrainTourImage() {
        tourImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tourImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tourImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tourImage.heightAnchor.constraint(equalToConstant: 200),
            tourImage.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
