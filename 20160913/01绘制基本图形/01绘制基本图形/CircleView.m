//
//  CircleView.m
//  01绘制基本图形
//
//  Created by qingyun on 16/9/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
   // [self drawCircle];
    [self drawOtherArc];
}
-(void) drawCircle{
    //1.
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.构建路径
    /*
     x,y 圆心
     radius 半径
     startAngle 开始角度
     endAngle 结束角度
     clockwise 时针方向 1逆时针 0 顺时针
     */
    CGContextAddArc(ctx, 100, 100, 50, 0, M_PI, 1);
 
    //填充
    [[UIColor yellowColor] setFill];
    //填充路径
    CGContextFillPath(ctx);
    
}
-(void) drawOtherArc{
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 150, 100);
    CGContextAddArcToPoint(ctx, 150, 50, 100, 50, 50);
    CGContextStrokePath(ctx);
}


@end
