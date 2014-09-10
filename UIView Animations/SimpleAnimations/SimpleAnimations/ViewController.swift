//
//  ViewController.swift
//  SimpleAnimations
//
//  Created by Mazharul Huq on 8/28/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var myView: UIView!
    
    var completionOption = false
    var originalCenter:CGPoint!
    var originalBounds: CGRect!
    var originalColor:UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func  viewDidAppear(animated: Bool) {
        originalCenter = myView.center
        originalBounds = myView.bounds
        originalColor = myView.backgroundColor
        myView.bounds = CGRectMake(0, 0, 50, 50)
    }

    
    @IBAction func changeCompletionOption(sender: AnyObject) {
        let option = sender as UISwitch
        if option.on {
            completionOption = true
        }
        else{
            completionOption = false
        }
        //Restore the center and background color to initial values
        myView.center = originalCenter
        myView.bounds = originalBounds
        myView.backgroundColor = originalColor
        
    }
    
    func simplAnimation(){
        
        UIView.animateWithDuration(2.0,  animations: {
            var center = self.myView.center
            //Shift view right without animation
            UIView.performWithoutAnimation({
                center.x += 200
                self.myView.center = center
            })
            center.y += 600
            self.myView.center = center
            self.myView.bounds = CGRectMake(0, 0, 100, 100)
            self.myView.backgroundColor = UIColor.blueColor()
        })
    }
    
    func animateWithReturn(){
        UIView.animateWithDuration(5.0,animations: {
            var center = self.myView.center
            UIView.performWithoutAnimation({
                center.x += 200
                self.myView.center = center
            })
            center.y += 600
            self.myView.center = center
            self.myView.bounds = CGRectMake(0, 0, 100, 100)
            self.myView.backgroundColor = UIColor.greenColor()
            }, completion:{
                finished in
                self.myView.center = self.originalCenter
                self.myView.bounds = self.originalBounds
                self.myView.backgroundColor = self.originalColor
        })
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        if completionOption {
            animateWithReturn()
            }
        else{
            
            simplAnimation()
            }
    }

}

