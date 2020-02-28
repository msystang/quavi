//
//  POIPopUpFinalViewController.swift
//  quavi
//
//  Created by Alex 6.1 on 2/28/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.

// SOURCE CODE: https://github.com/dkw5877/FunWithParticleEmitters

import UIKit

class POIPopUpFinalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradient()
        configureBirthdayCakeImage()
        configureConfetti()
        configureHappyBirthdayLabel()
    }
    
    private func configureGradient() {
        let gradient = GradientView()
        gradient.startColor = UIColor(red: 1.00, green: 0.756, blue: 0.000, alpha: 1)
        gradient.endColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        gradient.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradient)
        NSLayoutConstraint.pin(view: gradient, to: view)
    }
    
    private func configureBirthdayCakeImage() {
        let image = UIImage(named: "congrats")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)])
    }
    
    private func configureConfetti() {
        let confetti = ConfettiParticleView()
        confetti.particleImage = UIImage(named: "confetti")
        confetti.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confetti)
        NSLayoutConstraint.pin(view: confetti, to: view)
    }
    
    private func configureHappyBirthdayLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "You Completed A Tour! \n It's Getting Quazy In Here!"
        label.textAlignment = .center
        label.textColor = .blue
        label.numberOfLines = 2
        label.sizeToFit()
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
}
