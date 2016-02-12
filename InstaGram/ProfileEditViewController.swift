//
//  ProfileEditViewController.swift
//  InstaGram
//
//  Created by K Sabbak on 2/9/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import UIKit
import Firebase

class ProfileEditViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildUser()
        
    }
    
    
    func buildUser()
    {
        let ref = Firebase(url: baseURL + "/users" + "/\(NSUserDefaults.standardUserDefaults().valueForKey("userID")!)")
        
        
        ref.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            let userDictionary = snapshot.value as? Dictionary<String, AnyObject>
            
            self.user = User(userDictionary: userDictionary!, user: NSUserDefaults.standardUserDefaults().valueForKey("userID")! as! String)
            self.updateFields()
            
        })
        
    }
    
    func updateFields()
    {
        if user.userPersonalName.characters.count > 0
        {
            nameTextField.text = user.userPersonalName
        }
        
        if user.userWeb.characters.count > 0
        {
            websiteTextField.text = user.userWeb
        }
        
        if user.userBio.characters.count > 0
        {
            bioTextField.text = user.userBio
        }
    }
    
    

    
    @IBAction func onLogoutButtonTapped(sender: UIButton)
    {
        
        //DataService.dataService.CURRENT_USER_REF.unauth()
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "userID")
       
    }
    

}
