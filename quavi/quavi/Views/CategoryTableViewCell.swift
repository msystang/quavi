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
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
