//
//  EducationViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/30/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

//struct School {
//    
//    let schoolBackgroundImage: UIImage
//    let schoolLogoImage: UIImage
//    let schoolName: String
//    let schoolYear: String
//    let description: String
//}
//
//let makeSchool = School(schoolBackgroundImage: #imageLiteral(resourceName: "makeschoolBackground"), schoolLogoImage: #imageLiteral(resourceName: "makeschoolLogo"), schoolName: "Make School", schoolYear: "2016 - 2018", description: "Product Academy")
//
//let summerAcademy = School(schoolBackgroundImage: #imageLiteral(resourceName: "makeschoolSummerAcademy"), schoolLogoImage: #imageLiteral(resourceName: "makeschoolLogo"), schoolName: "Summer Academy", schoolYear: "", description: "Summer Academy")

class EducationViewController: UIViewController {
    
    let makeSchool = ["name":"Product Academy", "schoolYear": "2016", "description": "I attended Make School", "backgroundImage": "makeschoolBackground", "schoolLogo": "makeschoolLogo"]
    
    let summerAcademy = ["name":"Summer Academy", "schoolYear": "2016", "description": "I attended Summer Academy", "backgroundImage": "makeschoolSummerAcademy", "schoolLogo": "makeschoolLogo"]
    
    var schoolArray = [Dictionary<String, String>]()
    
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBAction func dismissButtonAsAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var educationScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dismissButton.layer.cornerRadius = dismissButton.frame.size.height / 2
        
        schoolArray = [makeSchool, summerAcademy]
        educationScrollView.isPagingEnabled = false
        educationScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(schoolArray.count), height: 250)
        educationScrollView.showsHorizontalScrollIndicator = false
        
        loadSchools()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSchools() {
        
        for (index, school) in schoolArray.enumerated() {
            if let view = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first as? SchoolView {
                view.backgroundImageView.image = UIImage(named: school["backgroundImage"]!)
                view.logoImageView.image = UIImage(named: school["schoolLogo"]!)
                view.schoolTitleLabel.text = school["name"]
                view.yearLabel.text = school["schoolYear"]
                view.descriptionTextView.text = school["description"]
                
                educationScrollView.addSubview(view)
                educationScrollView.frame.size.width = self.view.bounds.size.width
                educationScrollView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
            }
            
        }
        
    }
    
    
}
