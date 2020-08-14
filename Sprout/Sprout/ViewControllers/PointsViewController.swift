//
//  PointsViewController.swift
//  Sprout
//
//  Created by Sanzida Sultana on 8/13/20.
//  Copyright © 2020 Sanzida Sultana. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PointsViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var checkBox: UIButton!
        
    @IBOutlet weak var checkBox2: UIButton!
        
    @IBOutlet weak var checkBox3: UIButton!
        
    @IBOutlet weak var checkBox4: UIButton!
        
    @IBOutlet weak var checkBox5: UIButton!
        
    @IBOutlet weak var treeIcon: UIImageView!
        
    var treeImages: [UIImage] = []
        
    let levels = "Sapling"
            
    @IBOutlet weak var currentPoints: UILabel!
        
    @IBOutlet weak var currentLevel: UILabel!

    @IBOutlet weak var numberOfPoints: UILabel!
        
    @IBOutlet weak var points: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // When user finishes a task and checks it off buttons
        
    @IBAction func checkedBox1Tapped(_ sender: Any) {
        
        // when user taps all the checkBoxes
        print("User signed petition")
            
        // Change the Image for the checkBox
        let completedTheTasks = UIImage(named: "checked") as UIImage?
            
        checkBox.setImage(completedTheTasks, for: .normal)
            
        if let url = URL(string: "https://www.change.org/m/stop-the-dakota-access-pipeline")
        {
            UIApplication.shared.open(url)
        }

    }
        
    @IBAction func checkedBox2Taped(_ sender: Any) {
            
        print("User created a new event")
                  
        // Change the Image for the checkBox
        let completedTheTasks = UIImage(named: "checked") as UIImage?
                  
        checkBox2.setImage(completedTheTasks, for: .normal)

    }
        
        
    @IBAction func checkedBox3(_ sender: Any) {
        
        print("User posted an Image")
              
        // Change the Image for the checkBox
        let completedTheTasks = UIImage(named: "checked") as UIImage?
              
        checkBox3.setImage(completedTheTasks, for: .normal)
            
        numberOfPoints.text = "20"
    }
        

    @IBAction func checkedBox4(_ sender: Any) {
        
        print("User donated")
                  
        // Change the Image for the checkBox
        let completedTheTasks = UIImage(named: "checked") as UIImage?
                  
        checkBox4.setImage(completedTheTasks, for: .normal)

    }

    @IBAction func checkedBox5(_ sender: Any) {
        
        print("User attened event")
                  
        // Change the Image for the checkBox
        let completedTheTasks = UIImage(named: "checked") as UIImage?
                  
        checkBox5.setImage(completedTheTasks, for: .normal)
            
        numberOfPoints.text = "0"
        
        upgradingLevel()
        
    }
        
    func upgradingLevel() {
            
        print("Upgraded a Level")
        
        if numberOfPoints.text == "0" {
            
            let role = "Sprout"
            let nextLevelPoints = "You are currently 100 points away from being a Sprout"
            
            currentLevel.text = role
            currentLevel.textColor = UIColor.init(red: 76/255, green: 153/255, blue: 0/255, alpha: 1)
            currentPoints.text = "You are currently a with 237 points"
            
            treeIcon.image = UIImage(named: "tree-0")
            treeIcon.alpha = 0
            treeIcon.image = UIImage(named: "tree-1")
            treeIcon.alpha = 1
            
            points.text = nextLevelPoints
                
        }
        
        }
    
   func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
       return IndicatorInfo(title: "Points")
   }
}
