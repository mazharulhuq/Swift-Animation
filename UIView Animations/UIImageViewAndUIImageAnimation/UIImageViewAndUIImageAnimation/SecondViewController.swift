//
//  SecondViewController.swift
//  UIImageViewAndUIImageAnimation
//
//  Created by Mazharul Huq on 9/10/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    //Array to hold images created in code
    var imageArray = [UIImage]()
    
    func createImageArray(){
        let w:CGFloat = 140
        for (var i = 0; i < 6; i++) {
            let j = CGFloat(i)
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(w, w), false, 0)
            let con:CGContextRef = UIGraphicsGetCurrentContext()
            CGContextSetFillColorWithColor(con, UIColor.blueColor().CGColor)
            //Circles of gradually decreasing radius are created
            CGContextAddEllipseInRect(con, CGRectMake(0,0,w-j*20,w-j*20))
            CGContextFillPath(con)
            //UIImage created with content of UIGraphicsContext
            let im:UIImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext();
            imageArray.append(im)//The image is appended to the array
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createImageArray() //Call createImageArray
        //Initial image in image view
        imageView.image = UIImage(named: "alaska1")
        button.backgroundColor = UIColor.greenColor()
    }
    
    @IBAction func startAnimation(sender: AnyObject) {
        //Animating UIImageView by loading an animated image
        let animatedImage:UIImage = UIImage.animatedImageNamed("alaska",duration: 5.0)
        imageView.image = animatedImage
        
        //Animate image from the array using a UIImage class method
        let im:UIImage = UIImage.animatedImageWithImages(imageArray,
                                                      duration: 3.0)
        //Set the button image with the animated image im
        button.setImage(im, forState: UIControlState.Normal)
    }
}

