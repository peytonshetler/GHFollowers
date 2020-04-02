//
//  GFTextField.swift
//  GHFollowers
//
//  Created by Peyton Shetler on 4/1/20.
//  Copyright © 2020 Peyton Shetler. All rights reserved.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius          = 10
        layer.borderWidth           = 2
        layer.borderColor           = UIColor.systemGray4.cgColor
        
        textColor                   = .label // Default label color...it's black on light mode & white on dark mode
        tintColor                   = .label // blinking cursor
        textAlignment               = .center
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no // Auto-correct
     //  Unnecessary if you want the default keyboard BUT...you can change the keyboard type to things like email, phone number, etc.
     // keyboardType                = .default
        returnKeyType               = .go // changes the return key
        
        placeholder                 = "Enter a username"
    }
    
}
