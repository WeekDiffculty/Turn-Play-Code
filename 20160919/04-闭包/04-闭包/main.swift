//
//  main.swift
//  04-闭包
//
//  Created by qingyun on 16/9/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
//闭包类似于oc block closure
/*
 oc block 
 void (^blk)()=^{
    //...
 }
 int (^add)(int,int)=^(int x, int y){
    return x+y
 }
 
 */
//swift 闭包语法: in后面是执行体
let closure={
    (x:Int,y:Int)->Int in return x+y
}
print(closure(4,5))
//参数缩写:参数已知时,使用$0,$1表示从0个参数,1个参数,以此类推
let add:(Int,Int)->Int={$0+$1}
print(add(5,7))
//单表达式隐式返回:省略return
let mul={(x:Int,y:Int) in x*y}
print(mul(5,7))

let nums=[-9,4,1,3]
//let sortedNums=nums.sort({$0>$1})
let sortedNums=nums.sort(>)
print(sortedNums)

//尾随闭包:闭包是函数的最后一个参数,闭包比较复杂时,考虑用尾随闭包
let numbers=[23,507,91]
let digiNum=[0:"zero",1:"one",2:"two",3:"three",4:"four",5:"five",6:"six",7:"seven",8:"eight",9:"nine"]
//map 看做是oc中for循环枚举数组中每个元素
let EnglishNums=numbers.map({
    (var num) -> String in
    print("接收的元素\(num)")
    var output=""
    //以此读取元素中每一个数字 并转换成英文单词
    while num > 0{
        //取出字典对应着个数字的单词
        let key=num%10 //从个位数读取
        output=digiNum[key]!+output
        num/=10
    }
    return output
})

print(EnglishNums)
//函数中的函数
func makeIncrementor(forIncrement amount:Int)->(()->Int){
    var runningTotal=0
    NSLog("amount=\(amount)")
    //嵌套函数(函数中的函数)= 闭包
    func incrementor()->Int{
        runningTotal+=amount
        return runningTotal
    }
    return incrementor
}
let incrementTen = makeIncrementor(forIncrement: 10)
print("incrementByTen \(incrementTen())")
print("incrementByTen \(incrementTen())")
print("incrementByTen \(incrementTen())")

print("incrementByTen \(incrementTen())")
//引用闭包
let alsoIncrementTen=incrementTen()
print("alsoIncrementTen  \(alsoIncrementTen)")
//alsoIncrementTen 和incrementTen 是引用一个实例(内存地址),所以调用时,修改是同一个实例
print("incrementByTen \(incrementTen())")


