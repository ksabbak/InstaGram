//
//  LoginViewController.swift
//  InstagramChallenge
//
//  Created by Kanybek Zhagusaev on 2/8/16.
//  Copyright © 2016 south boske. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UIActionSheetDelegate {
    var authHelper: TwitterAuthHelper!
    var accounts: [ACAccount]!
    var ref: Firebase!
        @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Firebase(url:"https://instantgram.firebaseIO.com")

        authHelper = TwitterAuthHelper(firebaseRef:ref, apiKey: "l89MUHyl9PJMrEh6dwZldWouc")
    }

    @IBAction func tryLogin(sender: AnyObject) {
        
        let email = emailField.text
        let password = passwordField.text
        
        if email != "" && password != "" {
            
            // Login with the Firebase's authUser method
            
            DataService.dataService.BASE_REF.authUser(email, password: password, withCompletionBlock: { error, authData in
                
                if error != nil {
                    print(error)
                    self.loginErrorAlert("Oops!", message: "Check your username and password.")
                } else {
                    
                    // Be sure the correct uid is stored.
                    
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "userID")
                    
                    // Enter the app!
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            })
            
        } else {
            
            // There was a problem
            
            loginErrorAlert("Oops!", message: "Don't forget to enter your email and password.")
        }
    }
    
    func loginErrorAlert(title: String, message: String) {
        
        // Called upon login error to let the user know login didn't work.
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func twitterButtonPressed(sender: UIButton) {
        self.authWithTwitter()
        
    }
    
  
    
    func authWithTwitter() {
        authHelper.selectTwitterAccountWithCallback { (error, accounts) -> Void in
            self.accounts = accounts as! [ACAccount]
            self.handleMultipleTwitterAccounts(self.accounts)
        }
    }
    
    func authAccount(account: ACAccount) {
        authHelper.authenticateAccount(account, withCallback: { (error, authData) -> Void in
            if error != nil {
                // There was an error authenticating
            } else {
                // We have an authenticated Twitter user
                NSLog("%@", authData)
                // segue to chat
//                self.performSegueWithIdentifier("twitterLogin", sender: authData)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }
    
    func selectTwitterAccount(accounts: [ACAccount]) {
        let actionSheetController: UIAlertController = UIAlertController(title: "Select Twitter Account", message: "Swiftly Now! Choose an option!", preferredStyle: .ActionSheet)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
        }
//
//        let selectUserActionSheet = UIActionSheet(title: "Select Twitter Account", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Destruct", otherButtonTitles: "Other")
        
        for account in accounts {
            let buttonTitle :UIAlertAction = UIAlertAction(title: account.username, style: .Default , handler: { (UIAlertAction) -> Void in
                
            })
            actionSheetController.addAction(buttonTitle)
        }
        actionSheetController.addAction(cancelAction)
//        actionSheetController.showInView(self.view);
    }
    
    func handleMultipleTwitterAccounts(accounts: [ACAccount]) {
        switch accounts.count {
        case 0:
            UIApplication.sharedApplication().openURL(NSURL(string: "https://twitter.com/signup")!)
        case 1:
            self.authAccount(accounts[0])
        default:
            self.selectTwitterAccount(accounts)

    }

//    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
//        let currentTwitterHandle = actionSheet.buttonTitleAtIndex(buttonIndex)
//        for acc in accounts {
//            if acc.username == currentTwitterHandle {
//                self.authAccount(acc)
//            }
//        }
//        
//    }
    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        let messagesVc = segue.destinationViewController as! HomeTableViewController
//        if let authData = sender as? FAuthData {
//            messagesVc.user = authData
//            messagesVc.ref = ref
//            messagesVc.sender = authData.providerData["username"] as! String
//        }
}

}

    


