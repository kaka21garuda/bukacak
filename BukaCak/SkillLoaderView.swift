//
//  SkillLoaderView.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/2/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

enum CounterAnimationType {
    case linear
    case easeIn
    case easeOut
}

class SkillLoaderView: UIView {
    
    let counterVelocity: Float = 3.0
    
    var timer: Timer?
    
    let label = UILabel()
    
    var labelText = "0"
    var endingLabelText = "100"
    
    var countStart = 0
    var countEnd = 100
    
    var progress: TimeInterval!
    var duration: TimeInterval!
    var lastUpdate: TimeInterval!
    
    var counterAnimationType: CounterAnimationType!
    
    var currentCounterValue: Int {
        if progress >= duration {
            return countEnd
        }
        
        let percentage = Int(progress / duration)
        let update = updateCounter(counterValue: percentage)
        
        return countStart + (update * (countEnd - countStart))
        
    }
    
    
    var circleLayer: CAShapeLayer!
    
    init(frame: CGRect, text: String, endText: String) {
        
        labelText = text
        endingLabelText = endText
        
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
        label.text = "\(labelText)"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.sizeToFit()
        print(self.bounds)
        //label.layer.bounds.width = 20
        label.center.x = self.bounds.midX
        label.center.y = self.bounds.midY
        
//        count(fromValue: Int(labelText)!, toValue: Int(endingLabelText)!, withDuration: 5, animationType: .easeOut)
    }
    
    func count(fromValue: Int, toValue: Int, withDuration duration: TimeInterval, animationType: CounterAnimationType) {
        
        self.countStart = fromValue
        self.countEnd = toValue
        self.duration = duration
        self.counterAnimationType = animationType
        self.progress = 0
        self.lastUpdate = Date.timeIntervalSinceReferenceDate
        
        invalidateTimer()
        
        if duration == 0 {
            updateText(value: toValue)
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateValue), userInfo: nil, repeats: true)
    }
    
    func updateValue() {
        let now = Date.timeIntervalSinceReferenceDate
        progress = progress + (now - lastUpdate)
        lastUpdate = now
        
        if progress >= duration {
            invalidateTimer()
            progress = duration
        }
        
        // update Text Label
        updateText(value: currentCounterValue)
        
    }
    
    func updateText(value: Int) {
        self.label.text = "\(value)"
        //self.addSubview(label)
    }
    
    func updateCounter(counterValue: Int) -> Int {
        switch counterAnimationType! {
        case .linear:
            return counterValue
        case .easeIn:
            return Int(powf(Float(counterValue), counterVelocity))
        case .easeOut:
            return Int(1.0 - powf(1.0 - Float(counterValue), counterVelocity))
        }
    }
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
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
