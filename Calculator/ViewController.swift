//
//  ViewController.swift
//  Calculator
//
//  Created by Максим Юрьев on 17.01.2024.
//

import UIKit

class ViewController: UIViewController {
    var valueAfterAct: Double = 0
    var result: Double = 0
    var isNewValue: Bool = true
    var mathOperation: mathOperations? = nil
    var previousOperation: mathOperations? = nil
    

    @IBOutlet weak var resultLabel: UILabel!

    
    @IBAction func zeroButton(_ sender: Any) {
        addDigit("0")
    }
    @IBAction func oneButton(_ sender: Any) {
        addDigit("1")
    }
    @IBAction func twoButton(_ sender: Any) {
        addDigit("2")
    }
    @IBAction func threeButton(_ sender: Any) {
        addDigit("3")
    }
    @IBAction func fourButton(_ sender: Any) {
        addDigit("4")
    }
    @IBAction func fiveButton(_ sender: Any) {
        addDigit("5")
    }
    @IBAction func sixButton(_ sender: Any) {
        addDigit("6")
    }
    @IBAction func sevenButton(_ sender: Any) {
        addDigit("7")
    }
    @IBAction func eightButton(_ sender: Any) {
        addDigit("8")
    }
    @IBAction func nineButton(_ sender: Any) {
        addDigit("9")
    }
    
    
    @IBAction func clearButton(_ sender: Any) {
        valueAfterAct = 0
        result = 0
        isNewValue = true
        resultLabel.text = "0"
    }
    
    @IBAction func sumButton(_ sender: Any) {
        previousOperation = nil
        mathOperation = mathOperations.sum
        result = toDobule(digits: resultLabel.text!)
        isNewValue = true
    }
    
    @IBAction func minusButton(_ sender: Any) {
        previousOperation = nil
        mathOperation = mathOperations.substract
        result = toDobule(digits: resultLabel.text!)
        isNewValue = true
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        previousOperation = nil
        mathOperation = mathOperations.multiplication
        result = toDobule(digits: resultLabel.text!)
        isNewValue = true
    }
    
    @IBAction func divideButton(_ sender: Any) {
        previousOperation = nil
        mathOperation = mathOperations.division
        result = toDobule(digits: resultLabel.text!)
        isNewValue = true
    }

    @IBAction func resultButton(_ sender: Any) {
        if previousOperation != mathOperation {
            valueAfterAct = toDobule(digits: resultLabel.text!)
        }
        
        result = (mathOperation?.makeOperation(valueBeforeAct: result, valueAfterAct: valueAfterAct))!
        previousOperation = mathOperation
        let splitDouble = modf(result)
        if splitDouble.1 > 0 || splitDouble.1 < 0 {
            resultLabel.text = "\(result)"
        }
        else {
            resultLabel.text = "\(Int(result))"
        }
        isNewValue = true
    }
    
    func toDobule(digits: String) -> Double {
        return Double(digits)!
    }
    
    func addDigit(_ digit: String) {
        if isNewValue {
            resultLabel.text = ""
            isNewValue = false
        }
            resultLabel.text = resultLabel.text! + digit
    }


}

enum mathOperations {
    case sum, substract, multiplication, division
    
    func makeOperation(valueBeforeAct: Double, valueAfterAct: Double) -> Double {
        switch self {
        case .sum:
            return (valueBeforeAct + valueAfterAct)
        case .substract:
            return (valueBeforeAct - valueAfterAct)
        case .multiplication:
            return (valueBeforeAct * valueAfterAct)
        case .division:
            return (valueBeforeAct / valueAfterAct)
        }

    }
}

