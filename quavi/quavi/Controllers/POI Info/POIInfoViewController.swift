//
//  POIInfoViewController.swift
//  quavi
//
//  Created by Mr Wonderful on 2/11/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit
import Mapbox
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

class POIInfoViewController: UIViewController {
    
    //MARK:-- Properties
    var viewArray: [UIView]!
    let shapeLayer = CAShapeLayer()
    var showButtons:Enums.presentModeOfTransport = .hide
    var bikeButtonTopConstraint: NSLayoutConstraint?
    var carButtonTopConstraint: NSLayoutConstraint?
    var walkButtonTopConstraint: NSLayoutConstraint?
    var newBikeButtonTopConstraint: NSLayoutConstraint?
    var newCarButtonTopConstraint: NSLayoutConstraint?
    var newWalkButtonTopConstraint: NSLayoutConstraint?
    
    var showMapView:Bool = false {
        didSet{
            if showMapView == true {
                let lastPage = CGFloat(viewArray.count - 1)
                containerView.setContentOffset(CGPoint(x: lastPage * containerView.frame.width, y: 0), animated: true)
                pageControl.currentPage = Int(lastPage)
                
            }
        }
    }
    
    var isAtLastLeg: Bool? = false{
        didSet {
            guard let isAtLastLeg = isAtLastLeg else {return}
            
            switch isAtLastLeg{
            case false:
                goToNextLeg()
            case true:
                presentConfettiVC()
            }
        }
    }
    
    //MARK:-- Objects
    lazy var continueButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        button.setTitleColor(.purple, for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderColor = #colorLiteral(red: 0.2046233416, green: 0.1999312043, blue: 0.1955756545, alpha: 1)
        button.layer.borderWidth = 3
        return button
    }()
    
    lazy var easterEggButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.setImage(UIImage(named: "quaviduckegg"), for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.addTarget(self, action: #selector(handlePresentingMLView(_:)), for: .touchUpInside)
        return button
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
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.hidesForSinglePage = true
        pc.pageIndicatorTintColor = .blue
        pc.currentPageIndicatorTintColor = .red
        return pc
    }()
    
    lazy var presentModesOfTransport:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.layer.cornerRadius = button.frame.height / 2
        button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        button.tintColor = .black
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(handlePresentingButton), for: .touchUpInside)
        return button
    }()
    
    lazy var bikeButton:UIButton = {
        let button = UIButton(image: UIImage(named: "bike")!, borderWidth: 2, tag: 1)
        button.alpha = 0
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleSelectingModeOfTransportation(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var carButton:UIButton = {
        let button = UIButton(image: UIImage(named: "car")!, borderWidth: 2, tag: 0)
        button.alpha = 0
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleSelectingModeOfTransportation(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var walkButton:UIButton = {
        let button = UIButton(image: UIImage(named: "walk")!, borderWidth: 2, tag: 2)
        button.alpha = 0
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleSelectingModeOfTransportation(sender:)), for: .touchUpInside)
        return button
    }()
    
    //MARK: SLIDER VIEWS
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
    
    lazy var view3:UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var view4 = MapView(frame: view.bounds)
    
    
    var selectedRoute: Route?
    #warning("Add this logic to the POI PopUp VC to increase (do not apply to when you are at last stop)")
    var currentLegRoute: Route?
    var nextStopIndex = 0 {
        didSet {
            guard let waypointCount = selectedRoute?.routeOptions.waypoints.count else {return}
            if nextStopIndex > waypointCount {
                nextStopIndex = 0
            }
        }
    }
    var modeOfTransit = MBDirectionsProfileIdentifier.automobile{
        didSet{
            getSelectedRoute(navigationType: modeOfTransit)
        }
    }
    
    //TODO: For Testing... Refactor with initalLocation from user!
    var userLocation = CLLocationCoordinate2D(latitude: 40.7489288, longitude: -73.9869172)
    
    
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
        likeButtonConstraints()
        presentModesOfTransportConstraints()
        bikeButtonConstraints()
        carButtonConstraints()
        walkButtonConstraints()
        createPulse()
        view.bringSubviewToFront(presentModesOfTransport)
        getSelectedRoute(navigationType: modeOfTransit)
    }
    
    //MARK:-- Private func
    
    private func goToNextLeg(){
        continueButton.setTitle("Next", for: .normal)
        continueButton.addTarget(self, action: #selector(continueButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func presentConfettiVC(){
        continueButton.setTitle("Finish", for: .normal)
        continueButton.layoutIfNeeded()
        continueButton.addTarget(self, action: #selector(handleFinishButtonPressed(_:)), for: .touchUpInside)
        //        isAtLastLeg = false
    }
    private func setBackgroundColor(){
        view.backgroundColor = .white
    }
    
    private func assignViewsToArray() {
        viewArray = [view1, view2, view3, view4]
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
    
    @objc func handleSelectingModeOfTransportation(sender:UIButton) {
          switch sender.tag{
          case 0:
              modeOfTransit = .automobile
          case 1:
              modeOfTransit = .cycling
          case 2:
              modeOfTransit = .walking
          default :
              return
          }
      }
}

extension POIInfoViewController: UIScrollViewDelegate{
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(page)
    }
}
