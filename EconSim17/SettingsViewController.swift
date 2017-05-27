//
//  SettingsViewController.swift
//  EconSim17
//
//  Created by Robin Xu on 23/5/2017.
//  Copyright © 2017 Robin Xu. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UITableViewController {
    

    @IBOutlet weak var appSpeedChanger: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var SegmentIndex: Int = 0
        
        switch (appController?.economy.tickSpeed)! {
        case 100000 :
            SegmentIndex = 0;
            break;
        case 4 :
            SegmentIndex = 1;
            break;
        case 2 :
            SegmentIndex = 2;
            break;
        case 1 :
            SegmentIndex = 3;
            break;
        default :
            SegmentIndex = 0;
            appController?.economy.tickSpeed = 100000;
        }
        
        appSpeedChanger.selectedSegmentIndex = SegmentIndex
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SegmentValueChanged(_ sender: Any) {
        let SegmentIndex: Int = appSpeedChanger.selectedSegmentIndex
        
        switch SegmentIndex {
        case 0:
            appController?.economy.tickSpeed = 100000;
            break
        case 1:
            appController?.economy.tickSpeed = 4;
            break
        case 2:
            appController?.economy.tickSpeed = 2;
            break
        case 3:
            appController?.economy.tickSpeed = 1;
            break
        default:
            appController?.economy.tickSpeed = 100000;
        }
        
    }
    
    @IBAction func OnResetClicked(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "economy")
        userDefaults.removeObject(forKey: "properties")
        userDefaults.synchronize()
        
        appController?.economy = Economy()
        
    }
    

}
