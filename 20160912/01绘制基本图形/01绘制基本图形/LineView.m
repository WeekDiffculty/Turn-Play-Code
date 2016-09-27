//
//  LineView.m
//  01绘制基本图形
//
//  Created by qingyun on 16/9/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LineView.h"

@implementation LineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1.
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //确定第一条直线的开始点位置
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 10, 80);
    CGContextSaveGState(ctx);

    //设置宽度
    CGContextSetLineWidth(ctx, 10);
    
    //设置线终点形状
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //连接线的样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokePath(ctx);
    //保存当前绘制的状态 与CGContextRestoreGState 一块用
    //更新画板,更新图形上下文
    CGContextRestoreGState(ctx);
    
    //4.绘制虚线
    CGContextSetLineWidth(ctx, 5);

    CGContextMoveToPoint(ctx, 50, 30);
    //CGFloat lengths[]={10,20};
    CGFloat lengths[]={10,20,10};
    //绘制虚线调用的方法
    CGContextSetLineDash(ctx, 0, lengths, 3);
    CGContextAddLineToPoint(ctx, 180, 180);
    //设置绘制模式
    CGContextDrawPath(ctx, kCGPathStroke);

    
}


@end
