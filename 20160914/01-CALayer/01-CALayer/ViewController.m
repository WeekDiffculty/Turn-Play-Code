//
//  ViewController.m
//  01-CALayer
//
//  Created by qingyun on 16/9/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYLayer.h"
@interface ViewController ()
@property(nonatomic,strong) CALayer *layer;
@property(nonatomic,strong) CALayer *maskLayer;
@property(nonatomic,strong) QYLayer *boundsLayer;
@end

@implementation ViewController
//懒加载 初始化
-(QYLayer *) boundsLayer{
    if (_boundsLayer) {
        return _boundsLayer;
    }
    _boundsLayer=[QYLayer layer];
    _boundsLayer.backgroundColor=[UIColor blueColor].CGColor;
    _boundsLayer.bounds=CGRectMake(0, 0, 200, 200);
    _boundsLayer.position=CGPointMake(50, 50);
    return _boundsLayer;
}
-(CALayer *) layer{
    if (_layer) {
        return _layer;
    }
    //初始化
    _layer=[CALayer layer];
    //背景颜色
    _layer.backgroundColor=[UIColor greenColor].CGColor;
//设置图层大小,位置居中
    _layer.bounds=CGRectMake(0, 0, 200, 200);
    _layer.position=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view.layer addSublayer:_layer];
    return _layer;
}
//蒙版的图层
-(CALayer *) maskLayer{
    if (_maskLayer) {
        return _maskLayer;
    }
    _maskLayer=[CALayer layer];
    UIImage *img=[UIImage imageNamed:@"StarMask"];
    _maskLayer.contents=(__bridge id _Nullable)(img.CGImage);
    _maskLayer.bounds=CGRectMake(0, 0, 100, 100);
    _maskLayer.position=CGPointMake(100, 100);
    return _maskLayer;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//边框的宽度
-(IBAction)borderBtn:(id)sender{
    if (self.layer.borderWidth>0) {
        self.layer.borderWidth=0;
    }else{
        self.layer.borderWidth=5;
    }
    
}
//边框的颜色
-(IBAction)borderColorBtn:(id)sender{
    self.layer.borderColor=[UIColor redColor].CGColor;
    
}
//透明度
-(IBAction)opacityBtn:(id)sender{
    if (self.layer.opacity==1) {
        self.layer.opacity=.3;
    }else{
        self.layer.opacity=1;
    }
}
//圆角
-(IBAction)triggleRadius:(id)sender{
    if (self.layer.cornerRadius==0) {
        self.layer.cornerRadius=100;
    }else{
        self.layer.cornerRadius=0;
    }
}
//添加子图层
-(IBAction)addSublayerBtn:(id)sender{
    BOOL isone=YES;
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[QYLayer class]]) {
            //删除图层
            [layer removeFromSuperlayer];
            isone=NO;
        }
    }
    if (isone) {
        QYLayer *layer=[QYLayer layer];
        layer.bounds=CGRectMake(0, 0, 100, 100);
        layer.position=CGPointMake(100, 100);
        //layer  绘制图形时,必须要手动去调用setNeedsDisplay
        [layer setNeedsDisplay];
       [self.layer addSublayer:layer];
    }
}
//蒙版
-(IBAction)maskLayerAction:(id)sender{
    if (self.layer.mask==nil) {
        self.layer.mask=self.maskLayer;
    }else{
        self.layer.mask=nil;
    }
}
//子图层是否超出边界
-(IBAction)masktoBoundsBtn:(id)sender{
    self.layer.masksToBounds=YES;
    [self.layer addSublayer:self.boundsLayer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
