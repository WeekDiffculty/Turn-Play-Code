//
//  main.swift
//  05类型检查与转换
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
//AnyObject:指的是任何类的实例类型/对象,相当于oc中的id类型
//Any:包括所有的类型,类的实例,基本数据类型,或者 函数/闭包类型
let obj=NSObject()
let person=Person(name:"moumou")
let student=Student(name:"学生")
let anyObjArr:[AnyObject]=[obj,person,student]

let clousure={print("helloc")}
let anyArr:[Any]=[clousure]

var personCount=0
//is 检查 相当于 oc中的 isKindClass
for anObj in anyObjArr{
    if anObj is Person {
        personCount+=1;
    }
}
print(personCount)


//as 转换 指定的类型
for obj in anyObjArr{
    if let person = obj as? Person{
        print("name:\(person.name)")
    }else{
        print("不是人")
    }
}
