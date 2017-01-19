//
//  SkillViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/30/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController {
    
    var objcLabel: UILabel!
    var swiftLabel: UILabel!
    var sqlLabel: UILabel!
    var pythonLabel: UILabel!

    @IBOutlet weak var dismissButton: UIButton!
    
    @IBAction func dismissButtonAsAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addCircle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is Skill View")
        
        print(UIFont.familyNames)

        // Do any additional setup after loading the view.
        dismissButton.layer.cornerRadius = dismissButton.frame.height / 2
        self.dismissButton.setBackgroundImage(#imageLiteral(resourceName: "error-2"), for: .normal)
        self.dismissButton.layer.borderColor =  UIColor.white.cgColor
        self.dismissButton.layer.borderWidth = 1.2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCircle() {
        let circleWidth = CGFloat(self.view.frame.height / 4)
        let circleHeight = circleWidth
        
        let oneCircle = SkillLoaderView(frame: CGRect(x: 0 + 10, y: ((self.view.bounds.height / 2) - (circleHeight / 2)) - 50, width: circleWidth, height: circleHeight), start: 0, end: 55, interval: 0.09, completion: 0.55, color: UIColor(red: 23 / 255.0, green: 168 / 255.0, blue: (248 / 255.0), alpha: 1.0))
        
        let twoCircle = SkillLoaderView(frame: CGRect(x: (self.view.bounds.width / 2) + 10, y: ((self.view.bounds.height / 2) - (circleHeight / 2)) - 50, width: circleWidth, height: circleHeight), start: 0, end: 100, interval: 0.05, completion: 1.0, color: UIColor.green)
        
        let threeCircle = SkillLoaderView(frame: CGRect(x: 0 + 10, y: (self.view.bounds.height / 2) + (circleHeight / 2), width: circleWidth, height: circleHeight), start: 0, end: 70, interval: 0.0714, completion: 0.7, color: UIColor.yellow)

        let fourCircle = SkillLoaderView(frame: CGRect(x: (self.view.bounds.width / 2) + 10, y: (self.view.bounds.height / 2) + (circleHeight / 2), width: circleWidth, height: circleHeight), start: 0, end: 80, interval: 0.0625, completion: 0.8, color: UIColor.cyan)
        
        view.addSubview(oneCircle)
        view.addSubview(twoCircle)
        view.addSubview(threeCircle)
        view.addSubview(fourCircle)
        
    }
    
    
}
