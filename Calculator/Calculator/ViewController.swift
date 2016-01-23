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
    var numbers = [Double]()
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
        numbers.append(displayValue)
        print("operation = \(numbers)")
    }
    
    @IBAction func appendOperator(sender: UIButton) {
        let operation = sender.currentTitle!
        if isTypingNumber {
            enter()
        }
        switch operation {
            case "÷": performeOperation(divide)
            
            case "×": performeOperation({(d1: Double, d2: Double) -> Double in
                return d1 * d2
            })
            
            case "+": performeOperation({(d1,d2) in
                d1 + d2
            })
            
            case "−": performeOperation { $1 - $0 }
            
            case "√": performeOperation { sqrt($0) }
            
            default: break
        }
    }
    
    private func performeOperation(operation: (Double, Double) -> Double) {
        displayValue = operation(fetchAnumber(), fetchAnumber())
        enter()
    }
    
    private func performeOperation(operation: ( Double) -> Double) {
        displayValue = operation(fetchAnumber())
        enter()
    }
    
    private func divide(d1: Double, d2: Double ) -> Double {
        if d1 != 0.0 {
            return d2 / d1
        }
        print("error")
        return 0.0
    }
    
    private func fetchAnumber() ->Double {
        if numbers.count > 0 {
            return numbers.removeLast()
        }
        return 0.0
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

