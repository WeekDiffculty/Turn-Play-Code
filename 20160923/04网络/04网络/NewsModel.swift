//
//  NewsModel.swift
//  04网络
//
//  Created by qingyun on 16/9/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

import UIKit
import ObjectMapper
class NewsModel: Mappable {
    var date:String!
    var stories:[StoryModel]!
    //初始化
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map){
      date <- map["date"]
      stories <- map["stories"]
    }
}
