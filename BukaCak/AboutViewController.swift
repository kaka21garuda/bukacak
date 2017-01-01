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

let aboutMe: About = About(image: #imageLiteral(resourceName: "profile"), title: "My name is Buka Cakrawala 😉", text: "Hi, I'm a 17 year old sofware developer based in San Francisco, CA. I was born in Indonesia🇮🇩 and currently studying at a Programming School called Make School in downtown San Francisco.\n\nMy passions lie in programming especially iOS, backend, and UI/UX design. I relish working in collaborative environments with other creative minds. Additionally I'm a huge fan of Sherlock Holmes🕵🏻.")

let inspiration: About = About(image: #imageLiteral(resourceName: "bulb"), title: "👨🏼‍💻Inspiration", text: "My biggest inspiration person is Thomas Alva Edison. The person who taught me that everything in life is possible as long as you believe what you're doing is right and you put a 100% effort into it. He makes me think to try at least one more time wherever I failed or did something wrong.")

let futurePlan: About = About(image: #imageLiteral(resourceName: "building"), title: "Future Plan", text: "My future plan is to become a good iOS developer as I really enjoy doing mobile apps development. I will never stop creating cool apps and ship it in the App Store, code in Swift everyday, learn by making!.\nLearn by doing in my opinion is the best practice for anyone to always get better in programming.I am indeed looking for internship opportunity in 2017's upcoming summer in order for me to increase my engineering skills into a higher level.")

class AboutViewController: UIViewController {
    
    let aboutLists:[About] = [aboutMe, inspiration, futurePlan]
    
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBAction func dismissButtonAsAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorGradientBackground()
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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

extension AboutViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "aboutCell", for: indexPath) as! AboutCollectionViewCell

        cell.imageView.image = aboutLists[indexPath.item].image
        cell.titleLabel.text = aboutLists[indexPath.item].title
        cell.contentTextView.text = aboutLists[indexPath.item].text
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.cornerRadius = 17
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ((view.frame.width) / 2) + 95
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
