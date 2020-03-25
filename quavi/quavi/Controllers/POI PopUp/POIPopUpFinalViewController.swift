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
        button.setTitle("End Tour", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(endTourButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "congrats")
        imageView.contentMode = .scaleAspectFit4        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradient()
        configureCongratsImage()
        configureConfetti()
        configureCongratsLabel()
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
    
    private func configureCongratsImage() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.2),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width / 1.2),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)])
    }
    
    private func configureConfetti() {
        let confetti = ConfettiParticleView()
        confetti.particleImage = UIImage(named: "confetti")
        confetti.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confetti)
        NSLayoutConstraint.pin(view: confetti, to: view)
    }
    
    private func configureCongratsLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "You Completed A Tour! \n It's Getting Quazy In Here!"
        label.textAlignment = .center
        label.textColor = UIDesign.quaviWhite
        label.numberOfLines = 2
        label.sizeToFit()
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageView.topAnchor, constant: -60),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
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
    
    @objc func endTourButtonPressed() {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
