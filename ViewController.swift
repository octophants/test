//
//  ViewController.swift
//  Week 3 - Calculator
//
//  Created by Samyukta Madhu on 2/18/16.
//  Copyright © 2016 Sam Madhu. All rights reserved.
//

import UIKit

enum modes {
    case NOT_SET
    case ADDITION
    case SUBTRACTION
    case MULTIPLICATION
    case DIVISION
}


class ViewController: UIViewController {

    var labelString:String = "0"
    var currentMode:modes = modes.NOT_SET
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var daynightlabel: UIButton!
    
    @IBOutlet weak var plus: UIButton!
    
    @IBOutlet weak var minus: UIButton!
    
    @IBOutlet weak var multiply: UIButton!
    
    @IBOutlet weak var divide: UIButton!
   
    @IBOutlet weak var equalslabel: UIButton!
    
    @IBAction func dayNight(sender: UISwitch) {
        if(sender.on){
            print("day light mode is on")
            turnEverythingToDay()
        } else {
            print("day light mode is off")
            turnEverythingToNight()
        }
    }
    
    func turnEverythingToDay(){
        view.backgroundColor = UIColor.whiteColor()
        plus.backgroundColor = UIColor.blackColor()
        minus.backgroundColor = UIColor.blackColor()
        multiply.backgroundColor = UIColor.blackColor()
        divide.backgroundColor = UIColor.blackColor()
        daynightlabel.backgroundColor = UIColor.orangeColor()
        equalslabel.backgroundColor = UIColor.orangeColor()
    }
    
    func turnEverythingToNight(){
        view.backgroundColor = UIColor.blackColor()
        plus.backgroundColor = UIColor.blueColor()
        minus.backgroundColor = UIColor.blueColor()
        multiply.backgroundColor = UIColor.blueColor()
        divide.backgroundColor = UIColor.blueColor()
        daynightlabel.backgroundColor = UIColor.yellowColor()
        equalslabel.backgroundColor = UIColor.yellowColor()
        
    }
    
    
    @IBAction func tapped0(sender: AnyObject) {tappedNumber(0)}
    @IBAction func tapped1(sender: AnyObject) {tappedNumber(1)}
    @IBAction func tapped2(sender: AnyObject) {tappedNumber(2)}
    @IBAction func tapped3(sender: AnyObject) {tappedNumber(3)}
    @IBAction func tapped4(sender: AnyObject) {tappedNumber(4)}
    @IBAction func tapped5(sender: AnyObject) {tappedNumber(5)}
    @IBAction func tapped6(sender: AnyObject) {tappedNumber(6)}
    @IBAction func tapped7(sender: AnyObject) {tappedNumber(7)}
    @IBAction func tapped8(sender: AnyObject) {tappedNumber(8)}
    @IBAction func tapped9(sender: AnyObject) {tappedNumber(9)}
    
    
    @IBAction func tappedPlus(sender: AnyObject) {
        changeMode(modes.ADDITION)
    }
    
    
    @IBAction func tappedMinus(sender: AnyObject) {
        changeMode(modes.SUBTRACTION)
    }
    
    
    @IBAction func tappedMultiply(sender: AnyObject) {
        changeMode(modes.MULTIPLICATION)
    }
    
    
    @IBAction func tappedDivide(sender: AnyObject) {
        changeMode(modes.DIVISION)
    }
    
    @IBAction func tappedEquals(sender: AnyObject) {
        guard let num:Int = Int(labelString) else {
            return
        }
        if currentMode == modes.NOT_SET || lastButtonWasMode {
            return
        }
        if currentMode == modes.ADDITION {
            savedNum += num
        }
        else if currentMode == modes.SUBTRACTION {
            savedNum -= num
        }
        else if currentMode == modes.MULTIPLICATION {
            savedNum *= num
        }
        else if currentMode == modes.DIVISION {
            savedNum /= num
        }
        currentMode = modes.NOT_SET
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    
    
    @IBAction func tappedClear(sender: AnyObject) {
        savedNum = 0
        labelString = "0"
        label.text = "0"
        currentMode = modes.NOT_SET
        lastButtonWasMode = false
        
    }
    
    func tappedNumber(num:Int) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = "0"
        }
        labelString = labelString.stringByAppendingString("\(num)")
        updateText()
        
    }
    
    func updateText(){
        guard let labelInt:Int = Int(labelString) else {
            label.text = "Number too big!"
            return
        }
        if currentMode == modes.NOT_SET {
            savedNum = labelInt
        }
        let formatter:NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let num:NSNumber = NSNumber(integer: labelInt)
        label.text = formatter.stringFromNumber(num)
    }
    
    func changeMode(newMode:modes) {
        if savedNum == 0 {
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
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

