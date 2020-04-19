//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/10/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
