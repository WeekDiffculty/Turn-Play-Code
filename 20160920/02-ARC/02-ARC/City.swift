//
//  City.swift
//  02-ARC
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Cocoa

class City: NSObject {
    var name:String
    unowned var country:Country
    init(name:String,country:Country){
        self.name=name
        self.country=country
    }
    deinit{
        print("city:\(name) bye ...")
    }
}
