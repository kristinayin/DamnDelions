//
//  ProfilePostsViewController.swift
//  Sprout
//
//  Created by Hanan Abdorab on 8/14/20.
//  Copyright © 2020 Sanzida Sultana. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ProfilePostsViewController: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Posts")
    }
    }


    

   


