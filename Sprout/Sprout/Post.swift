//
//  Post.swift
//  Sprout
//
//  Created by Sanzida Sultana on 7/31/20.
//  Copyright © 2020 Sanzida Sultana. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseStorage
import Firebase
import SwiftyJSON

// Dowload the Posts when the cells are shown

class Post {
    
    // Infomation a typical post would contain
    var caption: String!
    var imageDownloadURL: String?
    
    // store image locally to save it and use it
    private var image: UIImage!
    
    
    // initalize a post with an image and a caption
    init(image: UIImage, caption: String){
        self.image = image
        self.caption = caption
    }
    
    
    init(snapshot: DataSnapshot) {
        
        let json = JSON(snapshot.value)
        self.imageDownloadURL = json["imageDownloadURL"].stringValue
        self.caption = json["caption"].stringValue
        
    }
    //Save the Image to Firebase Database
    func saveTheImage() {
        
        // Create a new database reference with a new random ID
        let newPostRef = Database.database().reference().child("photoPost").childByAutoId()
        let newPostKey = newPostRef.key
        
        if let imageData = self.image.jpegData(compressionQuality: 0.6){
            
            // create a new storage reference
            let imageStorageRef = Storage.storage().reference().child("images").child("")
            let newImageRef = imageStorageRef.child(newPostKey!)
        
    
            // save the image to the storage
            newImageRef.putData(imageData, metadata: nil) { (snapshot, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
    
                newImageRef.downloadURL { (url, error) in
                    guard let url = url, error == nil else {
                        return
                    }
                    self.imageDownloadURL = url.absoluteString
                    print(self.imageDownloadURL)
                    
                    let newPostDictionay = [
                        "imageDownloadURL": self.imageDownloadURL,
                        "caption": self.caption
                    ]
                    print("Dictionary implementation succeeded")
                    
                    newPostRef.setValue(newPostDictionay)
                }

                print("success")
            }
        }
    }
}

