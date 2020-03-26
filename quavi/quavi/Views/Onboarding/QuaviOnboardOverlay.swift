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
    
    //TODO:-- remove borderWidth and borderColor
    open var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.contentHorizontalAlignment = .center
        button.showsTouchWhenHighlighted = true
        button.tintColor = UIDesign.quaviLightGrey
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.borderWidth = 1
        return button
    }()
    
    open var prevLabel: UILabel = {
        let label = UILabel()
        label.text = "Prev"
        label.isHidden = false
        return label
    }()
    
    open var nextLabel: UILabel = {
        let label = UILabel()
        label.text = "Next"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        pageControlConstraint()
        continueButtonConstraint()
        skipButtonConstraint()
        prevLabelConstraint()
        nextLabelConstraint()
    }
    
    // this overide func is needed to enable any views that are behind this view.. Since this view is static and is an overlay, access to anything behind it cant be accessed
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews {
            if !subview.isHidden && subview.alpha > 0 && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Private func
    // function to set the amount of pages the controller is to indicate
    func numberOfPages(count:Int){
        pageControl.numberOfPages = count
    }
    
    //func to set the page controllers current page
    func currentPage(index: Int) {
        pageControl.currentPage = index
    }
    
    
    //MARK: -- Private func constraints
    private func pageControlConstraint() {
        self.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([pageControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10), pageControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10), pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20), pageControl.heightAnchor.constraint(equalToConstant: 20)])
    }
    
    private func continueButtonConstraint() {
        self.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continueButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20), continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor), continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor), continueButton.heightAnchor.constraint(equalToConstant: 20)])
    }
    
    private func skipButtonConstraint() {
        self.addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([skipButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20), skipButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30), skipButton.heightAnchor.constraint(equalToConstant: 30), skipButton.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    private func prevLabelConstraint() {
        pageControl.addSubview(prevLabel)
        prevLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([prevLabel.leadingAnchor.constraint(equalTo: pageControl.leadingAnchor), prevLabel.topAnchor.constraint(equalTo: pageControl.topAnchor), prevLabel.heightAnchor.constraint(equalTo: pageControl.heightAnchor), prevLabel.widthAnchor.constraint(equalToConstant: 50)])
    }
    
    private func nextLabelConstraint() {
        pageControl.addSubview(nextLabel)
        nextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([nextLabel.trailingAnchor.constraint(equalTo: pageControl.trailingAnchor), nextLabel.topAnchor.constraint(equalTo: pageControl.topAnchor), nextLabel.heightAnchor.constraint(equalTo: pageControl.heightAnchor), nextLabel.widthAnchor.constraint(equalToConstant: 50)])
    }
}
