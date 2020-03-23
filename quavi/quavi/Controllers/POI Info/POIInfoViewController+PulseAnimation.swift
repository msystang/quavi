//
//  POIInfoViewController+PulseAnimation.swift
//  quavi
//
//  Created by Mr Wonderful on 2/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension POIInfoViewController {
    //Creates shapeLayer pulse radius around object
    func createPulse(){
        let position = quaviLogo.frame.size.width / 2
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 16, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.7416164279, green: 0.5822635889, blue: 0.9156076312, alpha: 1)
        shapeLayer.lineWidth = 30.0
        shapeLayer.lineCap = .round
        shapeLayer.position = CGPoint(x: position, y: position)
        quaviLogo.layer.addSublayer(shapeLayer)
        animatePulse(layer: shapeLayer)
    }
    
    //Adds pulse animation to the shapelayer
    func animatePulse(layer:CAShapeLayer){
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 2.0
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        scaleAnimation.repeatCount = .greatestFiniteMagnitude
        layer.add(scaleAnimation, forKey: "scale")
        addOpacity(layer: layer)
    }
    
    //Adds opacity to the shapelayer pulse
    func addOpacity(layer:CAShapeLayer){
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.duration = 2.0
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        opacityAnimation.repeatCount = .greatestFiniteMagnitude
        layer.add(opacityAnimation, forKey: "opacity")
    }
}
