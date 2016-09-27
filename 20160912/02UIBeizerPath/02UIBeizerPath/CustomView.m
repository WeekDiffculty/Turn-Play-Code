//
//  CustomView.m
//  02UIBeizerPath
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
    //1.创建UIBezierPath
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path removeAllPoints];
    //2.绘制三角形
    [path moveToPoint:CGPointMake(100, 0)];
    [path addLineToPoint:CGPointMake(130, 40)];
    [path addLineToPoint:CGPointMake(70, 40)];
    [[UIColor redColor] setFill];
    [path fill];
    [path closePath];//关闭当前路径的子路径
    
    //4.绘制剪切区域
    [path moveToPoint:CGPointMake(100, 80)];
    [path addLineToPoint:CGPointMake(105, 100)];
    [path addLineToPoint:CGPointMake(95, 100)];
    [path closePath];
    [path appendPath:[UIBezierPath bezierPathWithRect:rect]];
    path.usesEvenOddFillRule=YES;
    [path addClip];
    
    
    //3.绘制轴
    
    [path removeAllPoints];
    [path moveToPoint:CGPointMake(100, 40)];
    [path addLineToPoint:CGPointMake(100, 100)];
    //设置轴宽度
    [path setLineWidth:5];
    [path stroke];
    
    
}


@end
