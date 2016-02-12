//
//  PhotoPost.swift
//  InstaGram
//
//  Created by K Sabbak on 2/10/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import Foundation
//import UIKit

class PhotoPost{

    let photoString: String
    let aboutPhoto: String
    let photoUser: String
    let photoPhoto: NSData
    let photoTime: Int
    
    
    init (photoDictionary: [String:AnyObject], photoKey: String, photoPoster: String)
    {
        photoString = photoDictionary["photo"] as! String
        aboutPhoto = photoDictionary["about"] as! String
        photoUser = photoPoster
        photoTime = Int(photoKey)!
        
        
        photoPhoto = NSData(base64EncodedString: photoString, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)!
        
    }
    
    


}