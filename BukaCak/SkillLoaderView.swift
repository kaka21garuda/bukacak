//
//  SkillLoaderView.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/2/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class SkillLoaderView: UIView {
    
    let label = UILabel()
    var labelText = "Hello"
    
    var circleLayer: CAShapeLayer!
    
    
    
    init(frame: CGRect, text: String) {
        
        labelText = text
        
        super.init(frame:frame)
        
        setup()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
    
        // UIBezierPath to create the GCPath Layer
        // The path should be the entire circle
        let circlepath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2), radius: (frame.size.width - 10) / 2, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        
        // Setup the CAShapeLayer
        circleLayer = CAShapeLayer()
        circleLayer.lineWidth = 5.0
        circleLayer.path = circlepath.cgPath
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = 0.0
        
        layer.addSublayer(circleLayer)
        
        setupLabel()
        
    }
    
    
    func setupLabel() {
        self.addSubview(label)
        label.text = labelText
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.sizeToFit()
        print(self.bounds)
        label.center.x = self.bounds.midX
        label.center.y = self.bounds.midY
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animate(duration: TimeInterval, completion: CGFloat, color: CGColor) {
        // We want to animate the stroke end property of the circle layer.
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        //Animate from 0 to 1
        animation.fromValue = 0
        animation.toValue = completion
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = completion
        
        // Do the actual animation
        circleLayer.add(animation, forKey: "animateCircle")
        
        
        // Add the circle layer into the sublayer
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = color
        
    }
    
}
