//
//  SkillsViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/28/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCircleView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCircleView() {
        var circleWidth = CGFloat(200)
        var circleHeight = circleWidth
        
        // Create a new CircleView
        //var circleView = SwiftCircle(frame: CGRect(diceRoll, 0, circleWidth, circleHeight))
        var objectiveCCircle = SwiftCircle(frame: CGRect(x: view.frame.width / 2, y: 0 + 20, width: circleWidth, height: circleHeight))
        
        //var swiftCircleCircle = SwiftCircle(frame: )
        
        view.addSubview(objectiveCCircle)
    }

    
}
