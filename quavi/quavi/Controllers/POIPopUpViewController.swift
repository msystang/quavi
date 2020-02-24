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
        label.text = "You've reached:"
        return label
    }()
    
    lazy var pointNameLabel: UILabel = {
        var label = UILabel()
        label.text = "The Empire State Building"
        return label
    }()

    lazy var continueButton:UIButton = {
           let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
           button.setTitle("Next", for: .normal)
           button.setTitleColor(.purple, for: .normal)
           button.layer.cornerRadius = button.frame.height / 2
           button.layer.borderColor = #colorLiteral(red: 0.2046233416, green: 0.1999312043, blue: 0.1955756545, alpha: 1)
           button.layer.borderWidth = 3
           button.addTarget(self, action: #selector(continueButtonPressed(_:)), for: .touchUpInside)
           return button
       }()
       
       //weak var delegate: WaypointConfirmationViewControllerDelegate?
       
       override func viewDidLoad() {
           super.viewDidLoad()
            setBackgroundColor()
            addSubviews()
            continueButtonConstraints()
       }
       
       private func setBackgroundColor(){
           view.backgroundColor = .white
       }

       @objc func continueButtonPressed(_ sender: Any) {
           //delegate?.proceedToNextLegInTour(self)
       }
       

}
