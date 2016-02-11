//
//  DetailViewController.swift
//  
//
//  Created by K Sabbak on 2/10/16.
//
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var photo: PhotoPost!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(data: photo.photoPhoto)
       
    }


}
