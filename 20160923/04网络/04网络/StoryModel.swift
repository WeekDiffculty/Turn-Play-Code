//
//  StoryModel.swift
//  04网络
//
//  Created by qingyun on 16/9/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit
import ObjectMapper
class StoryModel: Mappable {
    var images:[String]!
    var type:Int!
    var id:Int!
    var ga_prefix:String!
    var title:String!
    //初始化
    required init?(_ map: Map){
        
    }
    //解析json字段
    func mapping(map: Map){
        images <- map["images"]
        type <- map["type"]
        id <- map["id"]
        ga_prefix <- map["ga_prefix"]
        title <- map["title"]
    }
    
}
