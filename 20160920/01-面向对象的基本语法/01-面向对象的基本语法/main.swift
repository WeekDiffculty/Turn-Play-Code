//
//  main.swift
//  01-面向对象的基本语法
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation
//oc import 类文件名.h
//swift 所有的文件都在一个项目中,都在同一个命名空间,不需要导入类声明文件,可直接使用
print("Hello, World!")
//class classname{
//   //方法和属性
//}
//class classname:superclass{
//    //方法和属性
//}
//创建对象/实例
let person=Person() //oc 的 [[Person alloc] init]
person.name="张三"
print(person.name)
//person.bloodType="O"
print(person.bloodType)
person.age=20
print("出生日期\(person.birthday)")
person.birthYear=1998
print("出生年份\(person.birthYear)")
print("description  \(person.description)")

let person1=Person()
print("description  \(person1.description)")

let student=Student()  //调用student子类 指定构造器 -> 父类 person 指定构造器
print("学号 \(student.stuNo) 姓名:\(student.name) 年龄:\(student.age)")
let student1=Student(age:20)
print("学号 \(student1.stuNo) 姓名:\(student1.name) 年龄:\(student1.age)")

let student2=Student(name:"老王",age:25) //调用student父类的便利构造器
print("学号 \(student2.stuNo) 姓名:\(student2.name) 年龄:\(student2.age)")

Person.play()
Student.play()

student2.eatSometing("炒面", thing2: "鸡蛋")
print("学校名称\(student2.school.name)")
