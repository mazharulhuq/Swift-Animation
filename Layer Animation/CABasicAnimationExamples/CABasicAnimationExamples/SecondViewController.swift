//
//  SecondViewController.swift
//  CABasicAnimationExamples
//
//  Created by Mazharul Huq on 9/14/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var pendulumView: PendulumView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var additiveSwitch: UISwitch!
    
    var additive = false
    var pendulum:CALayer!
    
    
     override func viewDidAppear(animated: Bool) {
        var p = pendulumView.layer as PendulumLayer
        self.pendulum = p.pendulum
        label.text = "If not vertical, pendulum will be restored vertical before animation. Additive applies only for Oscillation Using valueFunction."

    }
    
    func restore(){
        pendulum.transform = CATransform3DIdentity
    }

    func rotatePendulum(){

        let startValue = pendulum.transform
        let endValue = CATransform3DRotate(startValue, CGFloat(M_PI/2.0), 0, 0, 1)
        CATransaction.setDisableActions(true)
        pendulum.transform = endValue
        let anim = CABasicAnimation(keyPath:"transform")
        anim.duration = 2.0
        anim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear)
        anim.fromValue = NSValue(CATransform3D:startValue)
        anim.toValue = NSValue(CATransform3D:endValue)
        pendulum.addAnimation(anim, forKey:nil)
    }
    
    
    func oscillatePendulum(){
        let origValue = pendulum.transform
        let startValue = CATransform3DRotate(origValue, CGFloat(-M_PI/8.0), 0, 0, 1)
        let endValue = CATransform3DRotate(origValue, CGFloat(M_PI/8.0), 0, 0, 1)
        let anim = CABasicAnimation(keyPath:"transform")
        anim.duration = 2.0
        anim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear)
        anim.fromValue = NSValue(CATransform3D:startValue)
        anim.toValue = NSValue(CATransform3D:endValue)
        anim.repeatCount = 3
        anim.autoreverses = true
        pendulum.addAnimation(anim, forKey:nil)
        
    }
    
    func oscillatePendulumWithValueFunction(){
        if additive {
            pendulum.transform = CATransform3DRotate(pendulum.transform, CGFloat(-M_PI/4.0), 0, 0, 1)
        }
        let anim = CABasicAnimation(keyPath:"transform")
        anim.duration = 1.0
        anim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear)
        anim.repeatCount = 3
        anim.autoreverses = true
        if additive {
           anim.additive = true
        }
        anim.valueFunction = CAValueFunction(name:kCAValueFunctionRotateZ)
        anim.fromValue = -M_PI/6
        anim.toValue = M_PI/6
        pendulum.addAnimation(anim, forKey:nil)
    }

    @IBAction func chooseAnimation(sender: AnyObject) {
        let seg = sender as UISegmentedControl
        restore()
        switch seg.selectedSegmentIndex{
        
        case 0:
           rotatePendulum()
            
        case 1:
            oscillatePendulum()
        case 2:
            oscillatePendulumWithValueFunction()
        default:
            println("Should not be here")
        }
    }
    
    @IBAction func chooseAdditive(sender: AnyObject) {
        let sw = sender as UISwitch
        if sw.on {
            additive = true
        }
        else{
            additive = false
        }
    }

}

