//
//  main.swift
//  02-ARC
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
//ARC:
/*
    强引用:如果一个对象被引用了,不会被销毁
    弱引用:一个对象呗引用后,它会销毁
 */
//默认是强引用
//强引用 最后一个引用对象时,被销毁
//var p1:Person?=Person(name:"张三")
//var p2:Person?=p1
//var p3:Person?=p2
//
//p1=nil
//p2=nil
//p3=nil
//强引用使用不当时,特别是循环强引用,会导致内存泄漏
//用weak 解决强引用的问题
var zhangsan:Person?=Person(name:"张三")
var house:House?=House(unit:"一单元")
zhangsan?.house=house
house?.teant=zhangsan
zhangsan=nil
house=nil

/*
 循环引用中 一个属性允许为nil 另外一属性 不允许为nil 使用unowned,没有持有关系
 如果属性可选类型? 只能用weak
 如果属性不是可选类型 只能用无主引用(unowned),引用对象被回收后,属性不会置为nil
 */
var lisi:Customer?=Customer(name:"张三")
var car:CreditCard?=CreditCard(num: "666_666_666",customer: lisi!)

lisi?.car=car
lisi=nil
car=nil

//城市和国家的关系:每个国家一定有个手都,每个城市一定属于国家
var Japan:Country?=Country(name:"日本",capitalName: "东京")
Japan=nil

//闭包引起循环强引用,
var stu:Student?=Student()
stu?.closure()
stu=nil



