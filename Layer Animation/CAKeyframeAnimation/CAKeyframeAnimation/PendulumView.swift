//
//  PendulumView.swift
//  CAKeyframeAnimation
//
//  Created by Mazharul Huq on 9/8/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

// view exists solely to host layer
class PendulumView : UIView {
    override class func layerClass() -> AnyClass {
        return PendulumLayer.self
    }
}

class PendulumLayer : CALayer {
    var pendulum : CALayer?
    var didSetup = false
    
    override func layoutSublayers() {
        if !self.didSetup {
            self.didSetup = true
            self.setup()
        }
    }
    
    func setup () {
        println("setup")
        
        let rectangle = CAShapeLayer()
        rectangle.contentsScale = UIScreen.mainScreen().scale
        rectangle.lineWidth = 2.0
        rectangle.strokeColor = UIColor.grayColor().CGColor
        let p = CGPathCreateMutable()
        rectangle.fillColor = UIColor.whiteColor().CGColor
        CGPathAddRect(p, nil, self.bounds)
        rectangle.path = p
        
        rectangle.bounds = self.bounds
        rectangle.position = CGPointMake(CGRectGetMidX(self.bounds),
            CGRectGetMidY(self.bounds))
        self.addSublayer(rectangle)
        
        // the pendulum
        let pendulum = CALayer()
        pendulum.contentsScale = UIScreen.mainScreen().scale
        pendulum.bounds = CGRectMake(0, 0, 60, 350)
        
        pendulum.anchorPoint = CGPointMake(0.5, 0.1)
        // we will draw the pendulum in the delegate method
        pendulum.delegate = self
        pendulum.position = CGPointMake(CGRectGetMidX(self.bounds),
            20)
        self.addSublayer(pendulum)
        pendulum.setNeedsDisplay()
        self.pendulum = pendulum
        
    }
    
    override func drawLayer(layer: CALayer!, inContext con: CGContext!) {
        // Pendulum shaft
        CGContextMoveToPoint(con, 30, 350)
        CGContextAddLineToPoint(con, 30, 19)
        CGContextSetLineWidth(con, 20)
        CGContextSetCMYKStrokeColor(con, 0.8, 0.8, 0.0, 0.0, 1.0)
        CGContextStrokePath(con)
        //Pendulum bob
        CGContextMoveToPoint(con, 10, 310)
        CGContextAddLineToPoint(con, 50, 310)
        CGContextAddLineToPoint(con, 50, 340)
        CGContextAddLineToPoint(con, 10, 340)
        CGContextAddLineToPoint(con, 10, 340)
        CGContextSetFillColorWithColor(con, UIColor.redColor().CGColor)
        CGContextSetLineWidth(con, 2)
        CGContextFillPath(con)
    }
    
}
