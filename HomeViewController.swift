//
//  HomeViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/28/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate {//, UIViewControllerPreviewingDelegate {
    
    //var instanceSocial: SocialMediaViewController!
    
    
    @IBOutlet weak var homeProfileImageView: UIImageView!
    
    
    @IBOutlet weak var aboutButton: UIButton!
    
    let transition = CircularTransition()
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .present
        transition.startingPoint = aboutButton.center
        transition.cirleColor = aboutButton.backgroundColor!
        
        return transition
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = aboutButton.center
        transition.cirleColor = aboutButton.backgroundColor!
        
        return transition
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.homeProfileImageView.contentMode = .scaleAspectFill
        self.homeProfileImageView.clipsToBounds = true
        self.homeProfileImageView.image = #imageLiteral(resourceName: "profile")
        
        self.homeProfileImageView.layer.borderWidth = 1.0
        self.homeProfileImageView.layer.borderColor = UIColor.white.cgColor
        
        self.homeProfileImageView.layer.cornerRadius = 62.0
        
        aboutButton.layer.cornerRadius = aboutButton.frame.size.width / 2
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aboutViewController: AboutViewController = segue.destination as! AboutViewController
        aboutViewController.transitioningDelegate = self
        aboutViewController.modalPresentationStyle = .custom
    }
}
