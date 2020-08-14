//
//  ProfileViewController.swift
//  Sprout
//
//  Created by Zahra Khan on 7/27/20.
//  Copyright © 2020 Sanzida Sultana. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ProfileViewController: ButtonBarPagerTabStripViewController{
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var lblProfileName: UILabel!
    let greenColor = UIColor(red:0.13, green:0.73, blue:0.25, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblProfileName.text="XxBatmanXx_"
        settings.style.buttonBarBackgroundColor = .white
             settings.style.buttonBarItemBackgroundColor = .white
             settings.style.selectedBarBackgroundColor = greenColor
             settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
             settings.style.selectedBarHeight = 5.0
             settings.style.buttonBarMinimumLineSpacing = 0
             settings.style.buttonBarItemTitleColor = .black
             settings.style.buttonBarItemsShouldFillAvailableWidth = true
             settings.style.buttonBarLeftContentInset = 0
             settings.style.buttonBarRightContentInset = 0
             changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
             guard changeCurrentIndex == true else { return }
             oldCell?.label.textColor = .black
             newCell?.label.textColor = self?.greenColor
             }
       
        // Do any additional setup after loading the view.
    }
    

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
       let points = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PointsViewControllerID")
       let badges = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BadgesViewControllerID")
       let posts = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostsViewControllerID")
        let friends = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FriendsViewControllerID")
       return [points, badges, posts, friends ]
       }
    

}
