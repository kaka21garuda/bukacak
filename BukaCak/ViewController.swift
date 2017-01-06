//
//  ViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/5/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    
    let myText = "import UIKit\nimport Awesomeness\n\nclass Viewcontroller: UIViewController {\n\n    let messsage = AwesomeText(message: 'hello,')\n\n    override func viewDidLoad() {\n       super.viewDidLoad()\n\n       message.sayHello()\n    }\n}\n\nextension ViewController: UIAwesomeDelegate {\n\n    func world() -> String {\n       return 'world'\n    }\n}"
    var myCounter = 0
    var timer:Timer?
    func fireTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.typeLetter), userInfo: nil, repeats: true)
    }
    
    func typeLetter(){
        if myCounter < (Array(myText.characters)).count {
            textView.text = textView.text! + String(Array(myText.characters)[myCounter])
            let randomInterval = 0.014
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: randomInterval, target: self, selector: #selector(ViewController.typeLetter), userInfo: nil, repeats: false)
        } else {
            timer?.invalidate()
        }
        myCounter += 1
        //changeColor()
    }
    
    func changeColor() {
        let string: NSMutableAttributedString = NSMutableAttributedString(string: self.textView.text!)
        let words = textView.text!.components(separatedBy: " ")
        for word in words {
            if word.hasPrefix("import") {
                print("found one")
                let range = (self.textView.text! as NSString).range(of: word)
                string.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: range)
            } else {
                print("no word match")
            }
        }
        self.textView.attributedText = string
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fireTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fireTimer()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
