//
//  HomeViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/28/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeProfileImageView: UIImageView!
    
    @IBOutlet weak var linkedinButton: CustomButton!
    @IBOutlet weak var githubButton: CustomButton!
    @IBOutlet weak var emailButton: CustomButton!
    
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
        
    }
    
}
