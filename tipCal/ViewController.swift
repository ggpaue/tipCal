//
//  ViewController.swift
//  tipCal
//
//  Created by Guanpeng Gao on 9/24/16.
//  Copyright © 2016 Guanpeng Gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billText: UILabel!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var totalText: UILabel!
    
    @IBOutlet weak var numOfPeo: UILabel!
    @IBOutlet weak var perPer: UILabel!
    
    @IBOutlet weak var splitControl: UISlider!
    
    let dayTheme = UIColor(red: 230/255, green: 234/255, blue: 199/255, alpha: 1.0)
    let dayText = UIColor(red: 45/255, green: 39/255, blue: 44/255, alpha: 1.0)
    
    let nightTheme = UIColor(red: 107/255, green: 97/255, blue: 101/255, alpha: 1.0)
    let nightText = UIColor(red: 226/255, green: 242/255, blue: 220/255, alpha: 1.0)
    
    //let input text field become the first responder
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        
    }
    
    //execute every time view appear
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        var tip = defaults.integerForKey("defaultTip")
        
        if(tip == NSNotFound) {
            tip = 0;
        }
        tipControl.selectedSegmentIndex = tip;
        
        let defaults2 = NSUserDefaults.standardUserDefaults()
        //let defaults = NSUserDefaults.standardUserDefaults()
        var backColor = defaults2.integerForKey("bgColor")
        if(backColor == NSNotFound) {
            backColor = 0;
        }
        
        
        if backColor == 0 {
            setColor(dayTheme, textColor: dayText)
        } else {
            setColor(nightTheme, textColor: nightText)
        }
    }
    
    func setColor(themeColor: UIColor, textColor: UIColor) {
        view.backgroundColor = themeColor
        tipLabel.textColor = textColor
        totalLabel.textColor = textColor
        billText.textColor = textColor
        tipText.textColor = textColor
        totalText.textColor = textColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.2, 0.25]
        let splitControlValue = roundf(splitControl.value)
        let vTotalPerson = splitControlValue
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        numOfPeo.text = "\(Int(splitControlValue))"
        
        let perMoney = total / Double(vTotalPerson)
        perPer.text = String(format: "$%.2f", perMoney)
    }
    
    

}

