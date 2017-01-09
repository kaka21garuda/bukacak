//
//  HomeViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/28/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var buttonSender: UIButton?
    
    @IBOutlet weak var aboutContraint: NSLayoutConstraint!
    
    @IBOutlet weak var workContraint: NSLayoutConstraint!
    

      
    @IBOutlet weak var homeProfileImageView: UIImageView!
    
    @IBOutlet weak var aboutButton: UIButton!
    
    @IBOutlet weak var workButton: UIButton!
    
    @IBOutlet weak var skillsButton: UIButton!
    
    @IBOutlet weak var educationButton: UIButton!
    
    let transition = CircularTransition()
    
    
    @IBAction func aboutAction(_ sender: UIButton) {
        self.buttonSender = sender
        performSegue(withIdentifier: "aboutSegue", sender: sender)
    }
    
    @IBAction func skillAction(_ sender: UIButton) {
        self.buttonSender = sender
        performSegue(withIdentifier: "skillSegue", sender: sender)
        
    }
    
    @IBAction func projectAction(_ sender: UIButton) {
        self.buttonSender = sender
        performSegue(withIdentifier: "projectSegue", sender: sender)
    }
    
    @IBAction func educationAction(_ sender: UIButton) {
        self.buttonSender = sender
        performSegue(withIdentifier: "educationSegue", sender: sender)
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

    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        print("transition: \(transition)")
        print("button sender \(buttonSender)")
        
        transition.transitionMode = .present
        transition.startingPoint = (buttonSender?.center)!
        transition.cirleColor = (buttonSender?.backgroundColor!)!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .dismiss
        transition.startingPoint = (buttonSender?.center)!
        transition.cirleColor = (buttonSender?.backgroundColor!)!
        
        return transition
    }
    
//    // peek
//    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
//        show(viewControllerToCommit, sender: self)
//    }
//    
//    // pop
//    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
//        
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        
//        guard let aboutVC = storyBoard.instantiateViewController(withIdentifier: whichLocation(location: location)) as? AboutViewController else { return nil }
//        return aboutVC
//    }
//    
//    func whichLocation(location: CGPoint) -> String {
//        if location == aboutButton.frame.origin {
//            return "AboutViewController"
//        } else {
//            return "EducationViewController"
//        }
//    }
    
    func animateImage(view: UIView, duration: TimeInterval, velocity: CGFloat) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: velocity, options: .allowUserInteraction, animations: { 
            [ weak self ] in
                self?.homeProfileImageView.transform = .identity
        }, completion: nil)
    }
    
    func applyMotionEffect(toView view: UIView, magnitude: Float) {
        let xmotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xmotion.minimumRelativeValue = -magnitude
        xmotion.maximumRelativeValue = magnitude
        
        let ymotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        ymotion.minimumRelativeValue = -magnitude
        ymotion.maximumRelativeValue = magnitude
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xmotion, ymotion]
        
        view.addMotionEffect(group)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //colorGradientBackground()
        
        applyMotionEffect(toView: self.view, magnitude: 10)
        applyMotionEffect(toView: aboutButton, magnitude: -20)
        applyMotionEffect(toView: educationButton, magnitude: -20)
        applyMotionEffect(toView: skillsButton, magnitude: -20)
        applyMotionEffect(toView: workButton, magnitude: -20)
        
//        // Registering 3d touch
//        if traitCollection.forceTouchCapability == .available {
//            registerForPreviewing(with: self, sourceView: view)
//        }
        
        // Buttons
        self.aboutButton.setBackgroundImage(#imageLiteral(resourceName: "man"), for: .normal)
        self.workButton.setBackgroundImage(#imageLiteral(resourceName: "settings"), for: .normal)
        self.skillsButton.setBackgroundImage(#imageLiteral(resourceName: "coding"), for: .normal)
        self.educationButton.setBackgroundImage(#imageLiteral(resourceName: "library"), for: .normal)
        
        // profile image view
        self.homeProfileImageView.contentMode = .scaleAspectFill
        self.homeProfileImageView.clipsToBounds = true
        self.homeProfileImageView.image = #imageLiteral(resourceName: "profile")
        self.homeProfileImageView.layer.borderWidth = 1.6
        self.homeProfileImageView.layer.borderColor = UIColor.white.cgColor
        self.homeProfileImageView.layer.cornerRadius = homeProfileImageView.frame.size.height / 2
        
        self.homeProfileImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        animateImage(view: self.homeProfileImageView, duration: 2.6, velocity: 6.0)
        
        // UIButton layout
        aboutButton.layer.cornerRadius = aboutButton.frame.size.width / 2
        aboutButton.layer.borderWidth = 1.0
        aboutButton.layer.borderColor = UIColor.white.cgColor
        
        workButton.layer.cornerRadius = workButton.frame.size.width / 2
        workButton.layer.borderWidth = 1.0
        workButton.layer.borderColor = UIColor.white.cgColor
        
        skillsButton.layer.cornerRadius = skillsButton.frame.size.width / 2
        skillsButton.layer.borderWidth = 1.0
        skillsButton.layer.borderColor = UIColor.white.cgColor
        
        educationButton.layer.cornerRadius = educationButton.frame.size.width / 2
        educationButton.layer.borderWidth = 1.0
        educationButton.layer.borderColor = UIColor.white.cgColor
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//       
//        aboutContraint.constant -= view.bounds.width
//        workContraint.constant += view.bounds.width
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//       UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseOut, animations: {
//        self.aboutContraint.constant += self.view.bounds.width
//        self.workContraint.constant -= self.view.bounds.width
//        self.view.layoutIfNeeded()
//       }, completion: nil)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aboutSegue" {
            
            let aboutViewController: AboutViewController = segue.destination as! AboutViewController
            aboutViewController.transitioningDelegate = self
            aboutViewController.modalPresentationStyle = .custom
            
        } else if segue.identifier == "educationSegue" {
            
            let educationViewController: EducationViewController = segue.destination as! EducationViewController
            educationViewController.transitioningDelegate = self
            educationViewController.modalPresentationStyle = .custom
            
        } else if segue.identifier == "skillSegue" {
            
            let skillViewController: SkillViewController = segue.destination as! SkillViewController
            skillViewController.transitioningDelegate = self
            skillViewController.modalPresentationStyle = .custom
        
        } else if segue.identifier == "projectSegue" {
            
            let projectViewController: ProjectsViewController = segue.destination as! ProjectsViewController
            projectViewController.transitioningDelegate = self
            projectViewController.modalPresentationStyle = .custom
        }
    }
}
