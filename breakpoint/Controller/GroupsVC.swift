//
//  SecondViewController.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/22/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    @IBOutlet weak var GroupTableView: UITableView!
    
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GroupTableView.delegate = self
        GroupTableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.GetAllGroups { (getGroups) in
            self.groupsArray = getGroups
            self.GroupTableView.reloadData()
        }
    }
}
extension GroupsVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell else{return UITableViewCell()}
        cell.SelLayout(groupItem: groupsArray[indexPath.item])
        return cell
    }
    
    
}
