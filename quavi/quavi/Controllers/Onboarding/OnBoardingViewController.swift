//
//  OnBoardingViewController.swift
//  quavi
//
//  Created by Mr Wonderful on 2/21/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    let images = [UIImage(named: "OB01"),UIImage(named: "OB02"),UIImage(named: "OB03"),UIImage(named: "OB01")]
    let headers = ["Welcome To Quavi!", "Get Started", "When You Arrive", "Get Quay Quay!"]
    
    //MARK:-- Objects
    lazy var onBoardingScrollView: OnBoardingView = {
        let scrollView = OnBoardingView()
        scrollView.backgroundColor = .clear
        scrollView.dataSource = self
        return scrollView
    }()
    
    //MARK:-- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureScrollViewConstraints()
    }
    
    //MARK:-- Objc func
    @objc func handleSkip() {
        onBoardingScrollView.goToPage(index: 3, animated: true)
    }
    
    @objc func handleContinue(sender: UIButton) {
        let tabBar = QuaviTabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
    
    //MARK: -- private func
    private func addSubView(){
        view.addSubview(onBoardingScrollView)
    }
    
    private func configureScrollViewConstraints(){
        onBoardingScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([onBoardingScrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     onBoardingScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     onBoardingScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     onBoardingScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

extension OnBoardingViewController: QuaviOnBoardingDataSource{
    func quaviOnboardBackgroundColorFor(_ quaviOnBoarding: OnBoardingView, atIndex index: Int) -> UIColor? {
        
        //TODO: set background color dynamically
        return UIDesign.quaviDarkGrey
    }
    
    func quaviOnboardNumberOfPages(_ quaviOnBoarding: OnBoardingView) -> Int {
        return images.count
    }
    
    func quaviOnboardPageForIndex(_ quaviOnBoarding: OnBoardingView, index: Int) -> QuaviOnBoardingPage? {
        let page = QuaviOnBoardingPage()
        
        page.pageImageView.image = images[index]
        page.pageTitle.text = headers[index]
        
        //hides the labels when its on the last page
        //page.pageTitle.isHidden = index == 3 ? true : false
        //page.pageSubTitle.isHidden = index == 3 ? true : false
        //TODO: Set information to each onboarding page here
        return page
    }
    
    func quaviOnboardViewForOverlay(_ quaviOnBoarding: OnBoardingView) -> QuaviOnboardOverlay? {
        let overlay = QuaviOnboardOverlay()
        //Allow you to skip to a specific page
        overlay.skipButton.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        overlay.continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)

        
        return overlay
    }
    
    func quaviOnboardOverlayForPosition(_ quaviOnBoarding: OnBoardingView, overlay: QuaviOnboardOverlay, for position: Double) {
        //enables and presents the continue button when on onBoarding page is at an index
        overlay.continueButton.isHidden = quaviOnBoarding.currentPage == 3 ? false : true
        overlay.continueButton.isEnabled = quaviOnBoarding.currentPage == 3 ? true : false
        
        overlay.nextLabel.isHidden = quaviOnBoarding.currentPage == 3 ? true : false
        overlay.prevLabel.isHidden = quaviOnBoarding.currentPage == 0 ? true : false
        
        overlay.skipButton.isHidden = quaviOnBoarding.currentPage == 3 ? true : false
        overlay.skipButton.isEnabled = quaviOnBoarding.currentPage == 3 ? false : true
        
        
    }
}
