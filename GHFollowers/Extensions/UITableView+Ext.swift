//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/18/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
