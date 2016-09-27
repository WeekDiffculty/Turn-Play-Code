//
//  QYAnimationVC.m
//  02-CoreAnimation
//
//  Created by qingyun on 16/9/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYAnimationVC.h"
//基础动画
@interface QYAnimationVC ()
@property(nonatomic,strong) CALayer *layer;
@property(nonatomic,strong) CALayer *maskLayer;//蒙版
@end

@implementation QYAnimationVC
//1.懒加载
-(CALayer *) maskLayer{
    if (_maskLayer) {
        return _maskLayer;
    }
    //初始化
    _maskLayer=[CALayer layer];
    _maskLayer.bounds=CGRectMake(0, 0, 200, 200);
    _maskLayer.position=CGPointMake(100, 100);
    _maskLayer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"1.png"].CGImage);
    //蒙版不能设置颜色,要么是绘制的多边形,要么是图片
    //_maskLayer.backgroundColor=[UIColor blueColor].CGColor;
    return _maskLayer;
}
-(void) initLayer{
    //初始化
    _layer=[CALayer layer];
    //设置layer属性
    _layer.backgroundColor=[UIColor redColor].CGColor;
    //圆角
    _layer.cornerRadius=25;
    //尺寸和位置
    _layer.bounds=CGRectMake(0, 0, 200, 200);
    _layer.position=CGPointMake(180, 200);
    //添加蒙版
    _layer.mask=self.maskLayer;
    [self.view.layer addSublayer:_layer];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLayer];
    [self addAnimationForLayer:_layer];
}
-(void) addAnimationForLayer:(CALayer *) tempLayer{
    //1.创建动画
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //2.动画的属性t
    animation.duration=.3;//动画持续时间 默认2.5s
    animation.toValue=@2.0;//FromValue
    animation.autoreverses=YES;//从原路径返回
    animation.repeatCount=HUGE_VAL;//HUGE_VAL;//永久 //默认为0 动画只播放一次 动画重复次数
    animation.speed=1.0;//1.0
    //removedOnCompletion=NO 结合fillMode使用
    animation.removedOnCompletion=NO;
    /*kCAFillModeForwards 动画结束后,layer保持动画最后的状态
     kCAFillModeBackwards 动画结束后 ,layer保持最开始的状态
     kCAFillModeRemoved 默认值,动画开始前和结束后,动画对layer没有影响,动画结束后layer恢复到之前的状态
     kCAFillModeBoth 动画加入后开始之前,layer处于动画的初始状态,动画结束后,layer保持动画的结束状态
     */
    animation.fillMode=kCAFillModeBoth;
    //动画添加到layer中
    [tempLayer addAnimation:animation forKey:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
