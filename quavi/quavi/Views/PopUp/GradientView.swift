//
//  GradientView.swift
//  quavi
//
//  Created by Alex 6.1 on 2/28/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    var startColor: UIColor = .white
    var endColor: UIColor = .white
    
    override class var layerClass: AnyClass{
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
    }
}
