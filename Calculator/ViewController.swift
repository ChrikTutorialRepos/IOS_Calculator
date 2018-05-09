//
//  ViewController.swift
//  Calculator
//
//  Created by Chris Kelly on 4/28/18.
//  Copyright © 2018 ck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var placeHolder : String = ""
    var firstNum : Float = 0
    var oper : Int = 0
    var isDecimal : Bool = false
    var newNum : Bool = true

    //BUTTONS
    @IBAction func NumberPress(_ sender: UIButton) {
        
        if newNum == true {
            if sender.tag == 10 {
                display.text = "0."
                isDecimal = true
            }
            else if sender.tag == 0 {
                if Float(display.text!)! != 0 {
                    display.text = "\(sender.tag)"
                }
            }
            else {
                display.text = "\(sender.tag)"
            }
            if sender.tag != 0 {
                newNum = false
            }
        }
        else {
            if sender.tag == 10 {
                if isDecimal == false {
                    display.text! += "."
                    isDecimal = true
                }
            }
            else {
                display.text! += "\(sender.tag)"
            }
        }
    }
    
    @IBAction func UniaryOp(_ sender: UIButton) {
        newNum = true
        if sender.tag == 0 {
            let cur : Float = Float(display.text!)!
            if oper == 0 {
                firstNum = cur
            }
            if oper == 1 {
                add(cur: cur)
            }
            else if oper == 2 {
                sub(cur: cur)
            }
            else if oper == 3 {
                mul(cur: cur)
            }
            else if oper == 4 {
                div(cur: cur)
            }
            else if oper == 5 {
                mod(cur: cur)
            }
            oper = 0
            
            if firstNum - firstNum.rounded(.down) == 0 {
                display.text = "\(Int(firstNum))"
            }
            else {
                display.text = "\(firstNum)"
            }
        }
        if sender.tag == 1 {
            display.text = "0"
            firstNum = 0
            oper = 0
            isDecimal = false
        }
        if sender.tag == 2 {
            var cur : Float = Float(display.text!)!
            cur = -1 * cur
            if !isDecimal {
                display.text = "\(Int(cur))"
            }
            else {
                display.text = "\(cur)"
            }
        }
    }

    @IBAction func BiOp(_ sender: UIButton) {
        let cur : Float = Float(display.text!)!
        if !newNum {
            if oper == 0 {
                firstNum = cur
            }
            if oper == 1 {
                add(cur: cur)
            }
            else if oper == 2 {
                sub(cur: cur)
            }
            else if oper == 3 {
                mul(cur: cur)
            }
            else if oper == 4 {
                div(cur: cur)
            }
            else if oper == 5 {
                mod(cur: cur)
            }
            if firstNum - firstNum.rounded(.down) == 0 {
                display.text = "\(Int(firstNum))"
            }
            else {
                display.text = "\(firstNum)"
            }
            newNum = true
        }
        oper = sender.tag
    }
    
    //HELPER FUNCTIONS
    func containsNum () -> Bool {
        var result : Bool = false
        for i in 1...9{
            if display.text!.contains("\(i)") {
                result = true
                break
            }
        }
        return result
    }
    
    func add(cur : Float){
        firstNum = firstNum + cur
    }
    func sub(cur : Float){
        firstNum = firstNum - cur
    }
    func mul(cur : Float){
        firstNum = firstNum * cur
    }
    func div(cur : Float){
        firstNum = firstNum / cur
    }
    func mod(cur : Float){
        firstNum = Float(Int(firstNum) % Int(cur))
    }
}

