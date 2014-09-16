//
//  SecondViewController.swift
//  CAKeyframeAnimation
//
//  Created by Mazharul Huq on 9/8/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
                            
    @IBOutlet weak var pendulumView: PendulumView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   

    @IBAction func buttonPressed(sender: AnyObject) {
        
        let p = pendulumView.layer as PendulumLayer
        let pendulum = p.pendulum!
        
        var values = [Double]()
        values.append(0.0)
        var sign = 1.0
        for ( var i = 5.0; i < 60.0; i += 5.0){
             sign = -1*sign
             let item = sign*(3.14/i)
             values.append(item)
        }
        values.append(0.0)
        
        let anim = CAKeyframeAnimation(keyPath:"transform")
        anim.values = values
        anim.duration = 5.0
        anim.valueFunction =
                  CAValueFunction(name:kCAValueFunctionRotateZ)
        anim.additive = true
        pendulum.addAnimation(anim, forKey:nil)
    }

}

