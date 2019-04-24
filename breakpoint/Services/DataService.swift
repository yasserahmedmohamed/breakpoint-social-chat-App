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
    
}
