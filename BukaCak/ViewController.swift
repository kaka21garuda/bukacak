//
//  ViewController.swift
//  BukaCak
//
//  Created by Buka Cakrawala on 1/5/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

enum NewLine {
    case old
    case new
}


class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var welcomeTextView: UITextView!
    @IBOutlet weak var codingTextView: UITextView!
    
    @IBOutlet var alertView: UIView!
    
    @IBOutlet weak var visualBlur: UIVisualEffectView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextAction(_ sender: Any) {
    }
    
    
    var effect: UIVisualEffect!
    
    let myText = " swift"
    let codingText = "    1> let me = Awesomeness()\n\n    2> me.deliver(message: \"Hello, \", to: \"world!\")\n\n    3> let welcome = UIAlertController(title: \"Welcome\", message: helloLanguage(), preferredStyle: .alert)\n\n    4> func helloLanguage() -> String {\n         if me.language == .english {\n            return \"Hello\"\n         } else if me.language == .spanish {\n            return \"Hola\"\n         } else {\n            return \"Welcome\"\n         }\n       }\n\n    ^D"

    
    
    var myCounter = 0
    var timer:Timer?
    
    var anotherCounter = 0
    var anotherTimer: Timer?
    
    func fireTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.typeLetter), userInfo: nil, repeats: true)

    }
    
    func fireCoding() {
        anotherTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.codeLetter), userInfo: nil, repeats: true)
    }
    
    func typeLetter(){
        if myCounter < (Array(myText.characters)).count {
            textView.text = textView.text! + String(Array(myText.characters)[myCounter])
            let randomInterval = 0.07
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: randomInterval, target: self, selector: #selector(ViewController.typeLetter), userInfo: nil, repeats: false)
        } else {
            timer?.invalidate()
            print("\n\n\n")
            print("timer validate in typeLetter()")
            print("\n\n\n")
            alpha(line: .new)
            //fireCoding()
        }
        myCounter += 1
    }
    
    func codeLetter() {
        if anotherCounter < (Array(codingText.characters)).count {
            codingTextView.text = codingTextView.text! + String(Array(codingText.characters)[anotherCounter])
            let interval = 0.01
            anotherTimer?.invalidate()
            anotherTimer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(ViewController.codeLetter), userInfo: nil, repeats: false)
        } else {
            anotherTimer?.invalidate()
            animateIn()
        }
        anotherCounter += 1
    }
    
    func alpha(line: NewLine) {
        if line == .old {
            welcomeTextView.alpha = 0.0
        } else {
            welcomeTextView.alpha = 1.0
            fireCoding()
        }
    }
    
    func animateIn() {
        self.view.addSubview(alertView)
        alertView.center = self.view.center
        
        alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.4) { 
            self.visualBlur.effect = self.effect
            self.alertView.alpha = 1.0
            self.alertView.transform = CGAffineTransform.identity
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alpha(line: .old)
        fireTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualBlur.effect
        visualBlur.effect = nil
        
        alertView.layer.cornerRadius = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
