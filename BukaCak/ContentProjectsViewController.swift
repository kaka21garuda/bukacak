//
//  ContentProjectsViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/3/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class ContentProjectsViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    var pageIndex: Int!
    var titleText: String!
    var descriptionProject: String!
    var imagefile: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.imageView.image = UIImage(named: self.imagefile)
//        self.titleLabel.text = self.titleText
        
        self.containerView.layer.cornerRadius = 5.0
        self.image.image = UIImage(named: self.imagefile)
        self.titleOutlet.text = self.titleText
        self.descriptionText.text = self.descriptionProject
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
