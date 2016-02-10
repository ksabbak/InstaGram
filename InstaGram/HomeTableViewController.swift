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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.translucent = false

        if NSUserDefaults.standardUserDefaults().valueForKey("userID") != nil && DataService.dataService.CURRENT_USER_REF.authData != nil {
            //self.performSegueWithIdentifier("LoginSegue", sender: nil)
        }
        else
        {
            self.performSegueWithIdentifier("LoginSegue", sender: nil)
        }

        
        let ref = Firebase(url: baseURL + "/photos")
        
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                self.photos = []
                
                for snap in snapshots {
                    let photoDictionary = snap.value as? Dictionary<String, AnyObject>
                
                    let newPhoto = PhotoPost(photoDictionary: photoDictionary!)
                    
                    self.photos.append(newPhoto)
                }
                   self.tableView.reloadData()
            
            }
            }, withCancelBlock: { error in
                                print(error.description)
            })
        
    }






    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if photos.count > 0
        {
            return photos.count
        }
        
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath)

        if photos.count > 0
        {
            cell.imageView?.image = UIImage(data: photos[indexPath.row].photoPhoto)
        }

        return cell
    }
    
   
    
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
