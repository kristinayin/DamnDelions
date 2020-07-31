//
//  FeedsTableViewController.swift
//  Sprout
//
//  Created by Sanzida Sultana on 7/31/20.
//  Copyright © 2020 Sanzida Sultana. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class FeedsTableViewController: UITableViewController {
    
    
    // Keep track of all the posts
    var posts = [Post]()
    
    override func viewDidLoad() {
        // Download posts
        // Create a reference to the posts in the databbase
        Database.database().reference().child("photoPost").observe(.childAdded) { (snapshot) in
            
            // - gets called for each of the exisiting child
            // - gets called whenever a new child is added to photoPost
            
            // -Parse each of the post
            let newPost = Post(snapshot: snapshot)
            self.posts.append(newPost)
            
            DispatchQueue.main.async {
                // - Update the tableView
                self.tableView.reloadData()
            }
        }
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    // How each of the cells for the posted photos in the Feed woul  be displayed
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostedCells", for: indexPath) as! PostedPhotoTableViewCell
        let post = self.posts[indexPath.row]
        
        print("TableViewCell is working ")
        
        //Download the posts
        cell.post = post
        cell.selectionStyle = .none
        
        return cell
    }

}









