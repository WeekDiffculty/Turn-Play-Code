//
//  House.swift
//  02-ARC
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Cocoa

class House: NSObject {
    var unit:String
   weak var teant:Person?
    init(unit:String){
        self.unit=unit
    }
    deinit{
        print("house:\(unit) bye ...")
    }
}
