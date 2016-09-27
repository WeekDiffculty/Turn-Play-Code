//
//  ImgeTextView.m
//  01绘制基本图形
//
//  Created by qingyun on 16/9/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ImgeTextView.h"

@implementation ImgeTextView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //1.绘制文本
    NSString *str=@"iOS培训";
    //设置字体颜色 删除线
    NSDictionary *pars=@{NSForegroundColorAttributeName:[UIColor redColor],NSStrikethroughStyleAttributeName:@3};
    //在指定的区域绘制文本
    [str drawInRect:CGRectMake(50, 10, 160, 30) withAttributes:pars];
    //2.绘制图片
    UIImage *image=[UIImage imageNamed:@"pic.jpg"];
    [image drawInRect:CGRectMake(50, 50, 100, 100)];
    
}


@end
