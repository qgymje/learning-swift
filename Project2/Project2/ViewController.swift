//
//  ViewController.swift
//  Project2
//
//  Created by jimmychain on 1/16/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()//flag的名字列表
    var score = 0//分数
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco","nigeria", "poland", "russia",  "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 2
        
        button1.layer.borderColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.4).CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
       
        askQuestion()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: UIButton) {
        var messageTitle: String
        
        if sender.tag == correctAnswer {
            messageTitle = "Correct"
            score += 1
        } else {
            messageTitle = "Wrong"
            score -= 1
        }
        
        let messageText = "Your score is \(score)"
        
        let ac = UIAlertController(title: messageTitle, message: messageText, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion:nil)
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countries = countries.shuffle()
        print(countries)
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = Int(arc4random_uniform(3))
        
        title = countries[correctAnswer].uppercaseString
    }
}




