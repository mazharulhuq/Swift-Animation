//
//  ViewController.swift
//  SpringingViewAnimation
//
//  Created by Mazharul Huq on 9/13/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var dampingLabel: UILabel!
    @IBOutlet weak var velocityLabel: UILabel!
    
    var damping = 0.5
    var velocity = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dampingLabel.text = String(format: "%0.1f sec", damping)
        velocityLabel.text = String(format: "%0.1f pt/sec", velocity)
        
    }

    func animate(damping: CGFloat, velocity: CGFloat){
        
        UIView.animateWithDuration(2.0, delay: 0.0, usingSpringWithDamping: damping,
                    initialSpringVelocity: velocity, options:UIViewAnimationOptions.allZeros ,
                    animations: {
                        var center = self.myView.center
                        center.y += 300
                       //Move myView center by 600 vertically down
                       self.myView.center = center
                }, completion:nil)
    }


    @IBAction func chooseDamping(sender: AnyObject) {
        let slider = sender as UISlider
        damping = sender.value
        dampingLabel.text = String(format: "%0.1f sec", damping)
        
    }

    @IBAction func chooseInitialVelocity(sender: AnyObject) {
        let slider = sender as UISlider
        velocity = sender.value
        velocityLabel.text = String(format: "%0.1f pt/sec", velocity)

    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        animate(CGFloat(damping), velocity: CGFloat(velocity))
    }
    
}

