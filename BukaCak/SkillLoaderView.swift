//
//  SkillLoaderView.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/2/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class SkillLoaderView: UIView {
    
    var counterVelocity: TimeInterval = 0.03
    
    var timer: Timer!
    
    let label = UILabel()
    let titleLabel = UILabel()
    
    var titleText = ""
    
    var countStart  = 0
    var countEnd    = 100
    var count       = 0

    var circleLayer: CAShapeLayer!
    
    var startTime = NSDate.timeIntervalSinceReferenceDate
    
    // MARK: - Init
    
    // Initialize with frame, start, end, interval, completion, and color
    init(frame: CGRect, start: Int, end: Int, interval: TimeInterval, completion: CGFloat, color: UIColor, title: String) {
        
        countStart = start
        countEnd = end
        count = start
        titleText = title
        
        //counterVelocity = interval
        
        super.init(frame:frame)
        
        setupCircle()
        setupLabel()
        setupTitleLabel()
        startTimer()
        
        let duration = TimeInterval(countEnd - countStart) * counterVelocity
        animate(duration: duration, completion: completion, color: color.cgColor)
        
        print(duration)
        print("--------------")
        
        // counterVelocity = interval
    }
    
    // Initialize with frame, start, end, interval, completion
    init(frame: CGRect, start: Int, end: Int, interval: TimeInterval) {
        
        countStart = start
        countEnd = end
        count = start
        counterVelocity = interval
        
        super.init(frame:frame)
        
        setupCircle()
        setupLabel()
        setupTitleLabel()
        startTimer()
        
        let duration = TimeInterval(countEnd - countStart) * counterVelocity
        animate(duration: duration, completion: 1, color: UIColor.black.cgColor)
    }
    
    
    init(frame: CGRect, start: Int, end: Int) {
        
        countStart = start
        countEnd = end
        count = start
        
        super.init(frame:frame)
        
        setupCircle()
        setupLabel()
        startTimer()
        setupTitleLabel()
        
        let duration = TimeInterval(countEnd - countStart) * counterVelocity
        animate(duration: duration, completion: 1, color: UIColor.red.cgColor)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCircle()
        setupLabel()
        startTimer()
        setupTitleLabel()
        
        let duration = TimeInterval(countEnd - countStart) * counterVelocity
        animate(duration: duration, completion: 1, color: UIColor.red.cgColor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("Initialize skill loader from ocder????")
        
        setupCircle()
        setupLabel()
        startTimer()
        
        let duration = TimeInterval(countEnd - countStart) * counterVelocity
        print(duration)
        animate(duration: duration, completion: 1, color: UIColor.red.cgColor)
    }
    
    // MARK: - Draw Circle
    
    func setupCircle() {
    
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
        
    }
    
    func startTimer() {
        startTime = NSDate.timeIntervalSinceReferenceDate
        timer = Timer.scheduledTimer(timeInterval: 0.014, target: self, selector: #selector(countUp), userInfo: nil, repeats: true)
    }
    
    // MARK: - Label
    
    func setupLabel() {
        label.text = "\(count) %"
        label.frame = bounds
        
        label.font = UIFont(name: "Avenir Next", size: 18)
        
        label.textAlignment = .center
        label.textColor = UIColor.white
        // label.sizeToFit()
        print(self.bounds)
        //label.layer.bounds.width = 20
        label.center.x = self.bounds.midX
        label.center.y = self.bounds.midY
        self.addSubview(label)
    }
    
    func setupTitleLabel() {
        titleLabel.text = titleText
        titleLabel.frame = bounds
        
        titleLabel.font = UIFont(name: "Avenir Next", size: 18)
        
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.center.x = self.bounds.midX
        titleLabel.center.y = ((self.bounds.midY) * 2) + 20
        self.addSubview(titleLabel)
    }
    
    func countUp() {
        if count < countEnd {
            count += 1
            label.text = "\(count) %"
        } else {
            timer.invalidate()
        }
        
        let t = NSDate.timeIntervalSinceReferenceDate - startTime
        print(t, Double(count) * counterVelocity, count)
    }
    
    // MARK: - Circle Animation
    
    func animate(duration: TimeInterval, completion: CGFloat, color: CGColor) {
        
        // We want to animate the stroke end property of the circle layer.
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration //
        
        //Animate from 0 to 1
        animation.fromValue = 0
        animation.toValue = completion
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
//        // Do a linear animation (i.e. the speed of the animation stays the same)
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
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
