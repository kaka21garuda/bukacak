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
    
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    lazy var gravity: UIGravityBehavior = {
        let lazyGravity = UIGravityBehavior()
        return lazyGravity
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
        
        self.view.addSubview(pakrButton)
        
    }
    
    func animateButton() {
        // adding animation behaviour
        animator.addBehavior(gravity)
        // adding item into the behaviour
        gravity.addItem(pakrButton)
    }
    

}
