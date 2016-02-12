//
//  User.swift
//  
//
//  Created by K Sabbak on 2/11/16.
//
//

import Foundation

class User {

    let userID: String!
    let userName: String!
    let userEmail: String!
    let userBio: String!
    let followers: [String]
    var following: [String] = []
    
    
    
    init (userDictionary: [String:AnyObject], user: String)
    {
        userID = user
        userName = userDictionary["username"] as! String
        
        if let email = userDictionary["email"]
        {
            userEmail = email as! String
        }
        else
        {
            userEmail = ""
        }

        if let bio = userDictionary["bio"]
        {
            userBio = bio as! String
        }
        else
        {
            userBio = ""
        }
        
        if let users = userDictionary["followers"] as? [String:AnyObject]
        {
            
            followers = Array(users.keys)
        }
        else
        {
            followers = []
        }
    
        if let users = userDictionary["following"] as? [String:AnyObject]
        {
            following = Array(users.keys)
        }
        
        following.append(userID)
    }
    
}