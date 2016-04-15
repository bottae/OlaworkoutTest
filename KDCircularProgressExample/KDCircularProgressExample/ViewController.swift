//
//  ViewController.swift
//  KDCircularProgressExample
//
//  Created by Kaan Dedeoglu on 2/12/15.
//  Copyright (c) 2015 Kaan Dedeoglu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var progress: KDCircularProgress!
    var timer:NSTimer!
    var initialValueTimer = 5
    
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
    }
    
    @IBAction func sliderDidChangeValue(sender: UISlider) {
        progress.angle = Int(sender.value)
    }
    
    @IBAction func animateButtonTapped(sender: UIButton) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        
        progress.animateToAngle(360, duration: 5) { completed in
            if completed {
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
    }
    
    func updateTimer() {
        timerLabel.text = String(format:"%d", initialValueTimer)
        if initialValueTimer == 0 {
            initialValueTimer = 5
        } else {
            initialValueTimer -= 1
        }
    }
}

