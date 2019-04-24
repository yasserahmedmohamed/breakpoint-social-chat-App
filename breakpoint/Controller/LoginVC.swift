//
//  LoginVC.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: InsertTextField!
    @IBOutlet weak var PasswordTxt: InsertTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CloseViewTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SignInTapped(_ sender: Any) {
        if emailTxt.text != nil && PasswordTxt.text != nil {
            AuthService.instance.login(forEmail: emailTxt.text!, forPassword: PasswordTxt.text!) { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
                else {
                    print(String(describing:  error?.localizedDescription))
                }
                AuthService.instance.RegisterUser(forEmail: self.emailTxt.text!, forPassword: self.PasswordTxt.text!, complition: { (success, error) in
                    if success {
                        AuthService.instance.login(forEmail: self.emailTxt.text!, forPassword: self.PasswordTxt.text!, complition: { (success, nil) in
                           self.dismiss(animated: true, completion: nil)
                        })
                    }
                    else
                    {
                        print(String(describing:  error?.localizedDescription))

                    }
                })
            }
        }
    }
}
extension LoginVC : UITextFieldDelegate {}

