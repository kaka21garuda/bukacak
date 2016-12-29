//
//  SwiftCircle.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/28/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

class SwiftCircle: UIView {

    var circleLayer: CAShapeLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        // UIBezierPath to create the cirle layer.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width.
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.orange.cgColor
        circleLayer.lineWidth = 5.0
        
        // Don't draw the circle initially.
        //circleLayer.strokeStart = 0.0
        circleLayer.strokeEnd = 0.0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = 1.7
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0
        animation.toValue = 1.0
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = 1.0
        
        // Do the actual animation
        print("StrokeEnd before animation: \(circleLayer.strokeEnd)")
        
        layer.addSublayer(circleLayer)
        circleLayer.add(animation, forKey: "animateCircle")
        
        print("StrokeEnd after animation: \(circleLayer.strokeEnd)")
        print(Double(M_PI * 2.0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
