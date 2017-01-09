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
    
   
    @IBOutlet weak var dismissButton: UIButton!
    
   
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dismissButton.setBackgroundImage(#imageLiteral(resourceName: "error-3"), for: .normal)
        self.dismissButton.layer.cornerRadius = self.dismissButton.bounds.size.height / 2
        self.dismissButton.layer.borderColor = UIColor.white.cgColor
        self.dismissButton.layer.borderWidth = 1.2
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
