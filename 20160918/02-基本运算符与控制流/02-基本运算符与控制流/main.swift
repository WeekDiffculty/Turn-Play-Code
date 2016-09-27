//
//  main.swift
//  02-基本运算符与控制流
//
//  Created by qingyun on 16/9/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation

print("Hello, World!")

//一 运算符
//赋值运算符
var int = 5
if int == 5 {
    //
}
print("\(Int8.max)")

//算术运算符+,-,*,/ 不支持溢出运算
let myInt:Int16=Int16(Int8.max)+1
print(myInt)
//溢出运算符 &
let myInt1=Int8.max &+ 1
print(myInt1)

//% ++ -- 浮点型
var float = 8.5 % 2.5
print(float)
//++ -- swift3.0不支持
//float++
//float--

//区间运算符: ... 闭区间  ..<  半开区间
for i in 0 ... 5{
    print(i)
}


//空合运算符:??
//a??b 表示 a !=nil ? a!:b (a表示可选类型,a的值类型和b的值类型相同)

var customColor:String?
customColor="蓝色"
var defaultColor = "红色"

let finalColor = customColor ?? defaultColor
print(finalColor)

//二.条件运算符
//if 条件不需要() 执行体必须用{}
let score = 90
if score >= 60 {
    print("及格")
}

if score >= 90 {
    print("优秀")
} else {
    print("一般")
}

if score >= 90 {
    print("优秀")
} else if score >= 70 {
    print("中等")
} else if score >= 60 {
    print("及格")
} else {
    print("不及格")
}


//guard语句:guard 条件语句 else (不成功的时候要做的事情)
/*
    gruard让代码 更整洁,更易读
    区别:
    判断失败处理位置
    if 判断失败处理在else比较多的情况下,跨度大
    guard 判断失败的处理在紧跟着else之后,
    
    if 只是在括号内有效
    guard 定义的范围有效
 
    else
    if中 else 是可选的
    guard中 else 必须有的,
 */
func checkUp(person:[String:String]){
    //id 为空 执行的是 else 后 执行体
    guard let id = person["id"] else{
        print("没有身份证,不能进入考场")
        return
    }
    guard let examNo = person["examNo"] else{
        print("没有准考证,不能进入考场")
        return
    }
    
    print("进入考场,开始考试 身份证:\(id) 准考证:\(examNo)")
}
checkUp([:])
checkUp(["id":"12345"])
checkUp(["id":"2222","examNo":"666"])

//switch 语句 不需要break
//多模式匹配
let month = 6
switch month {
    case 1,3,5,7,8,10,12:
        print("31天")
    case 4,6,9,11:
        print("30天")
    default:
        print("28或29天")
}
//区间匹配
switch score{
case 80 ... 100://闭区间
    print("优秀")
case 60 ..< 80: //半开区间
    print("一般")
default:
    print("不及格")
}

//元组匹配
let point = (2,5)
switch point {
case (0,0):
    print("原点")
case (_,0):
    print("在x轴上的点")
case (0,_):
    print("在y轴的点")
//case (let x1,let y1):
//case let (x,y):
//    print("不在x,y轴的点")
case let (x,y) where x==y://where子条件语句,可以增加附加条件
    print("x=y的点")
case (-2 ... 2,-4 ... 4)://元组中元素在区间的匹配
    print("在矩形中的点")
default:
    print("其他情况")
}
//显式贯穿 fallthrough
let time = "下午"
switch time {
    case "下午":
        print("技术分享")
       // print("上课")
        fallthrough
        print("此句永远不会执行")
    case "上午":
        print("上课")
    case "晚上":
        print("自习")
default:
    break
}

//循环
for i in 0 ..< 5{
    print("i=\(i)")
}
for _ in 0 ... 7 { //不需要关心循环变量的每次值 _代替
    
    print("hello")
}

var i=0
while i < 5{
    print(i)
    //自增++ +=1
    i+=1
}

//do while
//do {
//
//}while(i)
//第一次不判断条件直接执行,类似 do - while
repeat{
    print("i的值:\(i)")
}while i<5

//复杂的语句中嵌套 可以加上标签
outsideFor:for i in 1 ... 9 {
    insideFor:for j in 1 ... i
    {
        //terminator不换行
        print("\(i)*\(j)=\(i*j)",terminator:" ")
        if i*j == 24 {
            //break //默认跳出当前的循环
            break outsideFor //break 标签 跳出指定的for循环
        }
    }
    print("\n")
    
}



