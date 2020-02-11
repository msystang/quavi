//
//  POIInfoViewController.swift
//  quavi
//
//  Created by Mr Wonderful on 2/11/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class POIInfoViewController: UIViewController {

    lazy var ContinueButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.addTarget(self, action: #selector(continueButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         setBackgroundColor()
    }
    
    private func setBackgroundColor(){
        view.backgroundColor = .white
    }

    @objc func continueButtonPressed(_ sender: Any) {
    
    }
    
    
}
