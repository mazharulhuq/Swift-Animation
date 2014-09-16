//
//  ThirdViewController.swift
//  CAKeyframeAnimation
//
//  Created by Mazharul Huq on 9/8/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var raceTrack = RaceTrack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        raceTrack.frame = CGRectMake(100, 100, 600, 600)
        self.view.layer.addSublayer(raceTrack)
        
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = raceTrack.trackPath.CGPath
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = 5
        anim.duration = 10.0
        raceTrack.car.addAnimation(anim, forKey: nil)
    }
}
