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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpAllPages()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:-- @objc func
    
    @objc func handlePageControllerTapped(_ sender: UIPageControl) {
        let pageIndex = sender.currentPage
        // calls the goToPage func to animate and present the appropriate view by internally incrementing and decrimenting index
        goToPage(index: pageIndex, animated: true)
        
    }
    
    //MARK: -- private func
    // func to calculate current position of scrollview
    private func calculateCurrentPosition()-> CGFloat {
        let width = containerView.frame.width
        let contentOffSet = containerView.contentOffset.x
        return contentOffSet / width
    }
    
    //  func to set the sliderView content offset to be the view based on the appropriate index
    func goToPage(index: Int, animated:Bool) {
        let index = CGFloat(index)
        containerView.setContentOffset(CGPoint(x: index * self.frame.width, y: 0), animated: animated)
    }
    
    //MARK: -- set up all pages of the onBoarding views
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
    
    //MARK: -- Set up the static ovelay page that doesnt move with the siderview
    private func setUpOverlayView() {
        if let dataSource = dataSource {
            if let overlay = dataSource.quaviOnboardViewForOverlay(self) {
                overlay.numberOfPages(count: pageCount)
                self.addSubview(overlay)
                let overLayFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                overlay.frame = overLayFrame
                onBoardingOverlay = overlay
                
                //MARK:-- add function to pagecontroller for when it gets tapped
                onBoardingOverlay?.pageControl.addTarget(self, action: #selector(handlePageControllerTapped), for: .allTouchEvents)
            }
        }
    }
    //MARK: -- Private constraints
    private func configureScrollView() {
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: self.topAnchor), containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor), containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor), containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
//MARK: Creates an extension on QuickGrubOnBoarding to handle Scrollview delgate
extension OnBoarding: UIScrollViewDelegate {
    // changes the current page indicated in the page controller
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPosition = calculateCurrentPosition()
        onBoardingOverlay?.currentPage(index: Int(currentPosition))
        
    //allows us to modify properies of the overlay view based on the index we are currently in
        if let overlay = onBoardingOverlay {
            dataSource?.quaviOnboardOverlayForPosition(self, overlay: overlay, for: Double(currentPosition))
        }
    }
}
