//
//  ContentProjectsViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/3/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class ContentProjectsViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var pageIndex: Int!
    var titleText: String!
    var imagefile: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = UIImage(named: self.imagefile)
        self.titleLabel.text = self.titleText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
