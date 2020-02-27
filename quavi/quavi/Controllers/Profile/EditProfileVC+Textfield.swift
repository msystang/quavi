//
//  EditProfileVC+Textfield.swift
//  quavi
//
//  Created by Radharani Ribas-Valongo on 2/27/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension UITextField {
    func styleTextView() {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - -4, width: self.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 69/255, green: 69/255, blue: 69/255, alpha: 1).cgColor
        
        self.layer.addSublayer(bottomLine)
        
        self.borderStyle = .none
        self.backgroundColor = .white
    }
}

extension EditProfileViewController: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == nameTextField {
            
            handleTextFieldFirstResponder(toChangeConstraintsOf: nameTextField, disable: usernameTextField, disable: emailTextField, disable: usernameLabel, disable: emailLabel)
            currentTextfield = nameTextField
            
        } else if textField == usernameTextField {
            
            handleTextFieldFirstResponder(toChangeConstraintsOf: usernameTextField, disable: nameTextField, disable: emailTextField, disable: nameLabel, disable: emailLabel)
            currentTextfield = usernameTextField
            
        }  else if textField == emailTextField {
            
            handleTextFieldFirstResponder(toChangeConstraintsOf: emailTextField, disable: nameTextField, disable: usernameTextField, disable: nameLabel, disable: usernameLabel)
            currentTextfield = emailTextField
        }
    }
    
    
    
    
    func handleTextFieldFirstResponder(toChangeConstraintsOf selectedTextfield: UITextField, disable textfield1: UITextField, disable textfield2: UITextField, disable label1: UILabel, disable label2: UILabel) {
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
            
            textfield1.isHidden = true
            textfield2.isHidden = true
            label1.isHidden = true
            label2.isHidden = true
            self?.userImage.isHidden = true
            self?.changeImageButton.isHidden = true
            self?.backButton.isHidden = true
            self?.logoutButton.isHidden = true
            self?.confirmEditButton.isHidden = false
            self?.cancelEditButton.isHidden = false
            
            selectedTextfield.topAnchor.constraint(equalTo: self!.view.topAnchor, constant: 110).isActive = true
            self?.view.layoutIfNeeded()
        })
    }
}
