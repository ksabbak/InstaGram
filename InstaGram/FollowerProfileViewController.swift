//
//  FollowerProfileViewController.swift
//  InstaGram
//
//  Created by K Sabbak on 2/12/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import UIKit
import Firebase

class FollowerProfileViewController: UIViewController {

    var userFollower: User!
    var selfUser: User!
    
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = userFollower.userName
        buildUser()
        


        
        
    }


    @IBAction func onFollowButtonTapped(sender: UIButton) {
        if followButton.titleLabel!.text == "Unfollow"
        {
            let ref = Firebase(url: baseURL + "/users" + "/\(NSUserDefaults.standardUserDefaults().valueForKey("userID")!)" + "/following" + "\(userFollower.userID)")
            ref.removeValue()
            
            let ref1 = Firebase(url: baseURL + "/users" + "/\(userFollower.userID)" + "/follower")
            ref1.removeValue()
            
            followButton.setTitle("Follow", forState: .Normal)
            
        }
        else
        {
            let ref = Firebase(url: baseURL + "/users" + "/\(NSUserDefaults.standardUserDefaults().valueForKey("userID")!)" + "/following")
            ref.updateChildValues([userFollower.userID:1])
            
            let ref1 = Firebase(url: baseURL + "/users" + "/\(userFollower.userID)" + "/follower")
            ref1.updateChildValues([selfUser.userID:1])
            
            followButton.setTitle("Unfollow", forState: .Normal)
            
        }
    }

    
    func buildUser()
    {
        let ref = Firebase(url: baseURL + "/users" + "/\(NSUserDefaults.standardUserDefaults().valueForKey("userID")!)")
        
        
        ref.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            let userDictionary = snapshot.value as? Dictionary<String, AnyObject>
            
            self.selfUser = User(userDictionary: userDictionary!, user: NSUserDefaults.standardUserDefaults().valueForKey("userID")! as! String)
            
            if self.selfUser.following.contains(self.userFollower.userID)
            {
                self.followButton.titleLabel?.text = "Unfollow"
            }
            
        })
        
    }

}
