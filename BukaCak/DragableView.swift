//
//  DragableView.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/10/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class DragableView: UIView {
    
    var offset: CGPoint!
    var location:  CGPoint!
    var temp: CGPoint!
    
    let imageView = UIImageView()
    var imageFilename = "profile"
    
    init(frame: CGRect, fileName: String) {
        
        
        imageFilename = fileName
        
        super.init(frame: frame)
        setupImage()
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImage()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            offset = touch.location(in: self)
        }
        self.superview?.bringSubview(toFront: self)
    }
    

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            location = touch.location(in: self.superview)
        }
        
        temp = CGPoint(x: location.x - offset.x + 100, y: location.y - offset.y + 100)
        UIView.beginAnimations("dragging", context: nil)
        
        self.center = temp
        UIView.commitAnimations()
        
        // swipe right
        if self.center.x >= 160 {
            self.transform = CGAffineTransform(rotationAngle: ((self.center.x - 160.0) / 160.0) * (.pi / 5))
        // swipe left
        } else {
            self.transform = CGAffineTransform(rotationAngle: (self.center.x - 160.0) / 160.0 * (.pi / 5))
        }
    }
    
    func setupImage() {
        imageView.image = UIImage(contentsOfFile: imageFilename)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(imageView)
    }

}
