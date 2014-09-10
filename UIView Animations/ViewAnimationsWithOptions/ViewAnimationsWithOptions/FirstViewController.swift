//
//  FirstViewController.swift
//  ViewAnimationsWithOptions
//
//  Created by Mazharul Huq on 9/4/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    
    //variables for original state of myView
    var originalPosition:CGPoint!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func  viewDidAppear(animated: Bool) {
        myView.center.y = 100
        originalPosition = myView.center //Stores myView's initial position
    }
    
    func animate(option:UIViewAnimationOptions){
        
        UIView.animateWithDuration(2.0,delay: 0.5, options:option,
            animations: {
                var center = self.myView.center
                center.y += 600
                //Move myView center by 600 vertically down
                self.myView.center = center
                
            }, completion:nil)
    }


    @IBAction func changeOption(sender: AnyObject) {
        //Optional variable for the options parameter
        var opt:UIViewAnimationOptions!
        //sender downcasted to UISegmentedControl type
        let segment = sender as UISegmentedControl
        // Reset myView to its original state
        myView.center = self.originalPosition
        
        switch segment.selectedSegmentIndex{
            
        case 0:
            opt = UIViewAnimationOptions.CurveEaseInOut
        case 1:
            opt = UIViewAnimationOptions.CurveEaseIn
        case 2:
            opt = UIViewAnimationOptions.CurveEaseOut
        case 3:
            opt = UIViewAnimationOptions.CurveLinear
        default:
            println("Should not be here")
        }
        animate(opt) //Call animate function with chosen option
    }

}

