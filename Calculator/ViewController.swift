//
//  ViewController.swift
//  Calculator
//
//  Created by Alexander Rozhdestvenskiy on 05.09.2020.
//  Copyright © 2020 AlexRozh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInMiddleOfTyping: Bool = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
            
        } else {
            display.text = digit
            userIsInMiddleOfTyping = true
        }
    }
    
    var displayValue: Double { // Computed Properties
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func perfomOperation(_ sender: UIButton) {
        if userIsInMiddleOfTyping {
            brain.setOperand(displayValue)
        userIsInMiddleOfTyping = false
        }
        if let matematicalSymbol = sender.currentTitle {
            brain.performOperation(matematicalSymbol)
        }
        if let result = brain.result {
        displayValue = result
        }
    }
}

