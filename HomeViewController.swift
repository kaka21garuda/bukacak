//
//  HomeViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/28/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit
import Social


class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerPreviewingDelegate {
    
    
     var buttonSender: UIButton?
     let transition = CircularTransition()
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var contactButton: UIButton!
    
    @IBOutlet weak var aboutContraint: NSLayoutConstraint!
    
    @IBOutlet weak var workContraint: NSLayoutConstraint!
    
    @IBOutlet weak var homeProfileImageView: UIImageView!
    
    @IBOutlet weak var aboutButton: UIButton!
    
    @IBOutlet weak var workButton: UIButton!
    
    @IBOutlet weak var skillsButton: UIButton!
    
    @IBOutlet weak var educationButton: UIButton!
    
    
    @IBOutlet var buttonLabel: [UILabel]!
    
    
    // MARK: - IBActions
    
    @IBAction func aboutAction(_ sender: UIButton) {
        self.buttonSender = sender
        performSegue(withIdentifier: "aboutSegue", sender: sender)
    }
    
    @IBAction func skillAction(_ sender: UIButton) {
        self.buttonSender = sender
        performSegue(withIdentifier: "skillSegue", sender: sender)
        print(sender.center)
    }
    
    @IBAction func projectAction(_ sender: UIButton) {
        self.buttonSender = sender
        performSegue(withIdentifier: "projectSegue", sender: sender)
    }
    
    @IBAction func educationAction(_ sender: UIButton) {
        self.buttonSender = sender
        performSegue(withIdentifier: "educationSegue", sender: sender)
    }
    
    // MARK: - Contact IBAction 
    
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
    
    // MARK: - 3d Touch Peek and Pop methods
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let viewsForForceTouch = [homeProfileImageView]
        
        let views: [UIView] = [skillsButton, aboutButton, educationButton, workButton, homeProfileImageView]
        
        print(location)
        
        for i in 0 ..< views.count {
            print(i)
            
            if views[i].frame.contains(location) {
                switch views[i].tag {
                case 0:
                    print("0 is working!")
                    let previewImageVC = storyboard?.instantiateViewController(withIdentifier: "previewPicture") as? PreviewImageViewController
                    return previewImageVC!
                case 1:
                    let previewAboutVC = storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as? AboutViewController
                    return previewAboutVC!
                case 2:
                    let previewEducationVC = storyboard?.instantiateViewController(withIdentifier: "EducationViewController") as? EducationViewController
                    return previewEducationVC!
                case 3:
                    let previewSkillVC = storyboard?.instantiateViewController(withIdentifier: "SkillViewController") as? SkillViewController
                    return previewSkillVC
                case 4:
                    let previewProjectVC = storyboard?.instantiateViewController(withIdentifier: "DynamicViewController") as? DynamicViewController
                    return previewProjectVC
                default:
                    print("switch is not working!")
                    return nil
                }
            }
        }
        
        return nil
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {}
    
    
    // MARK: - Circular Transitioning Methods
    
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
        print("animate the picture")
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
    
    func tapPictureAction() {
        print("picture is tapped!")
        self.homeProfileImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        animateImage(view: self.homeProfileImageView, duration: 2.6, velocity: 6.0)
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttons: [UIButton] = [aboutButton!, workButton!, skillsButton!, educationButton!]
        
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapPictureAction))
        singleTap.numberOfTapsRequired = 1
        
        homeProfileImageView.isUserInteractionEnabled = true
        homeProfileImageView.addGestureRecognizer(singleTap)
    
        contactButton.layer.borderWidth = 1.0
        contactButton.layer.cornerRadius = contactButton.bounds.size.height / 2
        
        applyMotionEffect(toView: self.view, magnitude: 10)
        
        
        
        // Registering 3d touch
        if traitCollection.forceTouchCapability == .available {
            print("Capable of 3d touch")
            registerForPreviewing(with: self, sourceView: view)
        }
        
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
        for button in buttons {
            button.layer.cornerRadius = button.frame.size.width / 2
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.white.cgColor
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let buttons: [UIButton] = [aboutButton, educationButton, skillsButton, workButton]
        
        self.homeProfileImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        animateImage(view: self.homeProfileImageView, duration: 2.6, velocity: 6.0)
        
        for button in buttons {
            button.alpha = 0
            button.center.y += view.bounds.height
            applyMotionEffect(toView: button, magnitude: -28)
        }
        
        for label in buttonLabel {
            applyMotionEffect(toView: label, magnitude: -28)
            label.alpha = 0.0
        }
        
        UIView.animate(withDuration: 2, delay: 1, options: [], animations: {
            self.aboutButton.center.y -= self.view.bounds.height
            self.aboutButton.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 2, options: [], animations: {
            self.educationButton.center.y -= self.view.bounds.height
            self.educationButton.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 3, options: [], animations: {
            self.skillsButton.center.y -= self.view.bounds.height
            self.skillsButton.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 4, options: [], animations: {
            self.workButton.center.y -= self.view.bounds.height
            self.workButton.alpha = 1.0
        }, completion: nil)
        
        for each in buttonLabel {
            UIView.animate(withDuration: 2, delay: 5, options: [], animations: {
                each.alpha = 1.0
            }, completion: nil)
        }

        
    }

    // MARK: - Navigation
    
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
            
            let projectViewController: DynamicViewController = segue.destination as! DynamicViewController
            projectViewController.transitioningDelegate = self
            projectViewController.modalPresentationStyle = .custom
        }
    }
}
