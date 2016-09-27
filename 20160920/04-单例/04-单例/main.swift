//
//  main.swift
//  04-单例
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation

print("Hello, World!")

let instance=Singleton.shareInstance
let instance1=Singleton.shareInstance
let instance2=Singleton.shareInstance
print(instance)
print(instance1)
print(instance2)