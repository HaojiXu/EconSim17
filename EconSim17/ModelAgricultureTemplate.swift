//
//  ModelAgricultureTemplate.swift
//  EconSim17
//
//  Created by Robin Xu on 25/5/2017.
//  Copyright © 2017 Robin Xu. All rights reserved.
// 
//  Specifies specific Agriculture Plant template. 
//  
//  Logic Link: INDUSTRIES -> AGRICULTURE (1st Industry)

import Foundation
import UIKit

class ModelAgricultureTemplate: NSObject, NSCoding {
    
    override init() {
        
        
        super.init()
        
    }
    
    required convenience init(coder aDecoder:NSCoder) {
        
        self.init()
        
        
    }
    
    func encode(with aCoder:NSCoder) {

    }
    
}
