//
//  ProfileViewController.swift
//  InstaGram
//
//  Created by K Sabbak on 2/9/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        buildUser()
        
        // Do any additional setup after loading the view.
    }

    func buildUser()
    {
        let ref = Firebase(url: baseURL + "/users" + "/\(NSUserDefaults.standardUserDefaults().valueForKey("userID")!)")
        
        
        ref.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            let userDictionary = snapshot.value as? Dictionary<String, AnyObject>
            
            self.user = User(userDictionary: userDictionary!, user: NSUserDefaults.standardUserDefaults().valueForKey("userID")! as! String)
            self.updateProfile()
            
        })
        
    }
    
    
    
    func updateProfile()
    {
        titleLabel.text = user.userName
    }
}
