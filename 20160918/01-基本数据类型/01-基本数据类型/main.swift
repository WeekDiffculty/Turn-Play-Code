//
//  main.swift
//  01-基本数据类型
//
//  Created by qingyun on 16/9/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation
//1.按行执行,没有main函数
print("Hello, World!")
print("Hello Swift");
//分号区分多个语句
print("字符串");print("同一条语句必须加;")
print("hello")
NSLog("hello1") //不带@

let myInt=5.7009
print(myInt)
print("myInt=\(myInt)")//字符串插值时,打印不需要带占位符%lf
//2.var:变量 值可以赋值多次 let:常量:只能赋值一次
var myInt0=5.7009
var a,b,c:Int //变量类型定义的时候:1.初始化赋值的时候 根据值隐式转换成指定的类型 2.显性声明指定的数据类型
//var a,b,c:Int
var a1=3,b1=4,c1=5
var 你好="你好",😄="对勾" //Unicode字符定义变量名
//3.基本数据类型
let lInt=5 //
let lInt1:Int//类型标注
let lIn2:Int=5 //值类型和常量/变量类型要有对应的关系,保持一致,否则出现报错
//二进制 前缀0b 八进制 0o 十六进制 0x 默认十进制
let lInt3=0b1000
let lInt4=0o17
let lIn5=0xFA
let lIn6=10_000_0000 //下划线不影响数值
print(lIn6)
//3.2浮点型
//单精度浮点型内存中占用 4个字节,(1字节=8位) 32位二进制描述
//双精度浮点型 内存占用8字节 64位二进制表示
let lFloat:Float=5
print(lFloat)
let lFloat1=Float(lIn2)+2.0
let double:Double=3.64
//指数
let float=1.25e10 //1.25*10^(10)

//3.3字符串 String
let hello="String"
print(hello)
let hello1:String="String"
let chaA:String="A"
//Character 单个字符 char
let charB:Character="B"

//字符串拼接
let helloworld=hello+"world"
print(helloworld)
//字符串插值
let str="hello,\(helloworld)"
print(str)

//布尔值
//不再是oc中的yes/no True/False
let isMan=true //false
let isStudent:Bool=Bool(0)//布尔值中,非0数值不再使用
print(isStudent)

//4.类型转换
let lInt8:Int8=8
let lInt16:Int16=16
let lInt32:Int32=32
//类型不同不能赋值或运算
//let lInt81=lInt8+lInt16

//4.1调用构造器/构造方法:类型名称(值) init
let strInt=String(lInt8)
let strFloat=String(lFloat)
let strTrue=String(true)
//字符串转换整型,浮点型,布尔型

let intStr="123".intValue
let intStr1=Int("34")//调用构造器,转换成功,有可能转换不成功

//整型->浮点型
let lFloat11=Float(lInt8)
let lInt11=Int(double)
print(lInt11)//直接截取整数部分,不会四舍五入

//5.类型别名 typealias 新名字=原类型
typealias MyInt=Int
let int:MyInt=6

let five = 5 + 6

//6.元组的类型
//元组:把多个元素看成是一个元素
let point=(1,2)//(Int,Int)
let point1=(x:1,y:5)//(名称1:Int,名称2:Int) 给元素起名字

//访问元素: 下标或者名称
print(point.0)
print(point.1)

print(point1.x)
print(point1.y)

//使用变量/常量接收元组的元素值
let (x,y)=point1
print("x=\(x) y=\(y)")
//使用下划线忽略不需要的值
let(_,yy)=point1
print("yy=\(yy)")
//类型标注和名称同时存在时,访问元素只能通过下标访问
let person:(String,Int)=(name:"张三",age:20)
//print(person.age)

//元组作用:
/*
 如果临时存放少量的数据 可以用元组
 如果数据量大或者长期使用时,要考虑用结构体或者类
 */

//7. 可选类型:处理值可能缺失的情况?
//可选类型 表示数据可能为空 所以用?表示
let optionalInt=Int("345")
print(optionalInt)

var girlFriend:String?//可选类型自动初始化为nil
print(girlFriend)
girlFriend=nil
girlFriend="girl" //字符串的值
//girlFriend=20
print(girlFriend)
if girlFriend != nil {
    print("我的女朋友叫\(girlFriend!)") //强制解析:如果确定有值,加上!可取值.如果对nil强制解析就会出现崩溃
}
girlFriend=nil
//print(girlFriend!)

//可选绑定:如果可选类型有值,则把值赋值给一个临时的变量或常量
if let gf=girlFriend { //1.先判断是否有值, 2.有值就取出来赋值给临时的变量或常量
    print(gf)
}

let isGirl:Bool
//isGirl=nil

// 必选类型(隐式的解析可选类型):! 必须要指定的类型,如果在程序运行过程中,一个变量/常量一旦被赋值后,不可能为空,

var name:String!
name=nil
name="小明"
name=nil
//print(name)

if let myName=name{
    print(myName)
}

