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
        
        switch showButtons{
        case .hide:
           presentNavigationVC()
            
        case .show:
           activateTopConstraints()
            presentButtons()
            showButtons = .hide
           presentModesOfTransport.setImage(UIImage(systemName: "location.fill")!, for: .normal)
           
            if showButtons == .hide{
            presentNavigationVC()
        }
     }
    }
    
     @objc func handleFinishButtonPressed(_ sender: UIButton) {
         let popupFinalVC = POIPopUpFinalViewController()
         popupFinalVC.modalPresentationStyle = .fullScreen
         self.present(popupFinalVC, animated: true)
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
    
    private func presentNavigationVC(){
        guard let currentLegRoute = currentLegRoute else { return }
                   let navigationService = MapboxNavigationService(route: currentLegRoute, simulating: .always )
                   let navigationOptions = NavigationOptions(navigationService: navigationService)
                   let navigationVC = NavigationViewController(for: currentLegRoute, options: navigationOptions)
                   navigationVC.delegate = self
                   navigationVC.modalPresentationStyle = .fullScreen
                   present(navigationVC, animated: true)
    }
    
    private func activateNewTopConstraints() {
           NSLayoutConstraint.deactivate([carButtonTopConstraint!, bikeButtonTopConstraint!, walkButtonTopConstraint!])
           NSLayoutConstraint.activate([newCarButtonTopConstraint!, newWalkButtonTopConstraint!, newBikeButtonTopConstraint!])
       }
    
    private func changePresentModesOfTransportBackgroundColor() {
        presentModesOfTransport.backgroundColor = presentModesOfTransport.backgroundColor == .white ? UIDesign.quaviLightGrey : .white
        presentModesOfTransport.tintColor = presentModesOfTransport.tintColor == .black ? UIDesign.quaviLightGrey : .black
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

