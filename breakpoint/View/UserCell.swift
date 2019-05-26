//
//  UserCell.swift
//  breakpoint
//
//  Created by yasser ahmed on 5/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var EmailLbl: UILabel!
    @IBOutlet weak var CheckImg: UIImageView!
    var isselected = false
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setLayout(email:String,isselected : Bool){
        EmailLbl.text = email
        CheckImg.isHidden = !isselected
        if isselected {
            self.CheckImg.isHidden = false
        }else
        {
            self.CheckImg.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let viewBack = UIView()
        viewBack.backgroundColor = UIColor.clear
        self.selectedBackgroundView = viewBack
        
    }

}
