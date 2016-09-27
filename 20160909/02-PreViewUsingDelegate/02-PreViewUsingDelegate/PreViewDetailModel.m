//
//  PreViewDetailModel.m
//  02-PreViewUsingDelegate
//
//  Created by qingyun on 16/9/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "PreViewDetailModel.h"

@implementation PreViewDetailModel
//初始化方法
-(instancetype) initWithTitle:(NSString *) title perferredHeight:(float) height{
   if(self = [super init])
    {
        _title=title;
        _preferredHeight=height;
    }
    return self;
}
//修改标题和高度
+(instancetype) modelWithTitle:(NSString *) title perferredHeight:(float) height{
    return [[self alloc] initWithTitle:title perferredHeight:height];
}
@end
