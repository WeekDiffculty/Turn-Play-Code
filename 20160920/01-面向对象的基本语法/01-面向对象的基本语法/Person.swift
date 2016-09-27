//
//  Person.swift
//  01-面向对象的基本语法
//
//  Created by qingyun on 16/9/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import Foundation
//swift的类不区分接口和实现部分,只有一个swift文件
class Person:NSObject{
    //OC 属性 @propery(nonatomic,strong) NSString *name
    //属性分存储的属性和计算属性,前者占用内存,计算的属性不占用内存
    //1.存储属性
    //变量的属性相当于oc property readwrite 读写的属性
    var name:String = "moumou"{
        willSet(newName){ //即将赋值时,调用此方法
            print("赋值之前调用,将要设置名称\(newName)")
        }
        didSet{ //已经设置值时调用此方法
            print("赋值只有调用,原名称为\(oldValue)")
        }
    }
    var age:Int=0
    //常量属性设置类似OC property  readonly 只读的属性
    let bloodType:NSString
    let birthday:String = "1995"
    
    //2.计算属性:不占用内存,提供了getter 和setter方法
    override var description: String{
//        set{
//        
//        }
//        get{//get可以省略
//        
//        }
        return "name:\(name),age\(age),birthday:\(birthday)"
    }
    //oc 属性 点语法 setter getter 作用类似
    var birthYear:Int{
        //赋值的时候调用
        set(newBirthYear){
            print("birthYear属性的 setter")
            age=NSDate.thisYear-newBirthYear
        }
        //获取值的时候调用
        get{//计算出生年份
            print("birthYear属性的 getter")
            return NSDate.thisYear-age
        }

     
    
        
}
    //lazy懒加载,第一次调用该属性的时候,进行初始化
    lazy var school:School = {
        print("第一次访问school")
        let sch=School()
        return sch
    }()
    
    
       //构造器/构造方法
    //1.指定构造器:只有1个,必须向上代理到父类的指定构造器
    //构造器重写
    override init() { //重写父类构造器的方法init
        name="王五"
        age=18
        bloodType="A型"
    }
    //2.必要构造器:所有的子类必须实现这个构造器(通过重写或者子类继承父类)
    required init(age:Int) {
        self.bloodType="B型"
        self.age=age
    }
    //3.便利构造器: 子类继承不了父类的便利构造器
    convenience init(name:String){
        self.init()
        self.age=19
        self.name=name
    }
    convenience init(name:String,age:Int){
        self.init()
        self.name=name
        self.age=age
    }
    //类方法 oc +
    //修饰符
    //1.class 修饰符 修饰的方法 在子类中可以继承(不是对象继承)
    class func play(){
        print("打球")
    }
    func eatSometing(thing1:String,thing2:String)
    {
        print("父类的 eatSometing")
    }
    //2.final 修饰符 表示该方法在父类中实现,在子类不能继承
    //final 声明的方法或属性 不能被重写
    final func eatFood(thing1:String,thing2:String){
       print("父类的eatfood")
    }
    //3.static 修饰符 修饰的方法不能被子类重写
    static func eatFruit(thing1:String,thing2:String){
        print("父类的eatFruit")
    }
    
    
}
