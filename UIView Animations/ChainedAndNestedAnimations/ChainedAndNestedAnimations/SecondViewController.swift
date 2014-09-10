//
//  SecondViewController.swift
//  ChainedAndNestedAnimations
//
//  Created by Mazharul Huq on 9/4/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
                            
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var delayLabel: UILabel!
    
    
    var duration = 2.0
    var delay = 0.0
    var verticalMove: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let center: CGPoint = CGPointMake(100, 400)
        myView.center = center
    }
    
    func animate(option:UIViewAnimationOptions){
        
        UIView.animateWithDuration(2.0,animations: {
            var center = self.myView.center
            center.y -= 300
            self.myView.center = center
            self.myView.backgroundColor = UIColor.blueColor()
            UIView.animateWithDuration(self.duration, delay: self.delay, options:option,
                animations: {
                    var center = self.myView.center
                    if self.verticalMove{
                        center.y += 600
                    }
                    else{
                        center.x += 600
                    }
                    self.myView.center = center
                    self.myView.backgroundColor = UIColor.greenColor()
                }, completion:nil)
            
            }, completion:nil)
    }
    
    
    @IBAction func changeDuration(sender: AnyObject) {
        let slider = sender as UISlider
        let dur:Double = sender.value
        durationLabel.text = String(format: "%0.1f sec", dur)
        duration = NSTimeInterval(dur)
        myView.center = CGPointMake(100, 400)
        myView.backgroundColor = UIColor.redColor()
    }
    
    @IBAction func changeDelay(sender: AnyObject) {
        let slider = sender as UISlider
        let del:Double = sender.value
        delayLabel.text = String(format: "%0.1f sec", del)
        delay = NSTimeInterval(del)
        myView.center = CGPointMake(100, 400)
        myView.backgroundColor = UIColor.redColor()
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        let opt = UIViewAnimationOptions.allZeros
        animate(opt)
    }
    
    @IBAction func chooseMoveOption(sender: AnyObject) {
        let segment = sender as UISegmentedControl
        
        if segment.selectedSegmentIndex == 0{
            verticalMove = true
        }
        else{
            verticalMove = false
        }
        myView.center = CGPointMake(100, 400)
        myView.backgroundColor = UIColor.redColor()
        
    }
    

}

