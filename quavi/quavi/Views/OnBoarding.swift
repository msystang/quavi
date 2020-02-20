//
//  OnBoarding.swift
//  quavi
//
//  Created by Mr Wonderful on 2/20/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class OnBoarding: UIView {
     //MARK: -- Objects
    lazy var containerView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Private constraints
    private func configureScrollView() {
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: self.topAnchor), containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor), containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor), containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
