//
//  main.swift
//  03函数
//
//  Created by qingyun on 16/9/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
//函数
//c
/*
    int add(int x,int y)
 //oc
   -(void) add()
 */
//1.无参数无返回值
func printHello(){
    print("hello")
}
printHello()
//swift 支持命名空间,默认情况下一个项目中的所有的文件都在一个命名空间,所以不同的文件中类型定义或者函数电一实现,不需要声明就可以直接调用
testFunc()
//2.无参数,有返回值
func createString()->String{
  return "new string"
}
let str=createString()

//3. 无参数 多返回值(元组)
func maxAdndminArray() ->(Int,Int){
    let nums = [-3,1,0,9]
    var max = nums[0]
    var min = nums[0]
    for num in nums[1..<nums.count] {
        if num > max {
           max=num
        }
        if num < min {
            min=num
        }
    }
    return (max,min)
}
 let (max,min)=maxAdndminArray()
print("max:\(max),min:\(min)")

//4.带参数的函数
/*
 外部参数名:调用的时候使用
 局部参数名:函数体内部使用
 //默认第一个参数不需要外部参数名,第二个以及以后的参数外部名和局部名相同
 */
func add(x:Int,y:Int){
    print("\(x)+\(y)=\(x+y)")
}
add(6, y: 7)
//用_忽略第二个以及后面的外部参数名
func mul(x:Int,_ y:Int){
    print("\(x)*\(y)=\(x*y)")
}
mul(6, 7)

//自定义外部参数名
func travel(from start:String,to end:String){
    print("从\(start)到\(end) 旅游")
}

travel(from: "郑州", to: "焦作")

//可变参数(个数不确定):参数数量不确定:类型 ...
func eatLunchAtCompany(persons:String...){
    print("统计今天中午吃饭的人数\(persons.count)个")
    for person in persons {
        print(person)
    }
    
}
eatLunchAtCompany()
eatLunchAtCompany("张三","李四","王五")
//常量的参数和变量参数
//默认参数是常量参数,在函数体中是不能修改
//func testFunc(val:Int){
//  val = 10
//}

func RMBFromDollor(var money:Double)->Double{
    money*=6.48
    return money
}
print(RMBFromDollor(10))
//输入输出参数
//inout 相当于c语言中的内存地址
func swap(inout x:Int,inout y:Int){
    let temp=x
    x=y
    y=temp
    
}
var a=10
var b=20
swap(&a,y: &b)
print("a=\(a) b=\(b)")

//函数类型 函数引用
//1. 定义变量/常量 函数指针
var cacFunc:(Int,Int)->()=add
cacFunc(5,6)
cacFunc=mul
cacFunc(5,6)

//2. 作为参数类型,用于回调
func callBack(calc:(Int,Int)->(),a:Int,b:Int){
    calc(a,b)//==add(a,b)
}
callBack(mul, a: 4, b: 9)
//3. 作为返回值类型
func makeFunc()->((Int)->Int){
   //嵌套函数
    func addOne(num:Int) -> Int{
        return num+1
    }
    return addOne
}
let newFunc=makeFunc()
print(newFunc(8))




