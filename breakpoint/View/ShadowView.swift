//
//  ShadowView.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        super.awakeFromNib()
    }

}
