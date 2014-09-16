//
//  RaceTrack.swift
//  CAKeyframeAnimation
//
//  Created by Mazharul Huq on 9/8/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class RaceTrack: CALayer {
    
    var trackPath = UIBezierPath()
    var car:CALayer!
    var didSetup = false
    
    override func layoutSublayers() {
        if !self.didSetup {
            self.didSetup = true
            self.setup()
        }
    }
    func setup(){
        trackPath.moveToPoint(CGPoint(x: 40, y: 50))
        trackPath.addCurveToPoint(CGPoint(x: 500, y: 50),
                 controlPoint1: CGPoint(x: 400, y: 150),
                 controlPoint2: CGPoint(x: 200, y: 300))
        trackPath.addCurveToPoint(CGPoint(x: 500, y: 500),
                 controlPoint1: CGPoint(x: 400, y: 650),
                 controlPoint2: CGPoint(x: 200, y: 300))
        trackPath.addCurveToPoint(CGPoint(x: 50, y: 500),
                 controlPoint1: CGPoint(x: 100, y: 750),
                 controlPoint2: CGPoint(x: 300, y: 200))
        trackPath.addCurveToPoint(CGPoint(x: 50, y: 50),
                 controlPoint1: CGPoint(x: 100, y: 750),
                 controlPoint2: CGPoint(x: 300, y: 200))
        
        let line = CAShapeLayer()
        line.path = trackPath.CGPath
        line.strokeColor = UIColor(red: 0.7, green: 0.9, blue: 0.3, alpha: 0.5).CGColor
        line.fillColor = UIColor.whiteColor().CGColor
        line.lineWidth = 20
        self.addSublayer(line)
        
        car = CALayer()
        car.bounds = CGRectMake(0, 0, 44, 20)
        car.position = CGPointMake(55, 50)
        car.contents = UIImage(named: "car").CGImage
        self.addSublayer(car)
        
    }

}
