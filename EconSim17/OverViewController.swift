//
//  FirstViewController.swift
//  EconSim17
//
//  Created by Robin Xu on 21/5/2017.
//  Copyright © 2017 Robin Xu. All rights reserved.
//

import UIKit

class OverViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let btnStartTag:Int = 1000  //定义btn的tag起始值
    var myTimer: Timer? = nil
    
    
    //数组，其中的数据是(String,String)格式的元组
    //其内容为列表的应用名和对应的appstore链接
    let name_links_tuples : [(String,Int)] =
        [
            ("Balance",0),
            ("Income",1),
            ("-",2),
            ("-",3),
            ]
    
    //初始化table，为了简化代码，frame为全屏尺寸
    let table:UITableView = UITableView(frame:CGRect(x:UIScreen.main.bounds.origin.x, y:UIScreen.main.bounds.origin.y+20, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height), style:UITableViewStyle.plain)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Log: OverViewController Started.")
        
        self.view!.addSubview(table)
        table.dataSource = self
        table.delegate = self
        
        myTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(OverViewController.UIUpdater), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func UIUpdater() {
        table.reloadData()
        
    }
    
    //实现datasource协议
    
    //table的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name_links_tuples.count
    }
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        
        let title :String = name_links_tuples[indexPath.row].0  //获取应用名
        cell.textLabel!.text = title
        
        let content :String = (appController?.presentDataSource(sect: name_links_tuples[indexPath.row].1))! // Get Content from model
        let label: UILabel = UILabel()
        label.frame = CGRect(x:UIScreen.main.bounds.width-100, y:0, width:80, height:cell.contentView.bounds.height)
        label.text = content
        label.textColor = UIColor.gray
        cell.contentView.addSubview(label)
        
        
        return cell
    }
    
    
    //禁止cell被点击选中
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    

}

