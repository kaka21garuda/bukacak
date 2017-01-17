//
//  DynamicViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/16/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class DynamicViewController: UIViewController {
    
    var pakrButton: UIButton!
    var ipsmaButton: UIButton!
    var whampButton: UIButton!
    var alfaButton: UIButton!
    
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
    
//    lazy var dynamicItemBehavior: UIDynamicItemBehavior {
//        let lazybehavior = UIDynamicItemBehavior()
//        
//        // 0 = no , 1.0 = max
//        lazybehavior.elasticity = 0.8
//        
//        
//        return lazybehavior
//        
//    }()
    
    lazy var dynamicItemBehavior:UIDynamicItemBehavior = {
        let lazyBehavior = UIDynamicItemBehavior()
        
        // 0 = no elacticity, 1.0 = max elacticity
        lazyBehavior.elasticity = 0.8
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
        let buttonSize = CGSize(width: 60, height: 60)
        let centerPoint = CGPoint(x: self.view.bounds.midX - (buttonSize.width / 2), y: self.view.bounds.midY - (buttonSize.height / 2))
        let frame = CGRect(origin: centerPoint, size: buttonSize)
        
        pakrButton = UIButton(frame: frame)
        pakrButton.backgroundColor = UIColor.orange
        pakrButton.layer.cornerRadius = pakrButton.bounds.size.height / 2
        
        ipsmaButton = UIButton(frame: frame)
        ipsmaButton.backgroundColor = UIColor.blue
        ipsmaButton.layer.cornerRadius = ipsmaButton.bounds.size.height / 2
        
        whampButton = UIButton(frame: frame)
        whampButton.backgroundColor = UIColor.red
        whampButton.layer.cornerRadius = whampButton.bounds.size.height / 2
        
        alfaButton = UIButton(frame: frame)
        alfaButton.backgroundColor = UIColor.green
        alfaButton.layer.cornerRadius = alfaButton.bounds.size.height / 2
        
        self.view.addSubview(pakrButton)
        self.view.addSubview(ipsmaButton)
        self.view.addSubview(whampButton)
        self.view.addSubview(alfaButton)
        
        
    }
    
    func animateButton() {
        // adding animation behaviour
        animator.addBehavior(gravity)
        animator.addBehavior(collider)
        animator.addBehavior(dynamicItemBehavior)
        // adding item into the behaviour
        gravity.addItem(pakrButton)
        collider.addItem(pakrButton)
        dynamicItemBehavior.addItem(pakrButton)
        
        gravity.addItem(ipsmaButton)
        collider.addItem(ipsmaButton)
        dynamicItemBehavior.addItem(ipsmaButton)
        
        gravity.addItem(whampButton)
        collider.addItem(whampButton)
        dynamicItemBehavior.addItem(whampButton)
        
        gravity.addItem(alfaButton)
        collider.addItem(alfaButton)
        dynamicItemBehavior.addItem(alfaButton)
        
        
        
        
    }
    
    
    

}
