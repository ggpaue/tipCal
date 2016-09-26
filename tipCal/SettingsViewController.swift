//
//  SettingsViewController.swift
//  tipCal
//
//  Created by Guanpeng Gao on 9/24/16.
//  Copyright © 2016 Guanpeng Gao. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSetControl: UISegmentedControl!
    
    @IBOutlet weak var colorControl: UISegmentedControl!
    
    
    @IBOutlet weak var themeSetting: UILabel!
    
    @IBOutlet weak var perSetting: UILabel!
    
    let dayTheme = UIColor(red: 230/255, green: 234/255, blue: 199/255, alpha: 1.0)
    let dayText = UIColor(red: 45/255, green: 39/255, blue: 44/255, alpha: 1.0)
    
    let nightTheme = UIColor(red: 107/255, green: 97/255, blue: 101/255, alpha: 1.0)
    let nightText = UIColor(red: 226/255, green: 242/255, blue: 220/255, alpha: 1.0)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //execute every time the view loads
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = defaults.integerForKey("defaultTip")
        
        if defaultTip == NSNotFound {
            defaultTip = 0
        }
        
        tipSetControl.selectedSegmentIndex = defaultTip
        
        let defaults2 = NSUserDefaults.standardUserDefaults()
        var bgColor = defaults2.integerForKey("bgColor")
        colorControl.selectedSegmentIndex = bgColor
        
        let color = colorControl.selectedSegmentIndex
        
        if color == 0 {
            setColor(dayTheme, textColor: dayText)
        } else {
            setColor(nightTheme, textColor: nightText)
        }

    }
    
    func setColor(themeColor: UIColor, textColor: UIColor) {
        view.backgroundColor = themeColor
        themeSetting.textColor = textColor
        perSetting.textColor = textColor
    }
    
    @IBAction func getDefaultTipPercentage(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(tipSetControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }
    
    @IBAction func getColor(sender: AnyObject) {
        let defaults2 = NSUserDefaults.standardUserDefaults()
        
        defaults2.setInteger(colorControl.selectedSegmentIndex, forKey: "bgColor")
        defaults2.synchronize()
        
        let color = colorControl.selectedSegmentIndex
        
        if color == 0 {
            setColor(dayTheme, textColor: dayText)
        } else {
            setColor(nightTheme, textColor: nightText)
        }
    }

}
