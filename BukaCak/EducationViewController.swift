//
//  EducationViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/30/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

struct School {
    
    let schoolName: String!
    let schoolStory: String!
    
}

let product = School(schoolName: "Make School", schoolStory: "The Product College is a two year program, each year is broken up into two semesters, and each semester into two quarters. Students focus the majority of their time on one of two technical concentrations: Mobile Development and Full Stack Web Development.")

let summer = School(schoolName: "Summer Academy", schoolStory: "The Make School Summer Academy is designed to teach product development to high school and college students passionate about technology.")

class EducationViewController: UIViewController, UICollisionBehaviorDelegate {
    
    let schoolsList = [product, summer]
       
//    @IBOutlet weak var dismissButton: UIButton!
//    
//    @IBAction func dismissButtonAsAction(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    
    var views = [UIView]()
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var snap: UISnapBehavior!
    var previousTouchPoint: CGPoint!
    var viewDragging = false
    var viewPinned = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //dismissButton.layer.cornerRadius = dismissButton.frame.size.height / 2
        
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior()
        
        animator.addBehavior(gravity)
        gravity.magnitude = 4
        
        
        
    }
    
    func addViewController(atOffset offset: CGFloat, dataForViewController data: AnyObject?) -> UIView? {
    
        let frame = self.view.bounds.offsetBy(dx: 0, dy: self.view.bounds.size.height - offset)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let stack = sb.instantiateViewController(withIdentifier: "StackElement") as! EducationElementViewController
        
        if let view = stack.view {
            
            view.frame = frame
            view.layer.cornerRadius = 5
            view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowRadius = 3
            view.layer.shadowOpacity = 0.5
            
            
            
            if let headingStr = data as? String {
                stack.header = headingStr
            }
            
            self.addChildViewController(stack)
            self.view.addSubview(view)
            
            stack.didMove(toParentViewController: self)
            
            
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(EducationViewController.handlePan(gestureRecognizer:)))
            
            
            view.addGestureRecognizer(panGestureRecognizer)
            
            
            let collision = UICollisionBehavior(items: [view])
            collision.collisionDelegate = self
            animator.addBehavior(collision)
            
            // Lower boundary
            let boundary = view.frame.origin.y + view.frame.size.height
            var boundaryStart = CGPoint(x: 0, y: boundary)
            var boundaryEnd = CGPoint(x: self.view.bounds.size.width, y: boundary)
            collision.addBoundary(withIdentifier: 1 as NSCopying, from: boundaryStart, to: boundaryEnd)
            
            // Upper boundary
            
            boundaryStart = CGPoint(x: 0, y: 0)
            boundaryEnd = CGPoint(x: self.view.bounds.size.width, y: 0)
            collision.addBoundary(withIdentifier: 2 as NSCopying, from: boundaryStart, to: boundaryEnd)
            
            gravity.addItem(view)
        }
        return nil
    }
    
    func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
