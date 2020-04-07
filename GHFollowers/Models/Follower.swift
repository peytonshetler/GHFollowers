//
//  Follower.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/3/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
