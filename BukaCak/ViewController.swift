//
//  ViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/5/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //let myText = Array("Hello my name is Buka Cakrawala, Software Engineer based in San Francisco".characters)
    let importUIkit = "import UIKit"
    let importAwesome = "import Awesomeness"
    
    let classIntro = "class ViewController: UIViewController {"
    let object = "let message = AwesomeText(message: 'hello', NSTimer: 2.0)"
    let viewdidload = "override func viewDidLoad() {"
    let superviewdidload = "super.viewDidLoad()"
    let activateObject = "message.sayHello()"
    let end = "}"
    
    let extensionText = "extension ViewController: UIAwesomeDelegate {"
    let delegateFunction = "func hello() -> String {"
    let delegateMessage = "return ', world!'"
    let endFunction = "}"
    
     
    
    
    
    
    
    var counter = 0
    var timer: Timer?
    
//    func fireTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(typeLetter), userInfo: nil, repeats: true)
//    }
//    
//    func typeLetter() {
//        if counter < myText.count {
//            textField.text = textField.text! + String(myText[counter])
//            let randomInterval = Double((arc4random_uniform(8)+1))/20
//            timer?.invalidate()
//            timer = Timer.scheduledTimer(timeInterval: randomInterval, target: self, selector: #selector(typeLetter), userInfo: nil, repeats: true)
//        } else {
//            timer?.invalidate()
//        }
//        counter += 1
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //fireTimer()
        // Do any additional setup after loading the view.
        let array = (importUIkit.components(separatedBy: " "), importAwesome.components(separatedBy: " "))
        print(array)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
