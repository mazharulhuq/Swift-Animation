//
//  ThirdViewController.swift
//  CABasicAnimationExamples
//
//  Created by Mazharul Huq on 9/15/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var outerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        let ba1 = CABasicAnimation(keyPath: "bounds")
        var f = self.innerView.layer.bounds
        f.size.width = self.outerView.layer.bounds.size.width-20
        f.size.height = self.outerView.layer.bounds.size.height-20
        self.innerView.layer.bounds = f
        ba1.autoreverses = true
        ba1.repeatCount = 5
        
        self.innerView.layer.addAnimation(ba1, forKey: nil)
        
        let ba2 = CABasicAnimation(keyPath: "position")
        var p = self.innerView.layer.position
        p.x = CGRectGetMidX(self.outerView.layer.bounds)
        p.y = CGRectGetMidY(self.outerView.layer.bounds)
        self.innerView.layer.position = p
        ba2.autoreverses = true
        ba2.repeatCount = 2
        self.innerView.layer.addAnimation(ba2, forKey: nil)
    }
   }
