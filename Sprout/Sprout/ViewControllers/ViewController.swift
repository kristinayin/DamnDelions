//
//  ViewController.swift
//  LoginDemo
//
//  Created by Kristina Yin on 7/28/20.
//  Copyright © 2020 Kristina Yin. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Set up video in background
        setUpVideo()
    }

    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
        
    }
    
    func setUpVideo() {
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
        
        // no use if video can't be found
        guard bundlePath != nil else {
            return
        }
        
        // Get a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        // Create video player item
        let item = AVPlayerItem(url: url)
        
        // Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // Adjust the size and frame
        // height stays the same, blowing up width 4 times, positioning it left by 1.5 times the width (keeping y at 0)
        videoPlayerLayer?.frame = CGRect(x:-self.view.frame.size.width*1.47, y:0, width: self.view.frame.width*4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Display it and play it
        videoPlayer?.playImmediately(atRate: 0.9)
        
        // loop video
        
    }

}

