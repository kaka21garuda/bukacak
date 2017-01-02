//
//  ProjectsCollectionViewCell.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/2/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class ProjectsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var projectImage: UIImageView!
    
    @IBOutlet weak var projectTitle: UILabel!
    
    @IBOutlet weak var projectDescriptionTextView: UITextView!
    
    @IBOutlet weak var moreButton: UIButton!
    
    @IBAction func moreButtonAsAction(_ sender: Any) {
    }
}
