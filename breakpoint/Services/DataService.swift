//
//  DataService.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService{
    static let instance = DataService()
  public  private(set) var ref_base = DB_BASE
  public  private(set) var ref_users = DB_BASE.child("users")
  public  private(set) var ref_goups = DB_BASE.child("groups")
  public  private(set) var ref_feed = DB_BASE.child("feed")

    func createUSer(uid : String , userdata : Dictionary<String,Any>){
        ref_users.child(uid).updateChildValues(userdata)
    }
    func UploadPost(withmessage message: String, uid uid : String ,forgroup group:String?,complition : @escaping (_ success : Bool)->()){
        if group != nil {
            //send to group
        }
        else
        {
            ref_feed.childByAutoId().updateChildValues(["content": message,"senderid":uid])
            complition(true)
        }
    }
    
    func getAllFeedMessages(complition : @escaping(_ message : [Message])->())
    {
        var messageArray = [Message]()
        ref_feed.observeSingleEvent(of: .value) { (feedMessages) in
            guard let FeedMessages = feedMessages.children.allObjects as? [DataSnapshot] else {return}
            for message in FeedMessages {
              let content = message.childSnapshot(forPath: "content").value as! String
              let SenderID = message.childSnapshot(forPath: "senderid").value as! String
               messageArray.append(Message(msg_content: content, msg_senderId: SenderID))
            }
            complition(messageArray)
        }
    }
    
    func getuserEmail(forUid uid : String , complition : @escaping(_ username : String)->())
    {
        ref_users.observeSingleEvent(of: .value) { (usersnapshot) in
            guard let userSnapshot = usersnapshot.children.allObjects as? [DataSnapshot] else {return}
            for user in userSnapshot{
                if user.key == uid {
                    complition(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    func getEmail(YourQuery query:String , handler : @escaping((_ emailArray:[String])->())){
        var emailArray = [String]()
        ref_users.observe(.value) { (usersnapshot) in
            guard let usersnap = usersnapshot.children.allObjects as? [DataSnapshot] else {return}
            for user in usersnap{
                let email = user.childSnapshot(forPath: "email").value as! String
                if email.contains(query) && email != Auth.auth().currentUser?.email{
                    emailArray.append(email)
                }
            }
            handler(emailArray)
        }
    }
    
    func getIds(forUserList userlist : [String], handler : @escaping(_ uidArray : [String])->()){
        ref_users.observeSingleEvent(of: .value) { (usersnapshot) in
            var idArray = [String]()
            guard let userSnap = usersnapshot.children.allObjects as? [DataSnapshot] else {return}
            for user in userSnap {
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if userlist.contains(email)
                {
                    idArray.append(user.key)
                }
            }
            handler(idArray)
        }
    }
    func CreateGroup(title : String , description:String, userIDsList:[String],handler:@escaping((_ Done:Bool)->())){
        ref_goups.childByAutoId().updateChildValues(["title" : title, "description":description,"members":userIDsList])
        handler(true)
    }
    func GetAllGroups(handler : @escaping((_ groupArray:[Group])->())){
        var groupArray = [Group]()
        ref_goups.observeSingleEvent(of: .value) { (datasnapshot) in
            guard let groupsnap = datasnapshot.children.allObjects as? [DataSnapshot] else {return}
            for group in groupsnap{
                let memberArray = group.childSnapshot(forPath: "members").value as! [String]
                if memberArray.contains(Auth.auth().currentUser!.uid)
                {
                    let title = group.childSnapshot(forPath: "title").value as! String
                    let description = group.childSnapshot(forPath: "description").value as! String
                    
                    let group = Group(GroupTitle: title, GroupDesc: description, Key: group.key, members: memberArray)
                    groupArray.append(group)
                    
                }
            }
            handler(groupArray)
        }
        
    }
}
