//
//  FeedCell.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/24/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var UserImg: UIImageView!
    @IBOutlet weak var UsrAccLbl: UILabel!
    
    @IBOutlet weak var MessgLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCellLayout(Img : UIImage? , name : String ,forMessage content : String)
    {
        if Img != nil {
            UserImg.image = Img
        }
        UsrAccLbl.text = name
        MessgLbl.text = content
    }

}
