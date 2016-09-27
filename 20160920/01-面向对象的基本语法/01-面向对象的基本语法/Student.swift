//
//  Student.swift
//  01-面向对象的基本语法
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Cocoa
//子类继承父类
//子类继承父类的所有的方法和属性

class Student: Person {
    var stuNo:Int=0//学号
    //重写指定构造器
    override init(){
        stuNo=1605
        
        //调用父类的指定构造器
        super.init()
        self.school.name="河南青云"

    }
    //继承父类Person 必要构造器
    required init(age: Int) {
      //  fatalError("init(age:) has not been implemented")
        super.init()
        self.age=age
    }
    //重写父类的方法 eatSometing
    override func eatSometing(thing1: String, thing2: String) {
        super.eatSometing(thing1, thing2: thing2)
        print("子类的 eatSometing")

    }
   
}
