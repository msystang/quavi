//
//  SliderView.swift
//  quavi
//
//  Created by Alex 6.1 on 2/13/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class SliderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
    }

}
