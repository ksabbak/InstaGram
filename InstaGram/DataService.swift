//
//  DataService.swift
//  InstaGram
//
//  Created by K Sabbak on 2/8/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import Foundation
import Firebase

//I probably shouldn't put this here, but it seems like a logical place to put this global constant?
let baseURL = "https://instantgram.firebaseIO.com"


class DataService {
    static let dataService = DataService()
    
    private var _BASE_REF = Firebase(url: "\(baseURL)")
    private var _USER_REF = Firebase(url: "\(baseURL)/users")
    
    var BASE_REF: Firebase {
        return _BASE_REF
    }
    
    var USER_REF: Firebase {
        return _USER_REF
    }
    
    var CURRENT_USER_REF: Firebase {
        let userID = NSUserDefaults.standardUserDefaults().valueForKey("userID") as? String
        
        let currentUser = Firebase(url: "\(BASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
        
        return currentUser!
    }
    
    func createNewAccount(uid: String, user: Dictionary<String, String>) {
        
        // A User is born.
        
        USER_REF.childByAppendingPath(uid).setValue(user)
    }
}