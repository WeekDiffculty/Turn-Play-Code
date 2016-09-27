//
//  swiftClass.swift
//  06 oc与swift混编
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Cocoa
//swift 调用oc的类
//swift的类 必须要继承 NSObject 才能被oc使用
class swiftClass: NSObject {
    var ocobj=OCClass()
}
