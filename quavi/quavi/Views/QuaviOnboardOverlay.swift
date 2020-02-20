//
//  QuaviOnboardOverlay.swift
//  quavi
//
//  Created by Mr Wonderful on 2/20/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class QuaviOnboardOverlay:UIView {
    //MARK: -- objects
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        return pageControl
    }()
    
    open var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.contentHorizontalAlignment = .center
        button.showsTouchWhenHighlighted = true
        button.isHidden = true
        button.isEnabled = false
        return button
    }()
    
    open var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.contentHorizontalAlignment = .center
        button.showsTouchWhenHighlighted = true
        return button
    }()
    
    open var prevLabel: UILabel = {
        let label = UILabel()
        label.text = "Prev"
        return label
    }()
    
    open var nextLabel: UILabel = {
        let label = UILabel()
        label.text = "Next"
        return label
    }()
}
