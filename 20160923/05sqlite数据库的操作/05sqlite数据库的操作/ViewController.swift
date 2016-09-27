//
//  ViewController.swift
//  05sqlite数据库的操作
//
//  Created by qingyun on 16/9/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //
        let db=DbHandle()
        
        //插入
        let sEntity=StudentEntity()
        sEntity.id="1006"
        sEntity.name="李四"
        sEntity.age="15"
        sEntity.address="郑州市"
        
        db.insert(sEntity)
        //更新
        sEntity.address="开封"
        db.update(sEntity)
        
        //查询
        let arr=db.query()
        
        for item in arr{
            let sEntity:StudentEntity=item as! StudentEntity
            let sName:String=sEntity.name as String
            
            print("学生姓名:\(sName) 地址:\(sEntity.address) 年龄:\(sEntity.age)")
        }
        
        db.Delete(sEntity.id)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

