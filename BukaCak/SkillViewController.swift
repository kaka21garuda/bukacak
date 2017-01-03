//
//  SkillViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/30/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    
    @IBAction func dismissButtonAsAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCircle()

        // Do any additional setup after loading the view.
        dismissButton.layer.cornerRadius = dismissButton.frame.height / 2
        colorGradientBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func colorGradientBackground() {
        
        let topColor = UIColor(red: 233/255.0, green: 100/255.0, blue: 67/255.0, alpha: 1)
        let bottomColor = UIColor(red: 144/255.0, green: 78/255.0, blue: 149/255.0, alpha: 1)
        
        let gradientColor: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }

    func addCircle() {
        let circleWidth = CGFloat(self.view.frame.height / 4)
        let circleHeight = circleWidth
        
        let oneCircle = SkillLoaderView(frame: CGRect(x: 0 + 10, y: (self.view.bounds.height / 2) + (circleHeight / 2), width: circleWidth, height: circleHeight))
        let twoCircle = SkillLoaderView(frame: CGRect(x: (self.view.bounds.width / 2) + 10, y: (self.view.bounds.height / 2) + (circleHeight / 2), width: circleWidth, height: circleHeight))
        let threeCircle = SkillLoaderView(frame: CGRect(x: 0 + 10, y: ((self.view.bounds.height / 2) - (circleHeight / 2)) - 50, width: circleWidth, height: circleHeight))
        let fourCircle = SkillLoaderView(frame: CGRect(x: (self.view.bounds.width / 2) + 10, y: ((self.view.bounds.height / 2) - (circleHeight / 2)) - 50, width: circleWidth, height: circleHeight))
        
        
        view.addSubview(oneCircle)
        view.addSubview(twoCircle)
        view.addSubview(threeCircle)
        view.addSubview(fourCircle)
        
        oneCircle.animate(duration: 2.0, completion: 1.0, color: UIColor.white.cgColor)
        twoCircle.animate(duration: 2.0, completion: 0.55, color: UIColor.green.cgColor)
        threeCircle.animate(duration: 2.0, completion: 1.0, color: UIColor.blue.cgColor)
        fourCircle.animate(duration: 2.0, completion: 1.0, color: UIColor.orange.cgColor)
    }
    
    
}
