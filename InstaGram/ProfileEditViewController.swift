//
//  ProfileEditViewController.swift
//  InstaGram
//
//  Created by K Sabbak on 2/9/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import UIKit
//import

class ProfileEditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButtonTapped(sender: UIButton)
    {
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "userID")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
