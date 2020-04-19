//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/18/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//

import UIKit

extension UIView {
    
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    
    func addSubViews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
