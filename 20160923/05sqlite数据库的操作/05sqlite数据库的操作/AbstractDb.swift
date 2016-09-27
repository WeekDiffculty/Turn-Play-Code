//
//  AbstractDb.swift
//  05sqlite数据库的操作
//
//  Created by qingyun on 16/9/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit
let DbFileName="student.sqlite"
class AbstractDb: NSObject {
    var DbPath:String!
    override init(){
        super.init()
        
        let home=NSHomeDirectory() as NSString
        let docPath=home.stringByAppendingPathComponent("Documents") as NSString
        
        self.DbPath=docPath.stringByAppendingPathComponent(DbFileName)
        print(self.DbPath)
        
        
    }
}
