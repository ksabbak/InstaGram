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
    let photoPoster: String
    let photoPhoto: NSData
    
    
    init (photoDictionary: [String:AnyObject])
    {
        photoString = photoDictionary["photo"] as! String
        aboutPhoto = photoDictionary["about"] as! String
        photoPoster = photoDictionary["userID"] as! String  //THIS NEEDS TO BE FIXED
        
        
        photoPhoto = NSData(base64EncodedString: photoString, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)!
        
    }
    
    


}