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

    @IBAction func NumberPress(_ sender: UIButton) {
        var char : String = "\(sender.tag)"
        if char == "10" {
            char = "."
        }
        if display.text == "0" {
            display.text = char
        }
        else{
            display.text! += char
        }
    }
    
    @IBAction func UniaryOp(_ sender: UIButton) {
        display.text = "0"
    }
    
    @IBAction func BiOp(_ sender: UIButton) {
        
    }
    
}

