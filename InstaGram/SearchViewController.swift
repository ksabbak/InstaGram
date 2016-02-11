//
//  SearchViewController.swift
//  InstaGram
//
//  Created by south boske on 2/11/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import UIKit
import Firebase

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    @IBOutlet weak var searchBar: UISearchBar!//not to be use up to know.
    @IBOutlet weak var tableView: UITableView!
    var ref = Firebase(url: baseURL + "/user")
    
    
    var usersName = [User]()
    var filteredUsers = [User]()
    var shouldShowSearchResults = false
    var searchActive: Bool = false
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        
        tableView.ref = self
        usersName = ConnectionManager.sharedManager.allUsers()
        loadListofUsers()
        configureSearchController()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (shouldShowSearchResults){
            return filteredUsers.count
        }
        else{
            return usersName.count
        }
    }

    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID"), forIndexPath: indexPath)

        
        if(shouldShowSearchResults){
            cell?.textLabel?.text = filteredUsers[indexPath.row]
        }
        else{
            cell?.textLabel?.text = usersName[indexPath.row]
        }
        return cell
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65.0
    }
    
    
    
    func loadListofUsers(){
        let pathtoFile = NSBundle.mainBundle().pathForResource(Firebase(url: baseURL + "/user"), ofType: url)
        if let path = pathtoFile{
            do{
                let users = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                usersName = usersData.componentSeparatedByString("\n")
                tblSearchResults.reloadData()
                
                
            }
        }catch _ {
            print("An Error Occurred")
        }
    }
    
    
    func configureSearchController(){
        searchController =  UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search Here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
    }
    
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        shouldShowSearchResults = true
        tableView.reloadData()
        //searchBar.resignFirstResponder()// not performing up to know.
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        shouldShowSearchResults = false
        tableView.reloadData()
        //searchBar.text = ""//
        //searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        if !shouldShowSearchResults{
            shouldShowSearchResults = true
            tableView.reloadData()
        }
        searchController.searchBar.resignFirstResponder()
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        
//        filteredUsers = usersName.filter({User) -> Bool in let
//            (url: baseURL + "/user"):NSString = User
//            return (url: baseURL + "/user").rangeOfString(searchString!. options:
//            NSStringCompareOptions.CaseInsentiveSearch).location) !=
//            NSNotFound
        
    })
        tableView.reloadData()
    
    
}








