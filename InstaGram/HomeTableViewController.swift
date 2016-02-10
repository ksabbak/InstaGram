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
        
        ref.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    let photoDictionary = snap.value as? Dictionary<String, AnyObject>
                
                    let newPhoto = PhotoPost(photoDictionary: photoDictionary!)
                    self.photos.append(newPhoto)
                    
                    
                }
            }
            self.tableView.reloadData()
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
