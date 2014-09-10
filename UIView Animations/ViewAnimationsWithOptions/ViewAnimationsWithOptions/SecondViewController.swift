//
//  SecondViewController.swift
//  ViewAnimationsWithOptions
//
//  Created by Mazharul Huq on 9/4/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
                            
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    //variables for original state of myView
    var originalPosition:CGPoint!
    var originalColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func  viewDidAppear(animated: Bool) {
        originalPosition = myView.center //Stores myView's initial position
        originalColor = myView.backgroundColor //Stores myView's initial background color
        cancelButton.enabled = false //Disables cancelButton
    }
    
    func animate(option:UIViewAnimationOptions){
        cancelButton.enabled = true ////Enables cancelButton
        
        UIView.animateWithDuration(2.0,delay: 0,
                                    options:option,animations: {
            var center = self.myView.center
            center.y += 600
            //Move myView center by 600 vertically down
            self.myView.center = center
            //Change myView background color to green
            self.myView.backgroundColor = UIColor.greenColor()
            }, completion:nil)
    }

    @IBAction func chooseOption(sender: AnyObject) {
        //Optional variable for the options parameter 
        var opt:UIViewAnimationOptions!
        //sender downcasted to UISegmentedControl type
        let segment = sender as UISegmentedControl
        // Reset myView to its original state
        myView.center = self.originalPosition
        myView.backgroundColor = self.originalColor
        
        switch segment.selectedSegmentIndex{
            
           case 0:
               opt = UIViewAnimationOptions.Autoreverse
           case 1:
               opt = UIViewAnimationOptions.Repeat
           case 2:
              //Combination of Repeat and Autoreverse
              opt = UIViewAnimationOptions.Autoreverse
                        | UIViewAnimationOptions.Repeat
        default:
            println("Should not be here")
        }
        //Call animate function with chosen option
        animate(opt)
    }
   
    @IBAction func cancelAnimation(sender: AnyObject) {
        //Animation to restore the myView initial state
        UIView.animateWithDuration(0.5,delay: 0,
            options:UIViewAnimationOptions.BeginFromCurrentState,
                                                    animations: {
            
            self.myView.center = self.originalPosition
            self.myView.backgroundColor = self.originalColor
            }, completion:nil)
        
        //Unselects segment selected
        segmentControl.selectedSegmentIndex = -1
        cancelButton.enabled = false //Disables cancelButton
    }
    

}

