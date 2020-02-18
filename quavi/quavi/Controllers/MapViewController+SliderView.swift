//
//  MapViewController+SliderView.swift
//  quavi
//
//  Created by Alex 6.1 on 2/11/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit 

extension MapViewController {
    
    func handleCollectionViewCellPressed(item: Int) {
        if item == 0 { currentSelectedCategory = .History
        } else if item == 1 { currentSelectedCategory = .Art
        } else if item == 2 { currentSelectedCategory = .Science
        } else if item == 3 { currentSelectedCategory = .Religion
        } else if item == 4 { currentSelectedCategory = .Yeet
        }
    }
    
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
    
    func directionOfChevron(state: Enums.sliderViewStates) {
        
        switch state {
        case .halfOpen:
            self.chevronArrows.image = UIImage(systemName: "minus")
        case .fullOpen:
            self.chevronArrows.image = UIImage(systemName: "chevron.compact.down")
        case .closed:
            self.chevronArrows.image = UIImage(systemName: "chevron.compact.up")
        }
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
                    guard let self = self else { return }
                    
                    self.directionOfChevron(state: .halfOpen)
                    
                    self.view.layoutIfNeeded()
                    
                    self.sliderView.alpha = 1.0
                    self.poiTableView.alpha = 1.0
                    self.categoriesCollectionView.alpha = 1.0
                    
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
                    
                    guard let self = self else { return }
                    
                    switch self.sliderViewState {
                        
                    case .fullOpen:
                       
                        self.sliderViewState = .halfOpen
                        
                    case .halfOpen:
                       
                        self.sliderViewState = .closed
                        
                    case .closed:
                        print("it's already closed")
                        
                    }
                    
                  
                    self.view.layoutIfNeeded()
                    
                    if self.sliderViewState == .closed {
                        self.poiTableView.alpha = 0
                    }
                    
                    }, completion: nil)
                
            case UISwipeGestureRecognizer.Direction.up:
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
                    guard let self = self else { return }
                    
                    switch self.sliderViewState {
                    case .fullOpen:
                        print("it's fully opened")
                        
                    case .halfOpen:
                        self.sliderViewState = .fullOpen
                        
                    case .closed:
                        self.sliderViewState = .halfOpen
                    }
                    
                    if self.sliderViewState == .closed {
                        self.directionOfChevron(state: .closed)
                    } else if self.sliderViewState == .halfOpen {
                        self.directionOfChevron(state: .halfOpen)
                    } else if self.sliderViewState == .fullOpen {
                        self.directionOfChevron(state: .fullOpen)
                    }
                    self.view.layoutIfNeeded()
                    
                    self.sliderView.alpha = 1.0
                    self.poiTableView.alpha = 1.0
                    self.categoriesCollectionView.alpha = 1.0
                    }, completion: nil)
                
            default:
                break
            }
        }
    }
    
    @objc func tvCellSectionButtonPressed(sender: UIButton) {
        print(sender.tag)
        if sampleData[sender.tag].isCellExpanded {
            sampleData[sender.tag].isCellExpanded = false
        } else {
            sampleData[sender.tag].isCellExpanded = true
        }
        let incides: IndexSet = [sender.tag]
        poiTableView.reloadSections(incides, with: .fade)
    }
}

