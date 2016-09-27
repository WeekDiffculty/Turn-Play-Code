//: Playground - noun: a place where people can play
//导入框架 不带.h
import UIKit
//var 变量:可以变化的量 赋值多次
var str = "Hello, playground"
//let 常量:不变的量 只能赋值一次
var str1="hello word"
str1="hello"

var myInt=4
//oc
//for(int i=0;i<5;i++)

for i in 0..<5{
    myInt+=i
}
print(myInt)

let red=UIColor.redColor()

let view=UIView(frame:CGRectMake(0,0,100,200)) //等于oc 中 uiview init(frame)
view.backgroundColor=red

let btn=UIButton(frame:CGRectMake(0,0,100,200))
btn.backgroundColor=UIColor.yellowColor();
btn.setTitle("按钮", forState: .Normal)
btn.setTitleColor(UIColor.greenColor(), forState: .Normal)



