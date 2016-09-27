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
   // CGContextStrokePath(ctx);
    
    //确定渐变的区域
    //stroke ->fill
    CGContextReplacePathWithStrokedPath(ctx);
    //保存设置的状态
    CGContextSaveGState(ctx);
    CGContextClip(ctx);
    //绘制渐变颜色
    CGColorSpaceRef space=CGColorSpaceCreateDeviceRGB();
    const CGFloat components[]={
        0.2,0.6,0.8,0.6,//开始的颜色
        0.5,0.9,0.3,0.8,//中间的颜色1
        0.7,0.5,0.2,0.7,//中间的颜色2
        0.4,0.7,0.7,0.4,//结束的颜色
    };
    //设置渐变的区域
    const CGFloat locations[]={0,0.32,0.56,1};
    /* space 颜色的空间对象
        components 颜色的数组,存储的是rgb颜色
     location 颜色所在的位置
     count:颜色的个数 =location 数组的个数
    */
   CGGradientRef gradient= CGGradientCreateWithColorComponents(space, components, locations, 4);
    //绘制渐变
    //颜色0对应的开始点 颜色数组中的结束点位置
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(90, 100), CGPointMake(110, 100), kCGGradientDrawsBeforeStartLocation);
    //释放颜色空间,渐变的对象
    CGColorSpaceRelease(space);
    CGGradientRelease(gradient);
    
    //恢复以前的区域
    CGContextRestoreGState(ctx);
    
}


@end
