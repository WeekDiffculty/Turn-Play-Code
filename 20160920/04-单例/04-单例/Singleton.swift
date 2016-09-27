//
//  Singleton.swift
//  04-单例
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation
class Singleton:NSObject{
    //一.oc的写法
//    static var shareInstance:Singleton{
//        struct Static{
//            static var onceToken:dispatch_once_t=0
//            static var instance:Singleton
//        }
//        dispatch_once(&Static.onceToken, )
//    }
    //二.swift 写法
    static var shareInstance=Singleton()
    private override init() {
        //设置构造器为私有,避免在外部类中创建新的实例,保证唯一性
        
    }
}