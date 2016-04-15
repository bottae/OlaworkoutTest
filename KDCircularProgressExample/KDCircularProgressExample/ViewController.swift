//
//  ViewController.swift
//  KDCircularProgressExample
//
//  Created by Kaan Dedeoglu on 2/12/15.
//  Copyright (c) 2015 Kaan Dedeoglu. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    var progress: KDCircularProgress!
    var timer:NSTimer!
    var initialValueTimer = 5
    
   
    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    @IBOutlet weak var playButton: UIBarButtonItem!
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1.00, alpha: 1)
        
        progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        progress.startAngle = -90
        progress.progressThickness = 0.2
        progress.trackThickness = 0.2
        progress.trackColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.1)
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = false
        progress.glowMode = KDCircularProgressGlowMode.NoGlow
        progress.glowAmount = 0.9
        //progress.setColors(UIColor.cyanColor() ,UIColor.whiteColor(), UIColor.magentaColor(), UIColor.whiteColor(), UIColor.orangeColor())
        
        progress.setColors(UIColor.orangeColor() ,UIColor.orangeColor(), UIColor.orangeColor(), UIColor.orangeColor())
        //progress.center = CGPoint(x: view.center.x, y: view.center.y + 25)
        progress.center = CGPoint(x: 100, y: 100)
        view.addSubview(progress)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        
        
        
    }
    
    @IBAction func playButtonAction(sender: AnyObject) {
        
        progress.stopAnimation()
        
        progress.angle = 0
        
        initialValueTimer = 30
        
        progress.animateToAngle(360, duration: 30) { completed in
            if completed {
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
        
        let fileURL = NSURL(fileURLWithPath: "/Users/jaehalee/child.mp4")
        playerView = AVPlayer(URL: fileURL)
        
        playerViewController.player = playerView
        playerViewController.view.frame = CGRectMake(10,200,390,450)
        self.addChildViewController(playerViewController)
        
        self.view.addSubview(playerViewController.view)
        playerViewController.didMoveToParentViewController(self)
        playerViewController.showsPlaybackControls = false
        
        var playerLayer = AVPlayerLayer(player: self.playerView)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
        //playerViewController.player.AVPlayerLayer
        //playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        
        playerViewController.player?.play()
        
    }

    
    func updateTimer() {
        timerLabel.text = String(format:"%d", initialValueTimer)
        if initialValueTimer == 0 {
            initialValueTimer = 30
            progress.angle = 0
            
        } else {
            initialValueTimer -= 1
        }
    }
}

