//
//  QYLayer.m
//  01-CALayer
//
//  Created by qingyun on 16/9/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYLayer.h"

@implementation QYLayer
- (void)drawInContext:(CGContextRef)ctx{
    //绘制图形
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 0, 50);
    CGContextAddLineToPoint(ctx, 100, 50);
    
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);
}

@end
