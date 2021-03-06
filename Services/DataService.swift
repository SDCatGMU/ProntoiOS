//
//  DataService.swift
//  Pronto
//
//  Created by Steve Sahayadarlin on 1/15/19.
//  Copyright © 2019 Steve Sahayadarlin. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_POSTS = DB_BASE.child("posts")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }

    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_POSTS: DatabaseReference {
        return _REF_POSTS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
