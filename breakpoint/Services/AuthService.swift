//
//  AuthService.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation
import Firebase
class AuthService {
    static let instance = AuthService()
    
    func RegisterUser(forEmail email : String , forPassword password : String ,complition : @escaping ComplitionHandler){
        Auth.auth().createUser(withEmail: email, password: password) {
            (user, error) in
            guard let tocreatuser = user else{
                complition(false,error ?? "some error happen" as! Error)
                return
            }
            let userdata = ["provider":user?.user.providerID,"email":user?.user.email]
            DataService.instance.createUSer(uid: tocreatuser.user.uid, userdata: userdata)
            complition(true , nil)
        }
    }
    func login(forEmail email : String , forPassword password : String ,complition : @escaping ComplitionHandler){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                complition(false, error)
            }
            complition(true , nil )
            
        }
    }
}

