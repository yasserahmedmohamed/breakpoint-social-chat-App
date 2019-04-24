//
//  CreatePostVC.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit
import Firebase
class CreatePostVC: UIViewController {

    @IBOutlet weak var UserImg: UIImageView!
    @IBOutlet weak var UserEmailLbl: UILabel!
    @IBOutlet weak var MessageTxt: UITextView!
    @IBOutlet weak var SendBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        MessageTxt.delegate = self
       SendBtn.bindToKeyboard()
    }
    

    @IBAction func CloseTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SendTapped(_ sender: Any) {
        if MessageTxt.text != nil && MessageTxt.text != "Say something here..."
        {
            SendBtn.isEnabled = false
            DataService.instance.UploadPost(withmessage: MessageTxt.text, uid: (Auth.auth().currentUser?.uid)!, forgroup: nil) { (success) in
                if success {
                    self.SendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }
                else
                {
                    self.SendBtn.isEnabled = true
                    print("there is error")
                }
            }
        }
    }
    
}

extension CreatePostVC: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
