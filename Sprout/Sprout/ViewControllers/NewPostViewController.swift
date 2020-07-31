//
//  NewPostViewController.swift
//  Sprout
//
//  Created by Sanzida Sultana on 7/31/20.
//  Copyright © 2020 Sanzida Sultana. All rights reserved.
//

import UIKit
import GradientLoadingBar

class NewPostViewController: UIViewController, UITextViewDelegate
{
    
    @IBOutlet weak var selectedImage: UIImageView!
    
    @IBOutlet weak var caption: UITextView!
    
    var textViewPlaceHolder = "Add a Caption!!!"
    
    private let gradientLoadingBar = GradientLoadingBar()
    
    // Access to the Camera/PhotoLibary
    var imagePicker: UIImagePickerController!
    
    // Store the image the user pick
    var takedImage: UIImage!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // if the user picks the Camera
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
        }
        
        // If they use the photoLibary
        else {
            imagePicker.sourceType = .photoLibrary
        }
        self.present(imagePicker, animated: true, completion: nil)
        
        // Customize the Caption Text View
        caption.text = textViewPlaceHolder
        caption.textColor = .white
        caption.delegate = self
    }
    
    // User clicks the Share Button
    
    @IBAction func shareThisPost(_ sender: Any) {
        // Make sure we got the caption and the image
        if caption.text != "" && caption.text != textViewPlaceHolder && takedImage != nil
        {
            // Loading Bar appears when share button is touched
            gradientLoadingBar.fadeIn()
            let newPost = Post(image: self.takedImage, caption: self.caption.text)
            newPost.saveTheImage()
            print("Saved")
            
            gradientLoadingBar.fadeOut()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // when a user clicks the cancel button
    
    @IBAction func cancel(_ sender: Any) {
        gradientLoadingBar.fadeIn()
        // leaves the screen
        self.dismiss(animated: true, completion: nil)
        gradientLoadingBar.fadeOut()
    }
}


extension NewPostViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // User Picked a Picture
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        // Get the Image
        let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as! UIImage
        print("Picked an Image")
        self.takedImage = image
        self.selectedImage.image = self.takedImage
        self.dismiss(animated: true, completion: nil)
        print("Reterived the Image")
            
    }
    
    // User Did not pick a Picture and Canceled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancel Picture")
        self.dismiss(animated: true, completion: nil)

    }
    

    
}
