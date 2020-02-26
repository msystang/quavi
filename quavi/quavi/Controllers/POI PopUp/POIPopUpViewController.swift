//
//  POIPopUpViewController.swift
//  quavi
//
//  Created by Alex 6.1 on 2/24/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class POIPopUpViewController: UIViewController {
    
    lazy var reachedLabel: UILabel = {
        var label = UILabel()
        label.text = "You have reached"
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    lazy var pointNameLabel: UILabel = {
        var label = UILabel()
        label.text = "The Empire State Building"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var continueTourButton: UIButton = {
        var button = UIButton()
        button.setTitle("Continue Tour", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(continueTourButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelTourButton: UIButton = {
        var button = UIButton()
        button.setTitle("Cancel Tour", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(cancelTourButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        addSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addConstraints()
    }
    
    private func setBackgroundColor(){
        view.backgroundColor = .white
        
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.frame = view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.systemYellow.cgColor]
        
        view.layer.addSublayer(gradient)
    }
    
    
    @objc func cancelTourButtonPressed() {
        self.dismiss(animated: true)
        #warning("pop back to mapviewVC")
    }
    
    @objc func continueTourButtonPressed(_ sender:UIButton) {
        let poiInfoVC = POIInfoViewController()
        poiInfoVC.modalPresentationStyle = .fullScreen
        present(poiInfoVC, animated: true, completion: nil)
    }
    
}
