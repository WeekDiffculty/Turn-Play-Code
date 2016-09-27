//
//  CurveView.m
//  01绘制基本图形
//
//  Created by qingyun on 16/9/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CurveView.h"

@implementation CurveView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self drawBezierPath];
    [self drawOtherCurve];
    
}
-(void) drawBezierPath{
    //1.获取画板
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //贝塞尔曲线
    //2.构建path
    CGContextMoveToPoint(ctx, 30, 30);
    //确定曲线的控制点和终点坐标
    CGContextAddQuadCurveToPoint(ctx, 50, 200, 180, 20);
    //3.渲染
    [[UIColor purpleColor] setStroke];
    CGContextStrokePath(ctx);
}
-(void) drawOtherCurve{
    //1.获取画板
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 30, 30);
    CGContextAddCurveToPoint(ctx, 180, 30, 50, 170, 180, 180);
    //描边
//    [[UIColor yellowColor] setStroke];
//    CGContextStrokePath(ctx);
    
    [[UIColor blueColor] setFill];
    CGContextFillPath(ctx);
    
    //设置绘制模式
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

@end
