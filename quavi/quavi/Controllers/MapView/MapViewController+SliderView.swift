//
//  MapViewController+SliderView.swift
//  quavi
//
//  Created by Alex 6.1 on 2/11/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension MapViewController {

    
    func loadGestures() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeDown.direction = .down
        self.sliderView.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.sliderView.addGestureRecognizer(swipeUp)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        self.chevronArrows.addGestureRecognizer(tap)
    }
    
  private func directionOfChevron(state: Enums.sliderViewStates) {
        
        switch state {
        case .halfOpen:
            self.chevronArrows.image = UIImage(systemName: "minus")
        case .fullOpen:
            self.chevronArrows.image = UIImage(systemName: "chevron.compact.down")
        case .closed:
            self.chevronArrows.image = UIImage(systemName: "chevron.compact.up")
        }
    }
    
    private func addCornerRadiusToSliderView(){
        sliderView.layer.cornerRadius = 15
    }
    
    private func removeCornerRadiusToSliderView(){
        sliderView.layer.cornerRadius = 0
    }
    //MARK: -OBJ-C FUNCTIONS
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        print(gesture)
        
        if let tapGesture = gesture as? UITapGestureRecognizer {
            print("tapped")
            switch tapGesture.numberOfTouches {
            case 1:
                sliderViewState = .halfOpen
                
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
                    self?.setHalfOpenSliderViewConstraints()
                    self?.directionOfChevron(state: .halfOpen)
                    self?.view.layoutIfNeeded()
                    self?.sliderView.alpha = 1.0
                    self?.poiTableView.alpha = 1.0
                    self?.toursCollectionView.alpha = 1.0
                    self?.addCornerRadiusToSliderView()
                    self?.sliderViewState = .halfOpen
                    self?.walkButton.isEnabled = true
                    self?.bikeButton.isEnabled = true
                    self?.carButton.isEnabled = true
                    }, completion: nil)
            default:
                print("dunno know")
            }
            
        }
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.down:
                print("Swiped down")
                
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
                    
                    switch self?.sliderViewState {
                    case .fullOpen:
                        self?.setHalfOpenSliderViewConstraints()
                        self?.sliderViewState = .halfOpen
                        self?.walkButton.isEnabled = true
                        self?.bikeButton.isEnabled = true
                        self?.carButton.isEnabled = true
                    case .halfOpen:
                        self?.setClosedSliderViewConstraints()
                        self?.sliderViewState = .closed
                        self?.removeCornerRadiusToSliderView()
                    case .closed:
                        print("it's already closed")
                    case .none:
                        return
                    }
                    
                    if self?.sliderViewState == .closed {
                        self?.directionOfChevron(state: .closed)
                    } else if self?.sliderViewState == .halfOpen {
                        self?.directionOfChevron(state: .halfOpen)
                    } else if self?.sliderViewState == .fullOpen {
                        self?.directionOfChevron(state: .fullOpen)
                    }
                    self?.view.layoutIfNeeded()
                    
                    if self?.sliderViewState == .closed {
                        self?.poiTableView.alpha = 0
                    }
                    
                    }, completion: nil)
                
            case UISwipeGestureRecognizer.Direction.up:
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
                    
                    switch self?.sliderViewState {
                    case .fullOpen:
                        print("it's fully opened")
                    case .halfOpen:
                        self?.setFullOpenSliderViewConstraints()
                        self?.sliderViewState = .fullOpen
                        self?.walkButton.isEnabled = false
                        self?.bikeButton.isEnabled = false
                        self?.carButton.isEnabled = false
                    case .closed:
                        self?.setHalfOpenSliderViewConstraints()
                        self?.sliderViewState = .halfOpen
                        self?.addCornerRadiusToSliderView()
                    case .none:
                        return
                    }
                    
                    if self?.sliderViewState == .closed {
                        self?.directionOfChevron(state: .closed)
                    } else if self?.sliderViewState == .halfOpen {
                        self?.directionOfChevron(state: .halfOpen)
                    } else if self?.sliderViewState == .fullOpen {
                        self?.directionOfChevron(state: .fullOpen)
                    }
                    self?.view.layoutIfNeeded()
                    
                    self?.sliderView.alpha = 1.0
                    self?.poiTableView.alpha = 1.0
                    self?.toursCollectionView.alpha = 1.0
                    }, completion: nil)
                
            default:
                break
            }
        }
    }
    
    @objc func tvCellSectionButtonPressed(sender: UIButton) {

        let section = sender.tag
          if selectedSections.contains(section) {
              selectedSections.remove(section)
          } else {
              selectedSections.insert(section)
          }

        let incides: IndexSet = [sender.tag]
        poiTableView.reloadSections(incides, with: .fade)
   
    }
}

