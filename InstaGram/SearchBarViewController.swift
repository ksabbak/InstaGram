//
//  SearchBarViewController.swift
//  InstaGram
//
//  Created by south boske on 2/9/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        //every time the text changes in the search bar, this gets called
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellID", forIndexPath: indexPath) as! SearchCollectionViewCell
//        cell.imageView.image = UIImage(named: <#T##String#>)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
}
