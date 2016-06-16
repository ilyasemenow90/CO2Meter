//
//  UIViewController + Error.swift
//  GoPoint
//
//  Created by isoft on 5/4/16.
//  Copyright © 2016 intellectsoft. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showError(title: String, message: String, completion: (() -> Void)? = nil){
        showMessage(title, message: message, completion: completion)
    }
    
    func showMessage(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: title, style: .Default) { (UIAlertAction) in
            completion?()
        }

        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: completion)
    }
}