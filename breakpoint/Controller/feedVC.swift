//
//  FirstViewController.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/22/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class feedVC: UIViewController , UITableViewDataSource , UITableViewDelegate {
    

    @IBOutlet weak var FeedTableView: UITableView!
    
    var Messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FeedTableView.delegate = self
        FeedTableView.dataSource = self
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DataService.instance.getAllFeedMessages { (messages) in
            self.Messages = messages.reversed()
            self.FeedTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return Messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else {return UITableViewCell()}
        DataService.instance.getuserEmail(forUid: Messages[indexPath.item].msg_senderId) { (returnedName) in
             cell.setCellLayout(Img: nil, name: returnedName, forMessage: self.Messages[indexPath.item].msg_content)
        }
       
        
        return cell
    }
    

}

