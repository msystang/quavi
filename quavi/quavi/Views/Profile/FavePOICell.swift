//
//  FavePOICell.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 3/10/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class FavePOICell: UITableViewCell {

    //MARK: - Lazy Properties
       lazy var poiImage: UIImageView = {
           var image = UIImageView()
           image.image = UIImage(systemName: "location.fill")
           image.tintColor = .black
           return image
       }()
       
       lazy var poiName: UILabel = {
           var label = UILabel()
           label.numberOfLines = 0
        label.text = "blah blah"
           return label
       }()
       
       //MARK: - Inits
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setUpSubviews()
           setUpConstraints()
        self.contentView.backgroundColor = .white
           
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       //MARK: - Functions
       
       func setUpSubviews(){
           self.contentView.addSubview(poiImage)
           self.contentView.addSubview(poiName)
       }
       
       func setUpConstraints() {
           constrainTourImage()
           constrainTourLabel()
       }

       
       //MARK: - Constraints
       
       func constrainTourImage() {
           poiImage.translatesAutoresizingMaskIntoConstraints = false
           
           
           NSLayoutConstraint.activate([
               poiImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
               poiImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
               poiImage.heightAnchor.constraint(equalToConstant: 70),
               poiImage.widthAnchor.constraint(equalToConstant: 70)
           ])
               
       
       }

       
       func constrainTourLabel() {
           poiName.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               poiName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
               poiName.leadingAnchor.constraint(equalTo: self.poiImage.trailingAnchor, constant: 10),
               poiName.heightAnchor.constraint(equalToConstant: 20),
               poiName.widthAnchor.constraint(equalToConstant: 300)
           ])
       }

}
