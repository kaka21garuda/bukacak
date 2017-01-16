//
//  HomeViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/28/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit
import Social

//import AVFoundation

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var contactButton: UIButton!
    
    
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
    
    @IBAction func contactAction(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "", message: "Contact on social", preferredStyle: .actionSheet)
        
        let tweetAction = UIAlertAction(title: "Contact on Twitter", style: .default) { (twitterAction) in
            
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                // initialize the default view controller for sharing the post.
                let twitterComposeVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                twitterComposeVC?.setInitialText("@bukacak ")
                self.present(twitterComposeVC!, animated: true, completion: nil)
                
            } else {
                let notwitter = UIAlertController(title: "You're not logged in", message: "Please go to settings and log in with your twitter account.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                notwitter.addAction(okAction)
                self.present(notwitter, animated: true, completion: nil)
            }
        }
        
        let facebookAction = UIAlertAction(title: "Contact on Facebook", style: .default) { (facebookAction) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                
                let facebookComposeVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                facebookComposeVC?.setInitialText("@Buka Cakrawala ")
                self.present(facebookComposeVC!, animated: true, completion: nil)
                
            } else {
                
                let notfacebook = UIAlertController(title: "You're not logged in", message: "Please go to settings and log in with your facebook account.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                notfacebook.addAction(okAction)
                self.present(notfacebook, animated: true, completion: nil)
            }
        }
        
        let dismissAction = UIAlertAction(title: "Close", style: .cancel) { (closeAction) in
            //
        }
        actionSheet.addAction(tweetAction)
        actionSheet.addAction(facebookAction)
        actionSheet.addAction(dismissAction)
        
        present(actionSheet, animated: true, completion: nil)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.homeProfileImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        animateImage(view: self.homeProfileImageView, duration: 2.6, velocity: 6.0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        contactButton.layer.borderWidth = 1.0
        contactButton.layer.cornerRadius = contactButton.bounds.size.height / 2
        
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
