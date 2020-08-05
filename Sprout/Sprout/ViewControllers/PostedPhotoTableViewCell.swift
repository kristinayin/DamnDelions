//
//  PostedPhotoTableViewCell.swift
//  Sprout
//
//  Created by Sanzida Sultana on 7/31/20.
//  Copyright © 2020 Sanzida Sultana. All rights reserved.
//

import UIKit
import Firebase

class PostedPhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postedImage: UIImageView!
    @IBOutlet weak var shadowBackgroundPostedView: UIView!
    @IBOutlet weak var postedCaption: UILabel!
    @IBOutlet weak var postedProfilePic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var shadowBackgroundProfile: UIView!
    
    
    // Retrieve the posts
    var post: Post! {
        didSet {
            self.updatedTableViewCell()
        }
    }
    
    

    // Function to update the tableViewCell for the posts
    func updatedTableViewCell() {
        
        // Caption View
        shadowBackgroundPostedView.layer.shadowPath = UIBezierPath(rect: shadowBackgroundPostedView.bounds).cgPath
        
        shadowBackgroundPostedView.layer.shadowColor = UIColor.black.cgColor
                
        shadowBackgroundPostedView.layer.shadowOpacity = 0.1
                
        shadowBackgroundPostedView.layer.shadowOffset = CGSize(width: 2, height: 2)
                
        shadowBackgroundPostedView.layer.shadowRadius = 2
                
        shadowBackgroundPostedView.layer.masksToBounds = false
                
        shadowBackgroundPostedView.layer.cornerRadius = 0.3
        
        // UserName View
        shadowBackgroundProfile.layer.shadowPath = UIBezierPath(rect: shadowBackgroundPostedView.bounds).cgPath
        
        shadowBackgroundProfile.layer.shadowColor = UIColor.black.cgColor
                
        shadowBackgroundProfile.layer.shadowOpacity = 0.1
                
        shadowBackgroundProfile.layer.shadowOffset = CGSize(width: 2, height: 2)
                
        shadowBackgroundProfile.layer.shadowRadius = 2
                
        shadowBackgroundProfile.layer.masksToBounds = false
                
        shadowBackgroundProfile.layer.cornerRadius = 0.3
                
        // change the caption
        self.postedCaption.text = post.caption
                
        // Download the uploaded photos from the database to the cell
        if let imageDownloadURL = post.imageDownloadURL {
            print("Able to retrieve posts from database")
            // storage reference
            let postedImageStorageRef = Storage.storage().reference(forURL: imageDownloadURL)
                    
            // observe method to download the data of 2Megadatabytes
            postedImageStorageRef.getData(maxSize: 2 * 1024 * 1024)  { [weak self] (data, error) in
                if let error = error {
                    print("ERROR WHEN DOWNLOADING IMAGE: \(error)")
                }
                else {
                    // Image downloaded successfully
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            // put the image into the imageView
                            self?.postedImage.image = image
                        }
                    }
                }
            }
        }
    }

}
