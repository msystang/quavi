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
    var viewArray: [UIView]!
    let shapeLayer = CAShapeLayer()
    
    var isAtLastLeg: Bool? = false {
        didSet {
            guard let isAtLastLeg = isAtLastLeg else {return}

            switch isAtLastLeg {
                case false: continueTourToNextLeg()
                case true: userHasCompletedTour()
            }
        }
    }
    
    //MARK:-- VIEWS
    lazy var easterEggButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.setImage(UIImage(named: "quaviduckegg"), for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.addTarget(self, action: #selector(handlePresentingMLView(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.hidesForSinglePage = true
        pc.pageIndicatorTintColor = .blue
        pc.currentPageIndicatorTintColor = .red
        return pc
    }()
    
    lazy var containerView: UIScrollView = {
        let view = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.95, height: self.view.frame.height * 0.65))
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.isPagingEnabled = true
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.bounces = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        return view
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.layer.borderWidth = 3
        return button
    }()
    
    lazy var continueTourButton: UIButton = {
        var button = UIButton()
        button.setTitle("Continue Tour", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(continueTourButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelTourButton: UIButton = {
        var button = UIButton()
        button.setTitle("Cancel Tour", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(cancelTourButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: SLIDERVIEWS
    lazy var view1: UIView = {
        let view = POIPopUpAboutView()
        //view.backgroundColor = .systemGray4
        return view
    }()
    
    lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var view3: UIView = {
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
        
        easterEggButtonConstraints()
        createPulse()
        
        pageControlConstraints()
        containerViewConstraints()
        assignViewsToArray()
        populateContainerView()
        likeButtonConstraints()
        
        continueTourButtonConstraints()
        cancelTourButtonConstraints()
    }
    
    
    //MARK:-- Private Functions
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func assignViewsToArray() {
        viewArray = [view1, view2, view3]
    }
    
    private func populateContainerView() {
        if let viewArray = viewArray {
            pageControl.numberOfPages = viewArray.count
            
            for (index, view) in viewArray.enumerated(){
                let xPosition: CGFloat = self.containerView.frame.width * CGFloat(index)
                view.frame = CGRect(x: xPosition,
                                    y: 0,
                                    width: containerView.frame.width,
                                    height: containerView.frame.height)
                
                containerView.contentSize.width = containerView.frame.width * CGFloat(index + 1)
                containerView.addSubview(view)
            }
            
        }
        
    }
    
    private func continueTourToNextLeg() {
        //continueButton.setTitle("Next", for: .normal)
        continueTourButton.addTarget(self, action: #selector(continueTourButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func userHasCompletedTour() {
        continueTourButton.setTitle("Finish", for: .normal)
        continueTourButton.layoutIfNeeded()
        continueTourButton.addTarget(self, action: #selector(loadCongratsVC(_:)), for: .touchUpInside)
        //        isAtLastLeg = false
    }
    
    
    //MARK:--@objc func
    @objc func handlePresentingMLView(_ sender: UIButton){
        self.showAlert(title: "Coming Soon...", message: "The team is currently working on the feature to allow for an easter egg scavenger hunt ")
    }
    
    @objc func continueTourButtonPressed(_ sender: UIButton) {
        print("continue pressed")
//        let nextVC = POIInfoViewController()
//        nextVC.isAtLastLeg = isAtLastLeg
//        nextVC.modalPresentationStyle = .fullScreen
//        present(nextVC, animated: true, completion: nil)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @objc func cancelTourButtonPressed() {
        #warning("Set lastStopIndex to Zero in the mapVC")
        print("cancel pressed")
        // Pop PopUp and Navigation ViewControllers
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @objc func loadCongratsVC(_ sender: UIButton) {
        let popupFinalVC = POIPopUpFinalViewController()
        popupFinalVC.modalPresentationStyle = .fullScreen
        self.present(popupFinalVC, animated: true)
    }
    
}

//MARK: --Extension
extension POIInfoViewController: UIScrollViewDelegate {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(page)
    }
}
