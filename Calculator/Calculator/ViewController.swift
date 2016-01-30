//
//  ViewController.swift
//  Calculator
//
//  Created by jimmychain on 1/22/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var isTypingNumber = false
    
    var brain = CalculatorBrain()
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if isTypingNumber {
            display.text! += digit
        } else {
            isTypingNumber = true
            display.text! = digit
        }
    }
    
    @IBAction func enter() {
        isTypingNumber = false
        if let result = brain.pushOperand(displayValue) {
           displayValue = result
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if isTypingNumber {
            enter()
        }
        
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

