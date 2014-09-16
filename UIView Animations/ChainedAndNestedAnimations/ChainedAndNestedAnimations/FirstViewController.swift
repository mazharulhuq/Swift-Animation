//
//  FirstViewController.swift
//  ChainedAndNestedAnimations
//
//  Created by Mazharul Huq on 9/4/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
                            
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    var duration = 2.0
    var delay = 0.0
    var verticalMove: Bool = true
    var beginFromCurrentState = false
    
    
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
                        }, completion:nil)
        
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
        

    }

    func animate(){
        
        UIView.animateWithDuration(2.0,animations: {
            var center = self.myView.center
            center.y -= 300
            self.myView.center = center
            self.myView.backgroundColor = UIColor.blueColor()
            }, completion:nil)
        
        UIView.animateWithDuration(2.0,animations: {
            var center = self.myView.center
            center.y += 600
            self.myView.center = center
            self.myView.backgroundColor = UIColor.greenColor()
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
        
        var opt:UIViewAnimationOptions!
        if beginFromCurrentState{
            println("Hello")
            opt = UIViewAnimationOptions.BeginFromCurrentState
        }
        else{
            opt = UIViewAnimationOptions.allZeros
        }
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
    
    @IBAction func chooseOption(sender: AnyObject) {
        let onOff = sender as UISwitch
        if onOff.on {
            beginFromCurrentState = true
        }
        else{
            beginFromCurrentState = false
        }
        myView.center = CGPointMake(100, 400)
        myView.backgroundColor = UIColor.redColor()
    }
}

