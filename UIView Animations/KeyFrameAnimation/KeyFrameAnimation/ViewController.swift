//
//  ViewController.swift
//  KeyFrameAnimation
//
//  Created by Mazharul Huq on 9/4/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var durationLabel: UILabel!
        
    var originalCenter:CGPoint!
    var originalColor:UIColor!
    
    var duration:NSTimeInterval = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func  viewDidAppear(animated: Bool) {
        
        myView.center.y = 100
        durationLabel.text = String(format: "%0.1f sec", 2.0)
        originalCenter = myView.center
        originalColor = myView.backgroundColor
    }
    
    func animate(){
        
        var center: CGPoint = myView.center
        let opts:UIViewKeyframeAnimationOptions =
        UIViewKeyframeAnimationOptions.CalculationModeCubic
        
        UIView.animateKeyframesWithDuration(duration, delay: 0, options: opts, animations: {
            
            self.myView.backgroundColor = UIColor.blueColor()
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.20, animations: {
                center.x += 300
                center.y += 100
                self.myView.center = center
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.20, relativeDuration: 0.20, animations: {
                center.x -= 600
                center.y += 100
                self.myView.center = center
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.40, relativeDuration: 0.20, animations: {
                center.x += 600
                center.y += 100
                self.myView.center = center
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.60, relativeDuration: 0.20, animations: {
                center.x -= 600
                center.y += 100
                self.myView.center = center
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.80, relativeDuration: 0.20, animations: {
                center.x += 600
                center.y += 100
                self.myView.center = center
                
            })
            }
            , completion: {
                finished in
                self.myView.center = self.originalCenter
                self.myView.backgroundColor = self.originalColor
        })
        
    }
    
    @IBAction func durationChange(sender: AnyObject) {
        
        let slider = sender as UISlider
        let dur:Double = sender.value
        durationLabel.text = String(format: "%0.1f sec", dur)
        duration = NSTimeInterval(dur)
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        animate()
        
    }
}



