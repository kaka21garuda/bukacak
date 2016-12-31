//
//  AboutViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/30/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

struct About {
    
    let image: UIImage
    let title: String
    let text: String
}

class AboutViewController: UIViewController {
    
    let aboutLists: [About] = []

    @IBOutlet weak var dismissButton: UIButton!
    
    @IBAction func dismissButtonAsAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //colorGradientBackground()
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func colorGradientBackground() {
    
        let topColor = UIColor(red: 233, green: 100, blue: 67, alpha: 1)
        let bottomColor = UIColor(red: 144, green: 78, blue: 149, alpha: 1)
        
        let gradientColor: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
}

extension AboutViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "aboutCell", for: indexPath) as! AboutCollectionViewCell

        cell.imageView.image = #imageLiteral(resourceName: "profile")
        cell.titleLabel.text = "Hello world"
        cell.contentLabel.text = "My name is Buka Cakrawala"
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ((view.frame.width) / 2) + 80
        let height = ((view.frame.height) / 2 + 200)
        
        let cellSize = CGSize(width: width, height: height)
        return cellSize
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        
//        let width = ((view.frame.width) - 40) * 3
//        let cellSpacing = 10 * (2)
//        
//        let leftInset = (collectionView.frame.width - CGFloat(width) + CGFloat(cellSpacing)) / 2
//        let rightInset = leftInset
//        
//        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
//        
//    }
    
}
