//
//  ModelProductionEntity.swift
//  EconSim17
//
//  Created by Robin Xu on 29/5/2017.
//  Copyright © 2017 Robin Xu. All rights reserved.
//

import Foundation

class ProductionEntity: NSObject, NSCoding {
    
    var name: String
    var workersMax: Int
    var workersAssigned: Int
    
    var efficiencyAtTick: Dictionary<String, Int> = [
        "food": 0,
        "balance": 0,
        "income" : 0,
        "population" : 0
    ]
    
    init(name: String, workersMax: Int) {
        self.workersAssigned = 0
        self.name = name
        self.workersMax = workersMax
        
    }
    
    required convenience init(coder aDecoder:NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let workersMax = aDecoder.decodeInteger(forKey: "workersMax")
        
        self.init(name: name, workersMax: workersMax)
        
        // TODO: decode efficiency at tick.
        
    }
    
    func encode(with aCoder:NSCoder) {
        
        // TODO: encode properties.
        
    }
}
