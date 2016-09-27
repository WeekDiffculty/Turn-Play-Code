//
//  DbHandle.swift
//  05sqlite数据库的操作
//
//  Created by qingyun on 16/9/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit
import SQLite
/// 数据库操作的类
class DbHandle: AbstractDb {
    var Db:Connection!
    override init() {
        super.init()
        self.initDb()
    }
    //初始化数据库
    func initDb(){
        do{
            let sql="CREATE TABLE studentInfo (id integer NOT NULL,name text,age text,address text)"
        
            let db=try Connection(self.DbPath)
            self.Db=db
            //创建表
            try self.Db.execute(sql)
        }catch let error as NSError{
            print("错误%s",error.description)
        }
    }
    //插入
    func insert(sEntity:StudentEntity){
        let sql:String!="insert into studentInfo(id,name,age,address) values(\(sEntity.id),'\(sEntity.name)',\(sEntity.age),'\(sEntity.address)')"
        do {
            try self.Db.execute(sql)
        }catch let error as NSError{
            print("错误%s",error.description)
        }
    }
    
    //删除
    func Delete(strId:String){
        let sql:String!="delete from studentInfo where id=\(strId)"
        do {
            try self.Db.execute(sql)
        }catch let error as NSError{
            print("错误%s",error.description)
        }
    }
    //更新
    func update(sEntity:StudentEntity){
        let sql:String!="update studentInfo set address='\(sEntity.address)' where id=\(sEntity.id)"
        do {
            try self.Db.execute(sql)
        }catch let error as NSError{
            print("错误%s",error.description)
        }
    }
    //查询
    func query()->NSMutableArray{
        let strSql="SELECT * FROM studentInfo"
        let arr=NSMutableArray()
        do{
            for row in try self.Db.prepare(strSql){
                
                
                let sEntity=StudentEntity()
                sEntity.id=String(row[0])
                sEntity.name=String(row[1])
                sEntity.age=String(row[2])
                sEntity.address=String(row[3])
                arr.addObject(sEntity)
                
            }
        }catch let error as NSError{
            
              print("错误%s",error.description)
        
        }
        return arr
    }
}
