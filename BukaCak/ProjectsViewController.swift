//
//  ProjectsViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/2/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

struct Projects {
    
    let image: UIImage
    let title: String
    let description: String
    
}

let alfaNews = Projects(image: #imageLiteral(resourceName: "profile"), title: "Alfa News", description: "Enable the user to read news with different categories from the most reliable sources, give them a better experience of reading news with the user friendly UI in Alfa News.")

let ipsma = Projects(image: #imageLiteral(resourceName: "profile"), title: "Ipsma Invites", description: "Ipsma is an mobile iOS app that allows user to create an event and invite people within the user's contact list. User can pick location where they want to create the event, set the event detail and pass their invitation via SMS text / email.")

let whamp = Projects(image: #imageLiteral(resourceName: "profile"), title: "Whamp!", description: "an extraordinary 2d iPhone game which will bring you into another level of complexity, wrapped in a simplicity well minded design.")

class ProjectsViewController: UIViewController {
    
    let projectLists:[Projects] = [alfaNews, ipsma, whamp]

    @IBOutlet weak var collectionView: UICollectionView!
    
//    @IBOutlet weak var dismissButton: UIButton!
//    
//    @IBAction func dismissButtonAsAction(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorGradientBackground()
        
        
        
    }
    
    func colorGradientBackground() {
        
        let topColor = UIColor(red: 233/255.0, green: 100/255.0, blue: 67/255.0, alpha: 1)
        let bottomColor = UIColor(red: 144/255.0, green: 78/255.0, blue: 149/255.0, alpha: 1)
        
        let gradientColor: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
}

extension ProjectsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "projectCell", for: indexPath) as! ProjectsCollectionViewCell
        
        cell.projectImage.image = projectLists[indexPath.item].image
        cell.projectTitle.text = projectLists[indexPath.item].title
        cell.projectDescriptionTextView.text = projectLists[indexPath.item].description
        
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.cornerRadius = 17
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ((view.frame.width) / 2) + 95
        let height = ((view.frame.height) / 2  + 120)
        
        let cellSize = CGSize(width: width, height: height)
        return cellSize
        
    }
    
}
