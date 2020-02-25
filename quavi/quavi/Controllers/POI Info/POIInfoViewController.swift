//
//  POIInfoViewController.swift
//  quavi
//
//  Created by Mr Wonderful on 2/11/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class POIInfoViewController: UIViewController {
    
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
    }
    
    //MARK:-- Private func
    private func setBackgroundColor(){
        view.backgroundColor = .white
    }

    @objc func continueButtonPressed(_ sender: Any) {
        
    }
    
    
}
