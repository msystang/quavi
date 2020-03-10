//
//  ViewController+Alert.swift
//  quavi
//
//  Created by Sunni Tang on 2/20/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    public func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    public func cancelAlert(title:String?, message:String?,actionOneTitle:String?,actionOneClosure: ((UIAlertAction) -> ())?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let actionOne = UIAlertAction(title: actionOneTitle, style:.destructive, handler: actionOneClosure)
        
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(actionOne)
        alertController.addAction(cancel)
        present(alertController,animated: true)
        
    }
}
