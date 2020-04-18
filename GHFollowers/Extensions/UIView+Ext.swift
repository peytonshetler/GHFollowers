//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/18/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
