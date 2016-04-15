//
//  VideoViewController.swift
//  KDCircularProgressExample
//
//  Created by JAE HA LEE on 2016. 4. 15..
//  Copyright © 2016년 Kaan Dedeoglu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController {
    
    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let fileURL = NSURL(fileURLWithPath: "/Users/jaehalee/child.mp4")
        playerView = AVPlayer(URL: fileURL)
        
        playerViewController.player = playerView
        
        self.presentViewController(playerViewController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
