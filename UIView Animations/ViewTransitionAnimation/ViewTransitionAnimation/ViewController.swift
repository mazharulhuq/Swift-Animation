//
//  ViewController.swift
//  ViewTransitionAnimation
//
//  Created by Mazharul Huq on 9/4/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    let imageView = UIImageView(frame: CGRectMake(50, 50, 300, 150))
    let view1 = TransView(frame: CGRectMake(50, 220, 300, 150))
    let view2 = UIView(frame: CGRectMake(50, 390, 300, 150))
    let view3 = UIView(frame: CGRectMake(0, 0, 50, 150))
    var displayLabel = UILabel(frame: CGRectMake(400, 250, 150, 100))
    
    var imageIndex = 0
    var animateIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        segmentControl.selectedSegmentIndex = 0
        loadViews(1)
    }
    
    func loadViews(choice:Int){
        if choice == 1{
            imageView.image = UIImage(named: "alaska1")
            view1.backgroundColor = UIColor.greenColor()
            display.addSubview(imageView)
            display.addSubview(view1)
            view2.backgroundColor = UIColor.redColor()
            view3.backgroundColor = UIColor.blueColor()
            view2.addSubview(view3)
            display.addSubview(view2)
        }
        else{
            displayLabel.font  = UIFont(name: "Helvetica", size: 36)
            displayLabel.backgroundColor = UIColor.yellowColor()
            displayLabel.text = "Hello"
            displayLabel.textAlignment = NSTextAlignment.Center
            display.addSubview(displayLabel)
        }
    }
    
    func animate(index:Int){
        
        if index == 0{
            UIView.transitionWithView(imageView, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromBottom, animations:{
                
                if self.imageIndex == 0 {
                    self.imageView.image = UIImage(named: "alaska2")
                    self.imageIndex = 1
                }
                else if self.imageIndex == 1{
                    self.imageView.image = UIImage(named: "alaska3")
                    self.imageIndex = 2
                }
                else if self.imageIndex == 2{
                    self.imageView.image = UIImage(named: "alaska1")
                    self.imageIndex = 0
                }
                }, completion: nil)
            
            UIView.transitionWithView(view1, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations:{
                if self.view1.reverse == 1{
                    self.view1.reverse = 2
                }
                else{
                    self.view1.reverse = 1
                }
                self.view1.setNeedsDisplay()
                }, completion: nil)
            
            
            let opts:UIViewAnimationOptions = UIViewAnimationOptions.TransitionFlipFromRight | UIViewAnimationOptions.AllowAnimatedContent
            
            UIView.transitionWithView(view2, duration: 2, options: opts, animations:{
                //CGRect f=CGRectInset(outerView.bounds, 10, 10);
                var f:CGRect  = self.view3.frame
                if f.origin.x == 0 {
                    f.origin.x = self.view2.frame.width - self.view3.frame.width
                }
                else{
                    f.origin.x = 0
                }
                
                
                self.view3.frame = f;
                }, completion: nil)
            
        }
        else{
            
            let label = UILabel(frame: displayLabel.frame)
            
            label.font  = UIFont(name: "Helvetica", size: 36)
            if displayLabel.text == "Hello"{
                label.backgroundColor = UIColor.greenColor()
                label.text = "Howdy"
            }
            else{
                label.backgroundColor = UIColor.yellowColor()
                label.text = "Hello"
            }
            
            label.textAlignment = NSTextAlignment.Center
            
            UIView.transitionFromView(displayLabel, toView: label, duration: 2.0, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            
            displayLabel = label
            
        }
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        animate(animateIndex)
    }
    @IBAction func chooseDisplayOption(sender: AnyObject) {
        
        let seg = sender as UISegmentedControl
        if sender.selectedSegmentIndex == 0{
            displayLabel.removeFromSuperview()
            loadViews(1)
            animateIndex = 0
        }
        else {
            animateIndex = 1
            
            imageView.removeFromSuperview()
            view1.removeFromSuperview()
            view2.removeFromSuperview()
            loadViews(2)
        }
    }
}

