//
//  ModelEconomy.swift
//  EconSim17
//
//  Created by Robin Xu on 21/5/2017.
//  Copyright © 2017 Robin Xu. All rights reserved.
//

import Foundation

class Economy: NSObject, NSCoding {
    
    
    var properties: Dictionary<String, Int> = [
        "balance" : 0,
        "population" : 0,
        "income" : 0
    
    ]

    var tickSpeed: Int = 100000
    
    override init() {
        
        properties["balance"] = 1000
        properties["population"] = 5
        properties["income"] = 10
        
        super.init()
        
    }
    
    func initAfterLoad() {
        if tickSpeed < 1 {
            tickSpeed = 1000000
        }
    }
    
    
    required convenience init(coder aDecoder:NSCoder) {
        
        self.init()
        
        tickSpeed = aDecoder.decodeInteger(forKey: "tickspeed")
        properties = UserDefaults.standard.value(forKey: "properties") as! Dictionary<String, Int>
        
        
        self.initAfterLoad()
        
    }
    
    func encode(with aCoder:NSCoder) {
        aCoder.encode(tickSpeed, forKey: "tickspeed")
        UserDefaults.standard.setValue(properties, forKey: "properties")
        UserDefaults.standard.synchronize()
    }
    
    func onTick() {
        // Implement all onTick actions here.
        properties.updateValue(properties["balance"]! + properties["income"]!, forKey: "balance")
    }
    
    // Specific Governance Actions
    func buildLibrary() {
        

        properties.updateValue(properties["balance"]! - 500, forKey: "balance")
        properties.updateValue(properties["income"]! + 50, forKey: "income")

    }
    
    
}
