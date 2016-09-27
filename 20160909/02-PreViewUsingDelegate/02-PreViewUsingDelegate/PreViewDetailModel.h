//
//  PreViewDetailModel.h
//  02-PreViewUsingDelegate
//
//  Created by qingyun on 16/9/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PreViewDetailModel : NSObject
@property(nonatomic,strong) NSString *title;//标题
@property(nonatomic) float preferredHeight;//预览视图高度
//初始化方法
-(instancetype) initWithTitle:(NSString *) title perferredHeight:(float) height;
//修改标题和高度
+(instancetype) modelWithTitle:(NSString *) title perferredHeight:(float) height;
@end
