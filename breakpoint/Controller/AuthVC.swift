//
//  AuthVC.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInWithEmailTapped(_ sender: Any) {
        performSegue(withIdentifier: "showLogin", sender: nil)
    }
}
