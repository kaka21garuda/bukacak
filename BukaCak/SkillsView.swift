//
//  SkillsView.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/28/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

let noOfSkills = 10
let pi: CGFloat = CGFloat(M_PI)

@IBDesignable class SkillsView: UIView {
    
    @IBInspectable var counter: Int = 4
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    override func draw(_ rect: CGRect) {
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        let radius: CGFloat = max(bounds.width / 3, bounds.height)
        
        // 3
        let arcWidth: CGFloat = 11
        
        // 4
        let startAngle: CGFloat = 3 * pi / 4
        let endAngle: CGFloat = pi / 4
        
        // 5
        var path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        // 6
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
    }
    
   
}
