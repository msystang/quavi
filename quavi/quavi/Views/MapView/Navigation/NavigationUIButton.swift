//
//  NavigationUIButton.swift
//  quavi
//
//  Created by Alex 6.1 on 2/13/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class NavigationUIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        setTitle("GO", for: .normal)
        layer.borderWidth = 2
        layer.cornerRadius = frame.height / 2
        layer.borderColor = #colorLiteral(red: 0.2046233416, green: 0.1999312043, blue: 0.1955756545, alpha: 1)
        layer.borderWidth = 2
        backgroundColor = UIDesign.quaviOrange
        setTitleColor(.white, for: .normal)
        showsTouchWhenHighlighted = true
        
    }
    
}
