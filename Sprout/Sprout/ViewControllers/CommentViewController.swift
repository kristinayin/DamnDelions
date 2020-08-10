//
//  CommentViewController.swift
//  Sprout
//
//  Created by Sanzida Sultana on 8/9/20.
//  Copyright © 2020 Sanzida Sultana. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    
    @IBOutlet weak var userComment: UITextField!
    
    @IBOutlet weak var batmanComment: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitComments(_ sender: Any) {
        
        print("User added a comment")
        batmanComment.text = userComment.text
        
    }
    
}
