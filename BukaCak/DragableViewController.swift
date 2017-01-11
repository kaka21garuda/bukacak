//
//  DragableViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/10/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class DragableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view1 = DragableView(frame: CGRect(x: 160-100, y: 120, width: 200, height: 300), fileName: "profile")
        let view2 = DragableView(frame: CGRect(x: 160-100, y: 120, width: 200, height: 300), fileName: "profile")
        let view3 = DragableView(frame: CGRect(x: 160-100, y: 120, width: 200, height: 300), fileName: "profile")
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
