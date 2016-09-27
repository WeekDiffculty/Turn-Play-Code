//
//  QYGroupAnimationVC.m
//  02-CoreAnimation
//
//  Created by qingyun on 16/9/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYGroupAnimationVC.h"
//动画组
@interface QYGroupAnimationVC ()
@property(nonatomic,strong) CALayer *layer;
@property(nonatomic,strong) CALayer *maskLayer;//蒙版
@end

@implementation QYGroupAnimationVC
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
    [self addAnimationForLayer:self.layer];
}
-(void) addAnimationForLayer:(CALayer *) tempLayer{
    //1.scale缩放
    CABasicAnimation *scaleAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration=1.5;
    scaleAnimation.toValue=@1.2;
    scaleAnimation.beginTime=0.5;
    //2.旋转
    CABasicAnimation *rotationAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.duration=1.2;
    rotationAnimation.toValue=@M_PI_2;
    rotationAnimation.beginTime=1;//动画开始时间
    rotationAnimation.fillMode=kCAFillModeForwards;
    
    //3.background颜色
    CABasicAnimation *backGroundAnimation=[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    backGroundAnimation.duration=2;
    backGroundAnimation.toValue=(__bridge id _Nullable)([UIColor blueColor].CGColor);
    //初始化动画组
    CAAnimationGroup *group=[CAAnimationGroup animation];
    group.animations=@[scaleAnimation,rotationAnimation,backGroundAnimation];
    //动画重复次数
    group.repeatCount=HUGE_VAL;
    group.duration=3;//持续时间
    group.autoreverses=YES;//原路返回
    //动画组添加至图层
    [tempLayer addAnimation:group forKey:nil];
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
