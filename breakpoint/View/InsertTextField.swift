//
//  InsertTextField.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class InsertTextField: UITextField {

    private var textrectOffset: CGFloat = 20
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        setupview()
        super.awakeFromNib()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,padding)
    }
    
    func setupview(){
        let placeholder = NSAttributedString(string: self.placeholder!, attributes:[NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) ])
        self.attributedPlaceholder = placeholder
        
       // self.layer.cornerRadius = 5
    }
}
