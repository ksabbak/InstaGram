//
//  SearchCollectionViewController.swift
//  InstagramChallenge
//
//  Created by Kanybek Zhagusaev on 2/8/16.
//  Copyright © 2016 south boske. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"



class SearchCollectionViewController: UICollectionViewController, UISearchDisplayDelegate, UISearchBarDelegate {

    var usersList = [String]()
    var marrFilteredUsersList = [String]()
    @IBOutlet weak var tblUsers: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()


        usersList = [ "park", "mountain", "vacation", "home", "street"]
        self.tblUsers.reloadData()
        
    }
    
//        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
//            return self.marrFilteredUsersList.count
//        }
//        
//        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
//            let cellCountry = self.tblUsers.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath)
//            
//            var countryName : string!
//            countryName = usersList[indexPath.row]
//            cellCountry.textLabel?.text = countryName
//            return cellCountry
//        }
//        
        
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


//    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellID", forIndexPath: indexPath)
    
        // Configure the cell
    
        return cell
    }

    
}
