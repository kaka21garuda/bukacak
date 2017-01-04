//
//  EducationElementViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/4/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class EducationElementViewController: UIViewController {
    
    
    @IBOutlet weak var schoolTitle: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var header: String? {
        
        didSet {
        
            configureView()
            
        }
        
    }
    
    func configureView() {
        
        schoolTitle.text = header
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
