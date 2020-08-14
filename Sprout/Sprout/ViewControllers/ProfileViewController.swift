//
//  ProfileViewController.swift
//  Sprout
//
//  Created by Zahra Khan on 7/27/20.
//  Copyright © 2020 Sanzida Sultana. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var lblProfileName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblProfileName.text="XxBatmanXx_"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
