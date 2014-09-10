//
//  FirstViewController.swift
//  UIImageViewAndUIImageAnimation
//
//  Created by Mazharul Huq on 9/10/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var repeatCount: UITextField!
    
    var currentDuration:Float = 1.0  //Current value of duration
    var repeat = 1 //Initial value of repeat
    var imageArray  = [UIImage]()//Empty array for images
    
    //Function to fill image array
    func fillImageArray(){
        for i in 1...16{
            let imageName = "alaska\(i)"//Image name
            let image: UIImage = UIImage(named: imageName)
            imageArray.append(image)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Call function to fill image array
        fillImageArray()
        //Display repeat value in text field
        repeatCount.text = "\(repeat)"
        //Initial image in image view
        imageView.image = imageArray[0]
    }
    
    @IBAction func startAnimation(sender: AnyObject) {
        
        if repeatCount.text.toInt() == nil{
            repeat = 0
            repeatCount.text = "\(repeat)"
        }
        else{
            repeat = repeatCount.text.toInt()!
        }
        //Set imageArray as animationImages
        imageView.animationImages = imageArray
        //Set imageView animationDuration. It is necessary to convert
        // currentDuration to NSTimeInterval
        imageView.animationDuration = NSTimeInterval(currentDuration)
        //Set animationRepeatCount with repeat
        imageView.animationRepeatCount = repeat
        imageView.startAnimating() //Startanimation
    }
    
    @IBAction func stopAnimation(sender: AnyObject) {
        
        imageView.stopAnimating()//Stop animation
    }
    
    @IBAction func durationChanged(sender: AnyObject) {
        // AnyObject sender downcasted to UISlider
        let slider = sender as UISlider
        //currentDuration is set at slider value
        currentDuration = slider.value
        //duration label text updated with new currentDuration
        duration.text = String(format: "%0.1f sec", currentDuration)
    }
    
}


