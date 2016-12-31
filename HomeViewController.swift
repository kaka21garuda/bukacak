//
//  HomeViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/28/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerPreviewingDelegate {
    
    var buttonSender: UIButton?
    //var buttonLocation: CGPoint?
    
    @IBOutlet weak var homeProfileImageView: UIImageView!
    
    @IBOutlet weak var aboutButton: UIButton!
    
    @IBOutlet weak var workButton: UIButton!
    
    @IBOutlet weak var skillsButton: UIButton!
    
    @IBOutlet weak var educationButton: UIButton!
    
    let transition = CircularTransition()
    
    
    @IBAction func aboutAction(_ sender: UIButton) {
        self.buttonSender = sender
        //self.buttonLocation = sender.frame.origin

        print(buttonSender!)
    }
    
    @IBAction func skillAction(_ sender: UIButton) {
        self.buttonSender = sender
        print(buttonSender!)
    }
    
    
    @IBAction func projectAction(_ sender: UIButton) {
        self.buttonSender = sender
        print(buttonSender!)
    }
    
    @IBAction func educationAction(_ sender: UIButton) {
        self.buttonSender = sender
        print(buttonSender!)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
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
    
    // peek
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
    
    // pop
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let aboutVC = storyBoard.instantiateViewController(withIdentifier: whichLocation(location: location)) as? AboutViewController else { return nil }
        return aboutVC
    }
    
    func whichLocation(location: CGPoint) -> String {
        if location == aboutButton.frame.origin {
            return "AboutViewController"
        } else {
            return "EducationViewController"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering 3d touch
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        }
        
        // Buttons
        self.aboutButton.setBackgroundImage(#imageLiteral(resourceName: "man-thinking-about-love"), for: .normal)
        self.workButton.setBackgroundImage(#imageLiteral(resourceName: "layers"), for: .normal)
        self.skillsButton.setBackgroundImage(#imageLiteral(resourceName: "app-store"), for: .normal)
        self.educationButton.setBackgroundImage(#imageLiteral(resourceName: "attachment"), for: .normal)
        
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
        }
    }
    
}
