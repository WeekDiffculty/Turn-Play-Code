//
//  main.swift
//  01-字符串数组字典
//
//  Created by qingyun on 16/9/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation

print("Hello, World!")
//OC 字符串 NSString/NSMutableString(引用类型)
//OC 数组 NSArray/NSMutableArray(引用类型)
//OC 字典 NSDictionary/NSMutableDictionary(引用类型)
/*
  引用类型:在类,指针指向的内存地址,有两个引用相互赋值,内存地址相同
  值类型:赋值的时候把内容拷贝一份赋值,两个变量之间相互变化没有影响
 */
//swift 字符串 String (值类型)
//swift 数组 Array (值类型)
//swift 字典 Dictionary (值类型)
//一.字符串
let str:NSString="123"
let newStr=str.stringByAppendingString("456")//拼接子字符串
print(newStr)
print(str)

let str1:NSMutableString="hello"
str1.appendString(",world");//追加字符,自身对象中
print(str1)
//定义一个可变的字符串对象 等于oc中 [[NSMutableString alloc] initWithString:str]
let str2=NSMutableString(string:str)

//定义swift 字符串常量
let hello="hello"
//定义空字符串
let emptyStr=""
let emptyStr1=String()

//拼接 +
let helloworld=hello+"world"
var swift="swift"
swift+="3.0"
print(swift)

//插值 "\(变量)"
swift="hello,\(swift)"
print(swift)

let myStr:NSMutableString=NSMutableString(string:swift)
myStr.insertString("111", atIndex: 0)
print(myStr)

//判断是否相等
//myStr.isEqualToString(<#T##aString: String##String#>)
if swift != hello{
    print("字符串不相等")
}
//截取
//swift String 截取方法
let longStr="123456567788dddd"
let index1=longStr.startIndex.advancedBy(6)
print(index1)
let index2=longStr.endIndex.advancedBy(-5)
print(index2)

let subStr=longStr.substringToIndex(index1)
print(subStr)
let subStr1=longStr.substringFromIndex(index2)
print(subStr1)

let subStr2=longStr.substringWithRange(Range(index1..<index2))
print(subStr2)

let longNSStr=longStr as NSString
let subStr11=longNSStr.substringFromIndex(5)
print(subStr11)

//前缀hasPrefix 后缀hasSuffix
if longStr.hasPrefix("123"){
    print("有123前缀");
}
if longStr.hasSuffix("ddd"){
    print("有ddd后缀")
}

//遍历:属性characters
//获取字符串中单个字符
for char in longStr.characters{
   
    print(char)
}

//数组:swift数组可存放任何类型,不一定是对象
//Array<Int> [Int]
//oc 数组初始化
let nsArr:NSArray=["123","456"]
let nsmArr:NSMutableArray=NSMutableArray()
nsmArr.addObject("123")

//swift
//空数组
var intArr=Array<Int>()
let intArr1=[Int]()

let names=["zhangsan","lisi","wangwu"]
//names="张三"

//带默认值的数组
//Array(count:5,repeatedValue:3.14)构造器=Array init(count: 5, repeatedValue: 3.14)
let floatArr=Array(count:5,repeatedValue:3.14)
print(floatArr)

//数组相加:两数组拼接成新数组(每个元素 类型是相同)
let floatArr1=[2.0,3.0,4.0,4.0]
let arr=floatArr + floatArr1
print(arr)

print(arr.count)

if intArr.isEmpty {
    print("intArr 数组是为空")
}

//数组追加元素
//追加1元素
intArr.append(5)
//追加多元素
intArr+=[6,7]
print(intArr)

//数组下标操作
intArr[0]=8
//多下标操作支持
intArr[0 ... 2]=[1,2,3] //下标个数与元素的个数相等,直接替换
print(intArr)

intArr[1 ... 2] = [8] //下标个数多于元素的个数,替换并删除
print(intArr)

intArr[0 ... 1] = [0,9,8,7,6,5]//下标的个数少于元素的个数 替换并追加

print(intArr)

//插入和删除
intArr.insert(100, atIndex: 3)
print(intArr)
intArr.removeAtIndex(3)
print(intArr)

//遍历
//只遍历元素
for value in intArr{
    print("value = \(value)")
}
//遍历下标和元素
for (ind,val) in intArr.enumerate(){
    print("\(ind):\(val)")
}

//字符串与数组间转换
let nameStr=names.joinWithSeparator("✋")
print(nameStr)
let newNames=nameStr.componentsSeparatedByString("lisi")
print(newNames)

//字典
//[key:value]
let OCDict:NSDictionary=["name":"张三","age":20]
//空字典 swift
let dict=Dictionary<String,Int>()
let dict1=[String:Int]()

var person=["name":"李四","age":20]
print(person.count)

//字典 关键字/下标操作
person["school"]="青云" //添加(键不存在)
print(person)
person["age"]=21 //修改(键存在)
print(person)

person["age"]=nil //删除 置为nil
print(person)

print(person["name"]!)//通过下标获取键值得到是可选的类型,所以加!

//person.updateValue(20, forKey: "age") //如键存在则修改值,如键不存在,则添加值
print(person)

if let removeValue = person.removeValueForKey("age"){
    print("被删除的信息为:\(removeValue)")
}else{
    print("找不到age")
}
//遍历
//遍历 关键字-值
for(key,value) in person{
    print("\(key):\(value)")
}
//只遍历关键字 .keys 值 .values
for key in person.keys{
    print(key)
}

//根据关键字keys或values 构造数组
let keys=Array(person.keys)
print(keys)

let values = Array(person.values)
print(values)

















