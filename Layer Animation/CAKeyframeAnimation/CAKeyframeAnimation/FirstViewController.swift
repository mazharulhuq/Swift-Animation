//
//  FirstViewController.swift
//  CAKeyframeAnimation
//
//  Created by Mazharul Huq on 9/8/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var imageArray  = [CGImage]()//Empty array for images
    let displayLayer = CALayer()
    
    //Function to fill image array
    func fillImageArray(){
        for i in 1...5{
            let imageName = "alaska\(i)"//Image name
            let image: CGImage = UIImage(named: imageName).CGImage
            imageArray.append(image)
        }
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fillImageArray()
        println(imageArray.count)
        displayLayer.frame = CGRectMake(140, 100, 500, 400)
        displayLayer.borderWidth = 2
        displayLayer.contents = imageArray[0]
        self.view.layer.addSublayer(displayLayer)
        
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        let anim = CAKeyframeAnimation(keyPath: "contents")
        anim.values = imageArray.map { $0 as AnyObject}
        anim.calculationMode = kCAAnimationDiscrete
        anim.duration = 5.0
        anim.repeatCount = 5
        displayLayer.addAnimation(anim, forKey: "contents")
    }
 }

