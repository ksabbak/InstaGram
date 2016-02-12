//
//  DetailViewController.swift
//  
//
//  Created by K Sabbak on 2/10/16.
//
//

import UIKit
import Firebase
class DetailViewController: UIViewController {
    var ref = Firebase(url:"https://instantgram.firebaseio.com/photos/twitter")
    
    @IBOutlet weak var label: UILabel!
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    var photo: PhotoPost!
    var descPhoto: PhotoPost!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(data: photo.photoPhoto)
        //        label.text = descPhoto.aboutPhoto
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            print(snapshot.value.objectForKey("about"))
            self.label.text = "\(snapshot.value.objectForKey("about"))"
        })
    }
    
    
}