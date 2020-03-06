//
//  NSLayoutConstraints+Extentsions.swift
//  quavi
//
//  Created by Alex 6.1 on 2/28/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.

//SOURCE: https://github.com/dkw5877/FunWithParticleEmitters

import UIKit.NSLayoutConstraint

extension NSLayoutConstraint {
    
    class func pin(view:UIView, to superview:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor),
            view.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
