//
//  POIInfoViewController+objc.swift
//  quavi
//
//  Created by Mr Wonderful on 3/7/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit
import MapboxNavigation
import MapboxDirections
import MapboxCoreNavigation

extension POIInfoViewController {
    //MARK:--@objc func
     @objc func handlePresentingButton(_ sender:UIButton){
         toggleButton(button: sender, onImage: UIImage(systemName: "location.fill")!, offImage: UIImage(systemName: "xmark")!)
         
         switch showButtons{
         case .hide:
             activateNewTopConstraints()
             showMapView = true
             presentButtons()
             showButtons = .show
         case .show:
             activateTopConstraints()
             presentButtons()
             showButtons = .hide
         }
     }
     
     @objc func continueButtonPressed(_ sender: UIButton) {
        guard let currentLegRoute = currentLegRoute else { return }
        let navigationService = MapboxNavigationService(route: currentLegRoute, simulating: .always )
        let navigationOptions = NavigationOptions(navigationService: navigationService)
        let navigationVC = NavigationViewController(for: currentLegRoute, options: navigationOptions)
        navigationVC.delegate = self
        navigationVC.modalPresentationStyle = .fullScreen
        
        // Use this property to indicate when to change continue button to finish tour in POIInfoVC
        nextStopIndex += 1
        print("Index for next stop: \(nextStopIndex)")
        
        //TODO: For testing - remove after we use actual user location!
        userLocation = currentLegRoute.coordinates?.last ?? CLLocationCoordinate2D(latitude: 40.7489288, longitude: -73.9869172)
        present(navigationVC, animated: true)
     }
     
     @objc func handleFinishButtonPressed(_ sender: UIButton) {
         let popupFinalVC = POIPopUpFinalViewController()
         popupFinalVC.modalPresentationStyle = .fullScreen
         self.present(popupFinalVC, animated: true)
     }
     
     @objc func handlePresentingMLView(_ sender: UIButton){
         self.showAlert(title: "Coming Soon...", message: "The team is currently working on the feature to allow for an easter egg scavenger hunt ")
     }
    
    //MARK:-- Private func
    
    //toggles the image of the buttons when clicked
      private func toggleButton(button:UIButton, onImage:UIImage, offImage:UIImage) {
          button.currentImage == offImage ? button.setImage(onImage, for: .normal) : button.setImage(offImage, for: .normal)
      }
    
    private func switchButtonAlpha() {
           carButton.alpha = carButton.alpha == 1 ? 0: 1
           walkButton.alpha = walkButton.alpha == 1 ? 0: 1
           bikeButton.alpha = bikeButton.alpha == 1 ? 0: 1
       }
    
    private func activateNewTopConstraints() {
           NSLayoutConstraint.deactivate([carButtonTopConstraint!, bikeButtonTopConstraint!, walkButtonTopConstraint!])
           NSLayoutConstraint.activate([newCarButtonTopConstraint!, newWalkButtonTopConstraint!, newBikeButtonTopConstraint!])
       }
    
    private func changePresentModesOfTransportBackgroundColor() {
        presentModesOfTransport.backgroundColor = presentModesOfTransport.backgroundColor == .white ? .black : .white
        presentModesOfTransport.tintColor = presentModesOfTransport.tintColor == .white ? .black : .white
    }
    
    private func presentButtons() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {[weak self] in
            self?.switchButtonAlpha()
            self?.view.layoutIfNeeded()
        }) { (change) in
            self.changePresentModesOfTransportBackgroundColor()
        }
    }
    
    private func activateTopConstraints() {
        NSLayoutConstraint.deactivate([newCarButtonTopConstraint!, newWalkButtonTopConstraint!, newBikeButtonTopConstraint!])
        NSLayoutConstraint.activate([carButtonTopConstraint!, bikeButtonTopConstraint!, walkButtonTopConstraint!])
    }

}

