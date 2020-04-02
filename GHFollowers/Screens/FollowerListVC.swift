//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/2/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
