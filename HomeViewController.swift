//
//  HomeViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/28/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {//, UIViewControllerPreviewingDelegate {
    
    //var instanceSocial: SocialMediaViewController!
    
    
    @IBOutlet weak var homeProfileImageView: UIImageView!
    
    @IBOutlet weak var linkedinButton: CustomButton!
    @IBOutlet weak var githubButton: CustomButton!
    @IBOutlet weak var emailButton: CustomButton!
    
    
    @IBAction func linkedinAction(_ sender: Any) {
        //urlSocial(type: "linkedin")
        print("linkedin")
    }
    
    @IBAction func githubAction(_ sender: Any) {
        //urlSocial(type: "github")
        print("github")
        
    }
    
    
    @IBAction func emailAction(_ sender: Any) {
        //urlSocial(type: "email")
        print("email")
    }
    
    
    func urlSocial(type: String) -> String {
        if type == "linkedin" {
            return "https://www.linkedin.com/in/buka-cakrawala-47a05a122"
        } else if type == "github" {
            return "https://github.com/kaka21garuda"
        } else {
            return ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.linkedinButton.setBackgroundImage(#imageLiteral(resourceName: "linkedin-logo-button-3"), for: .normal)
        self.githubButton.setBackgroundImage(#imageLiteral(resourceName: "github"), for: .normal)
        self.emailButton.setBackgroundImage(#imageLiteral(resourceName: "email-2"), for: .normal)
        

        self.homeProfileImageView.contentMode = .scaleAspectFill
        self.homeProfileImageView.clipsToBounds = true
        self.homeProfileImageView.image = #imageLiteral(resourceName: "profile")
        
        self.homeProfileImageView.layer.borderWidth = 1.0
        self.homeProfileImageView.layer.borderColor = UIColor.white.cgColor
        
        self.homeProfileImageView.layer.cornerRadius = 62.0
        
         //3D Touch
//        if traitCollection.forceTouchCapability == .available {
//            registerForPreviewing(with: self, sourceView: view)
//        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "linkedinSegue" {
            let socialMediaViewController: SocialMediaViewController! = segue.destination as! SocialMediaViewController
            socialMediaViewController.instanceHome = self
        }
    }
    
}
