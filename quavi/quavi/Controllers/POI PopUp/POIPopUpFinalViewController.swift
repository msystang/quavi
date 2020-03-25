//
//  POIPopUpFinalViewController.swift
//  quavi
//
//  Created by Alex 6.1 on 2/28/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.

// SOURCE CODE: https://github.com/dkw5877/FunWithParticleEmitters

import UIKit

class POIPopUpFinalViewController: UIViewController {
    
    lazy var closeTourButton: UIButton = {
        var button = UIButton()
        button.setTitle("Close Tour", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(cancelTourButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradient()
        configureBirthdayCakeImage()
        configureConfetti()
        configureHappyBirthdayLabel()
        configureCloseTourButton()
    }
    
    private func configureGradient() {
        let gradient = GradientView()
        gradient.startColor = UIDesign.quaviOrange
        gradient.endColor = UIDesign.quaviYellow
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
    
    private func configureCloseTourButton() {
        view.addSubview(closeTourButton)
        closeTourButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeTourButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120),
            closeTourButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeTourButton.heightAnchor.constraint(equalToConstant: 50),
            closeTourButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    @objc func cancelTourButtonPressed() {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
