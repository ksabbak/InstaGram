////
////  ProfileViewController.swift
////  InstaGram
////
////  Created by Frank Tellez on 2/11/16.
////  Copyright © 2016 Tellez All rights reserved.
////  It's so cool to work late night...  Pretty silent and paceful.
////  Aca esta el codigo para editar los datos del usuario
////  asi como para quitar e introducir nuevas fotos.
////  Que hermosura, y al que no le guste, pues que se ponga a traducir.
//
//import Foundation
//import UIKit
//
//class ProfileViewController: UIViewController, UINavigationControllerDelegate,
//UIImagePickerControllerDelegate, UITextFieldDelegate{
//    
//    //salidas para usuarion, biografia y foto.
//    
//    @IBOutlet weak var onUsername: UITextField!
//    @IBOutlet weak var onBiogra: UITextField!
//    @IBOutlet weak var imageView: UIImageView!
//    
//    
//    // declaracion de variable de usuario.
//    var user: User
//    
//    
//    
//    //condicional para modificar texto en las entradas de texto.
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        if user.username = nil{
//            onUsername.text = user.username
//        }
//        if user.biogra = nil{
//            onBiogra.text = user.biogra
//        }
//        if user.image = nil{
//            imageView.image = user.image
//        }
//    }
//    
//    //metodo sin uso
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    
//    
//    //metodo para reescribir anulando la siguiente entrada de texto
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        if textField.isEqual(onUsername){
//            onBiogra.becomeFirstResponder()
//        }
//        else if textField.isEqual(onBiogra){
//            onBiogra.resignFirstResponder()
//        }
//        return true
//    }
//    
//    
//    
//    //metodo para introducir una foto nueva. tomar
//    func imagePickerController(taker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
//        imageView.image = image
//        taker.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    
//    
//    
//    //metodo que anuncia con un cuadro de alerta sobre el cambio de foto.
//    @IBAction func onEditImage(sender: UIButton) {
//        
//        let edit = UIAlertController(title: "A new Picture", message: nil, preferredStyle: .ActionSheet)
//        edit.addAction(UIAlertAction(title: "Pic will be deleted", style: .Destructive) { (action) -> Void in})
//        
//        
//        edit.addAction(UIAlertAction(title: "Take a Pic", style: .Default){ (action) -> Void in
//            let taker = UIImagePickerController()
//            taker.delegate = self
//            taker.sourceType = .Camera
//            self.presentViewController(taker, animated: true, completion: nil)
//            })
//        
//        
//        //metodo para implementar una action de guardar en cambio de foto.
//        @IBAction func onDoneButton(sender: UIBarButtonItem) {
//        }
//        
//        //metodo que releva la foto sobre cancel.
//        @IBAction func onCancelButton(sender: UIBarButtonItem) {
//            dismissViewControllerAnimated(true, completion: nil)
//        }
//    }
//}