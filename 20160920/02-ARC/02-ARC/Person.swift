//
//  Person.swift
//  02-ARC
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Cocoa

class Person: NSObject {
    var name:String
    weak var house:House?
    //构造器
    init(name:String){
        self.name=name
    }
    //析构器 oc dealloc 退出/销毁当前对象的时候
    deinit{
        print("person:\(name) bye ...")
    }
    
}
