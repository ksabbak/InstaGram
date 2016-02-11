//
//  HomeTableViewController.swift
//  InstagramChallenge
//
//  Created by Kanybek Zhagusaev on 2/8/16.
//  Copyright © 2016 south boske. All rights reserved.
//

import UIKit
import Firebase

class HomeTableViewController: UITableViewController {
    
    var photos = [PhotoPost]()
    var followings = [String]()
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:"CellID")
        
        self.navigationController?.navigationBar.translucent = false

        if NSUserDefaults.standardUserDefaults().valueForKey("userID") != nil && DataService.dataService.CURRENT_USER_REF.authData != nil {
            //self.performSegueWithIdentifier("LoginSegue", sender: nil)
        }
        else
        {
            self.performSegueWithIdentifier("LoginSegue", sender: nil)
        }
        
        createFollowingList()
        
        


    }



    func createFollowingList()
    {
        let ref = Firebase(url: baseURL + "/users" + "/\(NSUserDefaults.standardUserDefaults().valueForKey("userID")!)" + "/following")
        
        followings = []
        print("1")
        print(ref)
        
        ref.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            if snapshot.exists()
            {
                print("2")
//                let followRef = Firebase(url: "\(ref)" + "/following")
//                followRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
                
                    print("3")
                    
                    if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                    
                    for snap in snapshots
                    {
                        let following = snap.key as String
                        
                        self.followings.append(following)
                        print("gets hit")
                        self.getThePhotos()
                    }
                    
                }
            }
                    }, withCancelBlock: { error in
                        print(error.description)
                
            
                })
        
//            }, withCancelBlock: { error in
//                print(error.description)
//        })
        //self.tableView.reloadData()
        
        
    }
    
    func getThePhotos()
    {
        print("Hi")
        
        if followings.count > 0
        {
            
            for user in followings
            {
                
                let ref = Firebase(url: baseURL + "/photos" + "/\(user)")
                ref.observeEventType(.Value, withBlock: { snapshot in
                    
                    if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                        
                        self.photos = []
                        
                        for snap in snapshots {
                            let photoDictionary = snap.value as? Dictionary<String, AnyObject>
                            
                            let newPhoto = PhotoPost(photoDictionary: photoDictionary!, photoKey: snap.key)
                            
                            self.photos.append(newPhoto)
                        }
                        
                        self.tableView.reloadData()
                        
                    }
                    }, withCancelBlock: { error in
                        print(error.description)
                })
            }
        }
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if photos.count > 0
        {
            return photos.count
        }
        
        return 1
    }
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -&gt; UITableViewCell {
//    
//    var cell:CustomTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("CellID") as! CustomTableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath)

        if photos.count > 0
        {
            cell.imageView?.image = UIImage(data: photos[indexPath.row].photoPhoto)
        }
        else
        {
            cell.textLabel?.text = "Welcome!"
            cell.detailTextLabel?.text = "It doesn't look like you're following anyone yet! \n Click on the search function to find some people to follow!"
            cell.detailTextLabel?.numberOfLines = 0
        }

        return cell
    }

    
//    cell.imageVW.image = UIImage(data: photos[indexPath.row].photoPhoto)
//    
//    cell.label.text = self.photos[indexPath.row].photosPoster
//    
//    return cell
//    }
   
    
    //MARK: - Prepare for Segue
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailSegue"
        {
            let dvc = segue.destinationViewController as! DetailViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow
            
            dvc.photo = photos[(indexPath?.row)!]
            
            
            
            
        }
    }

  
}
