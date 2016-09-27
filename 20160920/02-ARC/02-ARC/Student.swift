//
//  Student.swift
//  02-ARC
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Cocoa

class Student: NSObject {
    var age=0
    lazy var closure:()->()={
      //[weak self] in //类似oc weakself
      [unowned self] in //把self 对象 改为无主引用
      print("age:\(self.age)")
    }
    deinit{
        print("student bye ...")
    }
}
