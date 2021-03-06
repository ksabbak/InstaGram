//
//  CameraViewController.swift
//  InstagramChallenge
//
//  Created by K Sabbak on 2/7/16.
//  Copyright © 2016 south boske. All rights reserved.
//

import UIKit
import Firebase

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    var ref: Firebase!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
        
//        let tempRef = Firebase(url: baseURL + "/photos")
//        
//        tempRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
//            
//            if snapshot.hasChild("/\(NSUserDefaults.standardUserDefaults().valueForKey("userID")!)")
//            {
//            }
//            else
//            {
//                tempRef.setValue("/\(NSUserDefaults.standardUserDefaults().valueForKey("userID")!)")
//            }
//            
//            })
        ref = Firebase(url: baseURL + "/photos" + "/\(NSUserDefaults.standardUserDefaults().valueForKey("userID")!)")
        print("\(ref)")
    }
    
    
    @IBAction func onGetFromLibraryTapped(sender: UIButton)
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true;
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func onGetFromCameraTapped(sender: AnyObject)
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true;
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        imageView.image = chosenImage
        picker.dismissViewControllerAnimated(true, completion: nil)
        shareButton.enabled = true
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onShareButtonTapped(sender: UIButton)
    {
        uploadPhoto()
        imageView.image = nil
        textView.text = ""
        shareButton.enabled = false
    }
    
    func uploadPhoto()
    {
        //let postRef = ref.childByAppendingPath("posts")
        var aboutPhoto = ""
        
        if textView.text != "Tap to add description" && textView.text.isEmpty == false
        {
            aboutPhoto = textView.text
        }
        
        let smallerPhoto = (UIImageJPEGRepresentation(imageView.image!, 0.6))!
        
        let photoUpload = smallerPhoto.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        

        
        let post1 =  [String(timestamp): ["photo": photoUpload, "about": aboutPhoto]]
        //let post1Ref = ref.setValue(timestamp)
        ref.setValue(post1)
    }

    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"
        {
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }

    
}

