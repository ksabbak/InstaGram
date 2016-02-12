//
//  SearchTableViewController.swift
//  InstaGram
//
//  Created by K Sabbak on 2/12/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import UIKit
import Firebase

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    var photos: [PhotoPost] = []
    //var user: User!
    var userArray: [User] = []
    var wantedUsers: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadListofUsers()
    }


    func buildUser(userIDString: String)
        {
            let ref = Firebase(url: baseURL + "/users" + "/\(userIDString)")
            
            ref.observeSingleEventOfType(.Value, withBlock: { snapshot in
                
//                if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
//                    
//                    for snap in snapshots {
//                        let userDictionary = snap.value as! Dictionary<String, AnyObject>
//                        
//                        print("helP")
//                        self.userArray.append(userDictionary["userName"] as! String)
//                    }
                
                    let userDictionary = snapshot.value as? Dictionary<String, AnyObject>
                
                    //print(userDictionary)
                
                    let newUser = User(userDictionary: userDictionary!, user: userIDString)
                
                    self.userArray.append(newUser)
                self.wantedUsers = self.userArray

                
                
                self.tableView.reloadData()
                
                
                
                //}
               
            })
            
        }
   
    
    func loadListofUsers(){
        print("A")
        let pathtoFile = Firebase(url: baseURL + "/users")
        pathtoFile.observeSingleEventOfType(.Value, withBlock: { snapshot in
//            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]
//            {
//                print("b")
//                print(snapshots.count)
            //for snap in snapshot.value as! [String:AnyObject] {
                
                    let userDictionary = snapshot.value as? Dictionary<String, AnyObject>
                    
                    print(userDictionary)
                    
                    let userIDs = Array(userDictionary!.keys)
                    
                    for userID in userIDs
                    {
                        self.buildUser(userID)
                        print("I am so sick of this")
                    }
                //}
                self.tableView.reloadData()

           // }
        })
    }
    

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if (searchText.isEmpty == false)
        {
            let searchString = searchBar.text! as String
            searchTextArray(searchString)
        }
        else
        {
            wantedUsers = userArray
        }
        
        tableView.reloadData()
    }
    
    
    func searchTextArray(searchText: String)
    {
        wantedUsers = []
        for item in userArray
        {
            if item.userName.containsString(searchText)
            {
                wantedUsers.append(item)
            }
        }
        
        
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(userArray.count)
        if userArray.count > 0
        {
            print("hi")
            print(wantedUsers.count)
            return wantedUsers.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("CellID")!
    
        
        cell.textLabel?.text = wantedUsers[indexPath.row].userName
        
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! FollowerProfileViewController
        
        let indexPath = self.tableView.indexPathForSelectedRow
        
        dvc.userFollower = wantedUsers[(indexPath?.row)!]

    }
    
    
}
