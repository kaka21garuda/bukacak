//
//  MainProjectShowCase.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/3/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class MainProjectShowCase: UIViewController {
    
    var pageViewController: UIPageViewController!
    var pageTitle: NSArray!
    var pageImage: NSArray!
    
    
    
    @IBAction func restartAction(_ sender: Any) {
        
        let startVC = self.viewControllerAtIndex(index: 0) as ContentProjectsViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: .forward, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageTitle = NSArray(objects: "Explore", "Today Widget")
        self.pageImage = NSArray(objects: "ipsmaIphoneShot1", "ipsmaIphoneShot2")
        
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(index: 0) as ContentProjectsViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.size.height - 60)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
        
    }
    
    func viewControllerAtIndex(index: Int) -> ContentProjectsViewController {
        
        if ((self.pageTitle.count == 0) || (index >= self.pageTitle.count)) {
            
            return ContentProjectsViewController()
            
        }
        
        let viewController: ContentProjectsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentProjectsViewController
        
        viewController.imagefile = self.pageImage[index] as! String
        viewController.titleText = self.pageTitle[index] as! String
        viewController.pageIndex = index
        
        return viewController
    }
    
    
}

extension MainProjectShowCase: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentProjectsViewController
        var index = vc.pageIndex as Int
        
        if (index == 0) || (index == NSNotFound) {
            
            return nil
            
        }
        
        index -= 1
        return self.viewControllerAtIndex(index: index)
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentProjectsViewController
        var index = vc.pageIndex as Int
        
        if index == NSNotFound {
            
            return nil
            
        }
        
        index += 1
        if index == self.pageTitle.count {
            return nil
        }
        
        return self.viewControllerAtIndex(index: index)
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pageTitle.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }


}
