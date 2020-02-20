//
//  OnBoarding.swift
//  quavi
//
//  Created by Mr Wonderful on 2/20/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class OnBoarding: UIView {
    
    //MARK: -- properties
    weak var delegate:QuaviOnBoardingDelegate?
    weak var dataSource:QuaviOnBoardingDataSource?
    weak var onBoardingOverlay:QuaviOnboardOverlay?
    var pageCount = 0
    
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
        configureScrollView()
        setUpAllPages()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -- private func
    //MARK: -- set up all pages of the onBoarding views 6
    private func setUpAllPages() {
        // un wrap the dataSource
        if let dataSource = dataSource{
            //get the count of pages from the dataSource when provided
            pageCount = dataSource.quaviOnboardNumberOfPages(self)
            // loop through the amount of count to populate the data for each page from the dataSource provided
            for index in 0..<pageCount{
                if let eachView = dataSource.quaviOnboardPageForIndex(self, index: index) {
                    if let color = dataSource.quaviOnboardBackgroundColorFor(self, atIndex: index){
                        eachView.backgroundColor = color
                    // add to scroll view subview
                    containerView.addSubview(eachView)
                    // Create a frame to fit each view for there index by multiplying the frame by the amount of views it has
                    var viewFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                    viewFrame.origin.x = self.frame.width * CGFloat(index)
                    eachView.frame = viewFrame
                }
                }
            }
            // this resizes the container ScrollView to be able to scroll to all the pages added.. Although all the views are on the screen, we wont be able to scroll to see see them.
              containerView.contentSize = CGSize(width: self.frame.width * CGFloat(pageCount), height: self.frame.height)
        }
    }
    //MARK: -- Private constraints
    private func configureScrollView() {
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: self.topAnchor), containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor), containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor), containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
