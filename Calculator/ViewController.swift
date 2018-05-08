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
    var isDecimal : Bool = false

    @IBAction func NumberPress(_ sender: UIButton) {
        if display.text!.count < 15 {
            var char : String = "\(sender.tag)"
            if display.text == "0" && char != "10" {
                display.text = char
            }
            else{
                if char == "10" {
                    if isDecimal == false {
                        char = "."
                        display.text! += char
                        isDecimal = true
                    }
                }
                else{
                    display.text! += char
                }
            }
        }
    }
    
    @IBAction func UniaryOp(_ sender: UIButton) {
        display.text = "0"
        isDecimal = false
    }
    
    @IBAction func BiOp(_ sender: UIButton) {
        
    }
    
}

