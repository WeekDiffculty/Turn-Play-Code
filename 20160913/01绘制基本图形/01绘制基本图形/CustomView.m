//
//  CustomView.m
//  01绘制基本图形
//
//  Created by qingyun on 16/9/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"drawRect");
    [self drawTriangle];
    
}
//绘制矩形
-(void) drawRectAngle{
    //1.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.构建路径
    CGContextAddRect(ctx, CGRectMake(10, 10, 100, 100));
    //3.描边 边框的颜色
    //CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1.0);
    [[UIColor yellowColor] setStroke];
    //描边路径
    CGContextStrokePath(ctx);
    //4.填充
    //CGContextSetRGBFillColor(ctx, 0, 0, 1, 1.0);
    [[UIColor redColor] setFill];
    //填充路径
    //CGContextFillPath(ctx);
    CGContextSetLineWidth(ctx, 10);
    
    //绘制
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
}
//绘制三角形
-(void) drawTriangle{
    //1.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.构建三角形的path
    //确定开始点的位置
    CGContextMoveToPoint(ctx, 100, 10);
    //确定第一条线结束位置
    CGContextAddLineToPoint(ctx, 150, 60);
    CGContextAddLineToPoint(ctx, 50,60);
    CGContextAddLineToPoint(ctx, 50, 100);
    //3.关闭路径
    CGContextClosePath(ctx);

    
    //4.渲染
    //描边
//    [[UIColor redColor] setStroke];
//    CGContextStrokePath(ctx);

    //填充颜色
    [[UIColor yellowColor] setFill];
    
    CGContextFillPath(ctx);
    
    
}

@end
