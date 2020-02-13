//
//  File.swift
//  quavi
//
//  Created by Sunni Tang on 1/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

// Custom UIButton extension used to design the car, bike and walk button
extension UIButton{
    convenience init(image:UIImage, borderWidth:CGFloat){
        self.init()
        self.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.layer.cornerRadius = self.frame.height / 2
        self.contentMode = .center
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        self.setBackgroundImage(image, for: .normal)
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor.white.cgColor
        self.alpha = 0.5
        self.showsTouchWhenHighlighted = true
    }
}
