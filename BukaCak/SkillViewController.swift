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
        
        let oneCircle = SkillLoaderView(frame: CGRect(x: 0 + 10, y: ((self.view.bounds.height / 2) - (circleHeight / 2)) - 50, width: circleWidth, height: circleHeight))
        
        let twoCircle = SkillLoaderView(frame: CGRect(x: (self.view.bounds.width / 2) + 10, y: ((self.view.bounds.height / 2) - (circleHeight / 2)) - 50, width: circleWidth, height: circleHeight))
        let threeCircle = SkillLoaderView(frame: CGRect(x: 0 + 10, y: (self.view.bounds.height / 2) + (circleHeight / 2), width: circleWidth, height: circleHeight))

        let fourCircle = SkillLoaderView(frame: CGRect(x: (self.view.bounds.width / 2) + 10, y: (self.view.bounds.height / 2) + (circleHeight / 2), width: circleWidth, height: circleHeight))
        
        view.addSubview(oneCircle)
        view.addSubview(twoCircle)
        view.addSubview(threeCircle)
        view.addSubview(fourCircle)
        
        
        // animate the circle here
        oneCircle.animate(duration: 5.0, completion: 0.55, color: UIColor(red: 23 / 255.0, green: 168 / 255.0, blue: (248 / 255.0), alpha: 1.0).cgColor)
        twoCircle.animate(duration: 5.0, completion: 1.0, color: UIColor(red: 254 / 255.0, green: 139 / 255.0, blue: 58 / 255.0, alpha: 1.0).cgColor)
        threeCircle.animate(duration: 5.0, completion: 0.65, color: UIColor(red: 51 / 255.0, green: 51 / 255.0, blue: 51 / 255.0, alpha: 1.0).cgColor)
        fourCircle.animate(duration: 5.0, completion: 0.80, color: UIColor(red: 79 / 255.0, green: 221 / 255.0, blue: 121 / 255.0, alpha: 1.0).cgColor)

    }
    
    
}
