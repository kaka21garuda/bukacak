//
//  PreviewImageViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/23/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class PreviewImageViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = #imageLiteral(resourceName: "profile")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
