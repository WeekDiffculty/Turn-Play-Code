//
//  Country.swift
//  02-ARC
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Cocoa

class Country: NSObject {
    var name:String
    weak var catial:City!
    init(name:String,capitalName:String){
        self.name=name
        super.init()
        self.catial=City(name:name,country:self)
    }
    
    deinit {
        print("country:\(name) bye ...")
    }
}
