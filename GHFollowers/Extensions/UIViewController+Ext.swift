//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/2/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve // appears to fade in
            self.present(alertVC, animated: true)
        }
    }
}
