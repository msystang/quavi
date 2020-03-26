//
//  QuaviOnBoardingPage.swift
//  quavi
//
//  Created by Mr Wonderful on 2/20/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class QuaviOnBoardingPage: UIView {
    
    //MARK: -- objects
    lazy var pageTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-BoldMT", size: 30.0)
        label.textColor = .white
        label.text = "Placeholder"
        label.textAlignment = .left
        label.numberOfLines = 1
        //label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    lazy var pageSubTitle: UILabel = {
        let label = UILabel()
        
        label.isHidden = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    lazy var pageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    //MARK: -- init func
    override init(frame: CGRect) {
        super.init(frame: frame)
        pageImageViewConstraint()
        pageTitleConstraint()
        pageSubViewConstraint()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //MARK: -- private func
    private func pageImageViewConstraint() {
        self.addSubview(pageImageView)
        pageImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([pageImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
                                     pageImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
                                     pageImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
                                     pageImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75)])
    }
    
    private func pageTitleConstraint() {
        self.addSubview(pageTitle)
        pageTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([pageTitle.bottomAnchor.constraint(equalTo: pageImageView.topAnchor, constant: 10),
                                     pageTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
                                     pageTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
                                     pageTitle.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    private func pageSubViewConstraint() {
        self.addSubview(pageSubTitle)
        pageSubTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([pageSubTitle.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 5),
                                     pageSubTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
                                     pageSubTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
                                     pageSubTitle.heightAnchor.constraint(equalToConstant: 100)])
    }
}
