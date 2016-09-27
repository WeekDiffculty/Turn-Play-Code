//
//  Customer.swift
//  02-ARC
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Cocoa

class Customer: NSObject {
    var name:String
    var car:CreditCard?
    init(name:String){
        self.name=name
    }
    deinit{
        print("Customer:\(name) bye ...")
    }
}
