//
//  ViewController.swift
//  ImplicitLayerAnimation
//
//  Created by Mazharul Huq on 9/5/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    let layer:CALayer = CALayer()
    var reverse = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        layer.bounds = CGRectMake(0, 0, 300, 200)
        layer.position = CGPointMake(200, 170)
        layer.backgroundColor = UIColor.redColor().CGColor
        layer.borderWidth = 2
        layer.borderColor = UIColor.blueColor().CGColor
        self.view.layer.addSublayer(layer)
        
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        CATransaction.setAnimationDuration(3.0)
        
        let timingFunction = CAMediaTimingFunction(controlPoints:
                                             0.9, 0.1, 0.5, 0.8)
        CATransaction.setAnimationTimingFunction(timingFunction)
        
        if reverse{
            layer.borderWidth = 2
            layer.borderColor = UIColor.blueColor().CGColor
            layer.transform = CATransform3DRotate(layer.transform,
               CGFloat(-M_PI)/4.0, 0, 0, 1)
            layer.position = CGPointMake(200, 170)
        }
        else{
            layer.borderWidth = 40
            layer.borderColor = UIColor.greenColor().CGColor
            layer.transform = CATransform3DRotate(layer.transform,
                CGFloat(M_PI)/4.0, 0, 0, 1)
            layer.position = CGPointMake(500, 600)
        }
        reverse = !reverse
                CATransaction.setCompletionBlock({ println("Completion visited")})
    }

}

