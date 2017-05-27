//
//  SecondViewController.swift
//  EconSim17
//
//  Created by Robin Xu on 21/5/2017.
//  Copyright © 2017 Robin Xu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BuildLibraryClicked(_ sender: UIButton) {
        appController?.economy.buildLibrary()
    }

}

