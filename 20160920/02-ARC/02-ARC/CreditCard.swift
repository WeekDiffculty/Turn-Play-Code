//
//  CreditCard.swift
//  02-ARC
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Cocoa

class CreditCard: NSObject {
    var num:String
    unowned var customer:Customer
    init(num:String,customer:Customer){
        self.num=num
        self.customer=customer
    }
    //析构器
    deinit{
        print("card :\(num) bye ...")
    }
}
