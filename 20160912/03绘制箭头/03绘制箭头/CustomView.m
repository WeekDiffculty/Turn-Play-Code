//
//  CustomView.m
//  03绘制箭头
//
//  Created by qingyun on 16/9/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.绘制大三角形
    CGContextMoveToPoint(ctx, 100, 0);
    CGContextAddLineToPoint(ctx, 140,40);
    CGContextAddLineToPoint(ctx, 60, 40);
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1.0);
    CGContextFillPath(ctx);
    //关闭路径
    CGContextClosePath(ctx);
    //3.小三角形
    CGContextMoveToPoint(ctx, 100, 80);
    CGContextAddLineToPoint(ctx, 110, 100);
    CGContextAddLineToPoint(ctx, 90, 100);
    CGContextClosePath(ctx);
    //添加剪切的区域
    CGContextAddRect(ctx, rect);
    //用奇偶规则剪切
    CGContextEOClip(ctx);
    
    //4.绘制轴
    CGContextMoveToPoint(ctx, 100, 40);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextSetLineWidth(ctx, 20);
    CGContextStrokePath(ctx);
    
    
    
    
}


@end
