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
            case false: presentTabbarVC()
            case true: presentConfettiVC()
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

    lazy var continueButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitleColor(.purple, for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderColor = #colorLiteral(red: 0.2046233416, green: 0.1999312043, blue: 0.1955756545, alpha: 1)
        button.layer.borderWidth = 3
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
        
        continueButtonConstraints()
    }
    
    
    //MARK:-- Private Functions
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func presentTabbarVC() {
        continueButton.setTitle("Next", for: .normal)
        continueButton.addTarget(self, action: #selector(continueButtonPressed(_:)), for: .touchUpInside)
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
    
    private func presentConfettiVC() {
            continueButton.setTitle("Finish", for: .normal)
            continueButton.layoutIfNeeded()
            continueButton.addTarget(self, action: #selector(handleFinishButtonPressed(_:)), for: .touchUpInside)
    //        isAtLastLeg = false
        }
    
    //MARK:--@objc func
    @objc func handlePresentingMLView(_ sender: UIButton){
        self.showAlert(title: "Coming Soon...", message: "The team is currently working on the feature to allow for an easter egg scavenger hunt ")
    }
    
    @objc func continueButtonPressed(_ sender: UIButton) {
        #warning("push to mapVC")
        //        self.dismiss(animated: true)
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleFinishButtonPressed(_ sender: UIButton) {
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
