//
//  MeVC.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var ProfileImg: UIImageView!
    @IBOutlet weak var EmailLbl: UILabel!
    @IBOutlet weak var UserTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.EmailLbl.text = Auth.auth().currentUser?.email
    }

    @IBAction func LogOutTapped(_ sender: Any) {
        let logoutPopUp = UIAlertController(title: "Logout", message: "Are you sure ?", preferredStyle: .actionSheet)
        let logoutaction = UIAlertAction(title: "Logout ?", style: .default) { (buttontapped) in

            do{
               try Auth.auth().signOut()
                let Authvc = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(Authvc!, animated: true, completion: nil)
            }
            catch {
                
            }
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (buttontapped) in
            
           logoutPopUp.dismiss(animated: true, completion: nil)
        }
        logoutPopUp.addAction(logoutaction)
        logoutPopUp.addAction(cancel)

        present(logoutPopUp, animated: true, completion: nil)
    }
    

}
