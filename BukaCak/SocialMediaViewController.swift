//
//  SocialMediaViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 12/29/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

class SocialMediaViewController: UIViewController {
    
    var instanceHome: HomeViewController!
    
    var url: URL!

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = URL(string: instanceHome.urlSocial(type: "linkedin"))
        
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func socialType(type: String) -> String {
        return type
    }
    
}
