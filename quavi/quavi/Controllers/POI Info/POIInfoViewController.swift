//
//  POIInfoViewController.swift
//  quavi
//
//  Created by Mr Wonderful on 2/11/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class POIInfoViewController: UIViewController {
    
    //MARK:-- Properties
     var viewArray:[UIView]!
    
    //MARK:-- Objects
    lazy var continueButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderColor = #colorLiteral(red: 0.2046233416, green: 0.1999312043, blue: 0.1955756545, alpha: 1)
        button.layer.borderWidth = 3
        button.addTarget(self, action: #selector(continueButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var easterEggButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.setTitle("Find the egg", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderColor = #colorLiteral(red: 0.2046233416, green: 0.1999312043, blue: 0.1955756545, alpha: 1)
        button.layer.borderWidth = 1
        return button
    }()
    
    lazy var containerView:UIScrollView = {
        let view = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.95, height: self.view.frame.height * 0.70))
        view.isPagingEnabled = true
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.bounces = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        return view
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.hidesForSinglePage = true
        pc.pageIndicatorTintColor = .blue
        pc.currentPageIndicatorTintColor = .red
        return pc
    }()
    
    lazy var view1:UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var view2:UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var view3:UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    //MARK:-- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setBackgroundColor()
        continueButtonConstraints()
        easterEggButtonConstraints()
        containerViewConstraints()
        pageControlConstraints()
        assignViewsToArray()
        populateContainerView()
    }
    
    //MARK:--@objc func
    @objc func continueButtonPressed(_ sender: Any) {
           
       }
    
    //MARK:-- Private func
    private func setBackgroundColor(){
        view.backgroundColor = .white
    }
    
    private func assignViewsToArray() {
        viewArray = [view1, view2, view3]
    }
    
   private func populateContainerView() {
        if let viewArray = viewArray{
            pageControl.numberOfPages = viewArray.count
            for (index, view) in viewArray.enumerated(){
                let xPosition:CGFloat = self.containerView.frame.width * CGFloat(index)
                view.frame = CGRect(x: xPosition, y: 0, width: containerView.frame.width, height: containerView.frame.height)
                
                containerView.contentSize.width = containerView.frame.width * CGFloat(index + 1)
                containerView.addSubview(view)
            }
        }
    }
}

extension POIInfoViewController: UIScrollViewDelegate{
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
                   pageControl.currentPage = Int(page)
    }
}
