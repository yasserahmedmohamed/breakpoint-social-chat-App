//
//  CreateGroupVC.swift
//  breakpoint
//
//  Created by yasser ahmed on 5/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit
import Firebase
class CreateGroupVC: UIViewController {

    @IBOutlet weak var TitleTxt: InsertTextField!
    
    @IBOutlet weak var DoneBtn: UIButton!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var DescriptionTxt: InsertTextField!
    @IBOutlet weak var AddPeopleTxt: InsertTextField!
    @IBOutlet weak var AddedPeople: UILabel!
    var emailArray = [String]()
    var SelectedUSerArr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        AddPeopleTxt.delegate = self
        AddPeopleTxt.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
    }
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        if AddPeopleTxt.text == ""{
            emailArray = []
          TableView.reloadData()
        }
        else{
            DataService.instance.getEmail(YourQuery: AddPeopleTxt.text!) { (goteamils) in
                self.emailArray = goteamils
                self.TableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        DoneBtn.isHidden = true
    }
    @IBAction func CloseBntTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DoneBtn(_ sender: Any) {
        if TitleTxt.text != "" && DescriptionTxt.text != ""{
            DataService.instance.getIds(forUserList: SelectedUSerArr) { (ids) in
                var userIDs = ids
                userIDs.append((Auth.auth().currentUser?.uid)!)
                DataService.instance.CreateGroup(title: self.TitleTxt.text!, description: self.DescriptionTxt.text!, userIDsList: userIDs, handler: { (done) in
                    if done{
                        self.dismiss(animated: true, completion: nil)
                    }
                    else{
                        print("Group could not created. Please try again.")
                    }
                })
            }
        }
    }

}
extension CreateGroupVC : UITableViewDelegate ,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as?
            UserCell else {return UITableViewCell()}
        //SelectedUSerArr.append(cell)
        if SelectedUSerArr.contains(emailArray[indexPath.item]){
        cell.setLayout(email: emailArray[indexPath.item], isselected: true)
    }
        else{
            cell.setLayout(email: emailArray[indexPath.item], isselected: false)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else{return}
        cell.CheckImg.isHidden = !cell.CheckImg.isHidden
        if !SelectedUSerArr.contains(cell.EmailLbl.text!)
        {
            SelectedUSerArr.append(cell.EmailLbl.text!)
            AddedPeople.text = SelectedUSerArr.joined(separator: ", ")
            DoneBtn.isHidden = false
        }
        else{
            SelectedUSerArr = SelectedUSerArr.filter({$0 != cell.EmailLbl.text!})
            if SelectedUSerArr.count >= 1 {
                AddedPeople.text = SelectedUSerArr.joined(separator: ", ")
            }else{
                AddedPeople.text = "Add people to your group"
                DoneBtn.isHidden = true
            }
        }
    }
}
extension CreateGroupVC :UITextFieldDelegate{
    
}
