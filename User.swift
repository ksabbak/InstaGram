//
//  User.swift
//  InstaGram
//
//  Created by south boske on 2/11/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import Foundation

import UIKit

class User {
    var UID:        String
    var username:   String
    var email:      String
    var image:      UIImage
    
    init(username: String, email: String) {
        self.UID        = ""
        self.username   = username
        self.email      = email
        image           = UIImage()
}
}