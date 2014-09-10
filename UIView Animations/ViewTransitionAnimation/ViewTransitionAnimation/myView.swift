//
//  myView.swift
//  ViewTransitionAnimation
//
//  Created by Mazharul Huq on 9/4/14.
//  Copyright (c) 2014 Mazharul Huq. All rights reserved.
//

import UIKit

class TransView: UIView{
    var reverse = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func  drawRect(rect: CGRect) {
        //UIGraphicsBeginImageContext(CGSizeMake(rect.width - 20, rect.height - 20))
        let con:CGContextRef = UIGraphicsGetCurrentContext()
        let rec:CGRect = CGRectMake(20, 20, rect.width - 40, rect.height - 40)
        if (reverse == 1) {
            CGContextFillEllipseInRect(con, rec)
        }
        else{
            CGContextFillRect(con, rec)
        }
        
    }
    
}