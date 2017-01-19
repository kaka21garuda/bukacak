//
//  DynamicViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/16/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import CoreMotion

class DynamicViewController: UIViewController {
    
    let  coreMotionManager = CMMotionManager()
    
    
    var pakrButton  = BallButton()
    var ipsmaButton = BallButton()
    var whampButton = BallButton()
    var alfaButton  = BallButton()
    
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    lazy var gravity: UIGravityBehavior = {
        let lazyGravity = UIGravityBehavior()
        return lazyGravity
    }()
    
    lazy var collider: UICollisionBehavior = {
        let lazycollider = UICollisionBehavior()
        lazycollider.translatesReferenceBoundsIntoBoundary = true
        return lazycollider
    }()
    
    lazy var dynamicItemBehavior:UIDynamicItemBehavior = {
        let lazyBehavior = UIDynamicItemBehavior()
        
        // 0 = no elacticity, 1.0 = max elacticity
        lazyBehavior.elasticity = 1.0
        lazyBehavior.allowsRotation = true
        lazyBehavior.friction = 0.4
        //lazyBehavior.density = 0.4
        //lazyBehavior.resistance = 0.4
        
        return lazyBehavior
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawButton()
        animateButton()
        
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawButton() {
        let buttons = [pakrButton, ipsmaButton, whampButton, alfaButton]
        let colors = [UIColor.blue, UIColor.orange, UIColor.red, UIColor.green]
        
        var count = 0
        
        for button in buttons {
            let buttonSize = CGSize(width: 120, height: 120)
            
            let x = CGFloat(arc4random() % 120) - 60
            let y = CGFloat(arc4random() % 120) - 60
            
            print(x, y)
            
            let centerPoint = CGPoint(x: self.view.bounds.midX - (buttonSize.width / 2) + x,
                                      y: self.view.bounds.midY - (buttonSize.height / 2) + y)
            let frame = CGRect(origin: centerPoint, size: buttonSize)
            
            button.frame = frame
            button.backgroundColor = colors[count]
            count += 1
            button.layer.cornerRadius = pakrButton.bounds.size.height / 2
            
            self.view.addSubview(button)
        }
        
       
    }
    
    func animateButton() {
        let behaviors = [gravity, collider, dynamicItemBehavior] as [Any]
        
        for behavior in behaviors {
            animator.addBehavior(behavior as! UIDynamicBehavior)
            (behavior as AnyObject).addItem(pakrButton)
            (behavior as AnyObject).addItem(ipsmaButton)
            (behavior as AnyObject).addItem(whampButton)
            (behavior as AnyObject).addItem(alfaButton)
            updateMotion()
        }
        
    }
    
    func updateMotion() {
        if coreMotionManager.isAccelerometerAvailable && !coreMotionManager.isAccelerometerActive {
            coreMotionManager.accelerometerUpdateInterval = 0.25
            coreMotionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (data, error) in
                if self.gravity.dynamicAnimator != nil {
                    if let dx = data?.acceleration.x, let dy = data?.acceleration.y {
                        self.gravity.gravityDirection = CGVector(dx: dx, dy: dy)
                    }
                } else {
                    self.coreMotionManager.stopAccelerometerUpdates()
                }
            })
        }
    }
    
}

class BallButton: UIButton {
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .ellipse
    }
}







