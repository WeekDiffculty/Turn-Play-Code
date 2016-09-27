//
//  NSDataExtension.swift
//  01-面向对象的基本语法
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation
//扩展NSDate 类似 oc 类别
extension NSDate{
     //static 修饰的属性是类型的属性,访问的时候 类名.属性名
    static var thisYear:Int{
        
        let dateFormatter=NSDateFormatter()
        dateFormatter.dateFormat="yyyy/MM/dd" //格式:年/月/日
        let dateStr=dateFormatter.stringFromDate(NSDate())
        let strArr=dateStr.componentsSeparatedByString("/")
        return Int(strArr[0])!
        
    }
}