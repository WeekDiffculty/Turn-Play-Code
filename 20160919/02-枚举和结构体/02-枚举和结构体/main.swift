//
//  main.swift
//  02-枚举和结构体
//
//  Created by qingyun on 16/9/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation

print("Hello, World!")

//枚举
//OC 枚举
/*
    enum WeekDay {
     Mon,
    Tue,
    Wed,
    ...
 }
 typedef enum {} WeeKDAY
 */
//swift 枚举
//1. 定义每个枚举值 都有case
enum WeekDay {
    case mon //枚举值
    case tue
    case wed
    case thu
    case fri
    case sat
    case sun
}
//2.一个case,多个枚举值逗号分割
enum WeekDay1{
    case mon,tue,wed,thu,fri,sat,sun
}
var day=WeekDay.mon
var day1:WeekDay = .mon

day = .sun //变量的类型已知,赋值不再需要些枚举的类型名称,直接.枚举值
//关联值:额外存储枚举值对应的信息
enum Person {
    case teacher
    case student(Int) //对应Student来说,需要有个整数与他关联
}
let teacher = Person.teacher
let student = Person.student(160511)

switch student {
case .teacher:
    print("老师")
case .student(let stuNo):
    print("学生 学号为\(stuNo)")
}

//枚举原始值:枚举值对应的默认填充值 默认枚举值不会和整型相对应
enum ControlCharacter:Character{
    case tab="\t"
    case newLine="\n"
    case enter="\r"
}
//原始值类型是Int 的话,每个枚举值的原始值是默认从0开始的整数
enum  Direction:Int {
    case up,down,left,right
}
//原始值类型为String,每个枚举值的原始值默认是自己的名字
enum Season:String{
    case Sprint,Summer,Autumn,Winter="win"
}
let dir=Direction.down
print(dir)
let dir1=Direction(rawValue:2)
print(dir1)

let season=Season(rawValue:"win")
print(season)

//结构体
////c/oc
//struct student{
//    char name[10];
//    int age;
//}
//swift
struct Student{
    var name:String="某某某"
    var age:Int=0
}
//生成一个结构体的实例
//默认构造器:每个属性都有默认值,没有自定义的构造器\构造方法
let stu=Student()
print("name:\(stu.name) age:\(stu.age)")

let stu1=Student(name: "张三",age: 20)
print("name:\(stu1.name) age:\(stu1.age)")

//自定义构造器
struct Point{
    var x:Int
    var y:Int
    //构造方法/构造器 init 在结构体初始化时,自动调用
    init(){
        x=10
        y=10
    }
    //自定义构造器
    init(xx:Int,yy:Int){
        x=xx
        y=yy
    }
}

let point=Point()
print("x=\(point.x) y=\(point.y)")

let point1=Point(xx: 5,yy: 20)
print("x1=\(point1.x) y1=\(point1.y) ")
//调用类中的(结构体)属性
class Frame{
    var origin:Point=Point()
}
//结构体是值类型
let frame=Frame()
frame.origin.x=10
frame.origin.y=100
print("frame x=\(frame.origin.x) y=\(frame.origin.y)")

var point2=point
point2.y=40
print(point.y)

//类是引用的类型 newFrame和frame引用的是同一个实例(内存空间),所以任意修改一个都会影响另一个
let newFrame=frame
newFrame.origin.y=30
print(frame.origin.y)
//恒等运算符 === !== 判断两个引用是否指向一个实例
if newFrame === frame{
    print("newFrame 和frame 引用的是同一个实例")
}
//结构体与类的选择
//少量的数据或者不需要继承时,尽量使用结构体.
//数据较复杂或者需要继承时,必须要使用类




