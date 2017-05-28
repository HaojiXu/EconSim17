//
//  ModelAppController.swift
//  EconSim17
//
//  Created by Robin Xu on 21/5/2017.
//  Copyright © 2017 Robin Xu. All rights reserved.
//

import Foundation
import Darwin

class AppController {
    
    var economy: Economy
    
    init(econ: Economy) {
        economy = econ
        
        loadDataFromDisk()
    }
    
    // Ticking & Events
    func startTicking() {
        while true {
            // Check Ticking Speed
            if(economy.tickSpeed <= 4) {
                self.onTick()
                sleep(UInt32(economy.tickSpeed))
            } else {
                sleep(1)
            }
        }
    }
    
    func onTick() {
        self.economy.onTick()
    }
    
    // Presenting, Organizing, S/Ling Data
    //获取沙盒文件夹路径
    func documentsDirectory()->String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentationDirectory,FileManager.SearchPathDomainMask.userDomainMask,true)
        let documentsDirectory:String = paths.first!
        return documentsDirectory
    }
    
    //获取数据文件地址
    func dataFilePath ()->String{
        return self.documentsDirectory()+"userList.plist"
    }
    
    
    func presentDataSource(sect: Int) -> String {
        if sect == 0 {
            return String(describing: self.economy.properties["balance"]!)
        }
        
        if sect == 1 {
            return String(describing: self.economy.properties["income"]!)
        }
        
        if sect == 2 {
            return String(describing: self.economy.properties["population"])
        }
        
        return "null"
        
    }
    
    func saveDataToDisk() {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: economy)
        UserDefaults.standard.set(encodedData, forKey: "economy")
        UserDefaults.standard.synchronize()
    }
    
    enum LoadError: Error {
        case Error
    }
    
    func loadDataFromDisk() {

        do {
            try decodeData()
        } catch {
            print("First Use.")
        }
    }
    
    func decodeData() throws {
        guard let decoded = UserDefaults.standard.object(forKey: "economy") as! Data? else {
            throw LoadError.Error
        }
        economy = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! Economy
        print("Restore Complete.")
    }
    
}
