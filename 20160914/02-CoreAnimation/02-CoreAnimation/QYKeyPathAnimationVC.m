//
//  QYKeyPathAnimationVC.m
//  02-CoreAnimation
//
//  Created by qingyun on 16/9/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYKeyPathAnimationVC.h"
//关键帧动画
#define halfScreenWidth [UIScreen mainScreen].bounds.size.width/2.0
@interface QYKeyPathAnimationVC ()
@property(nonatomic,strong) CALayer *platformLayer;//平台
@property CALayer *marioLayer;//玛丽
@end

@implementation QYKeyPathAnimationVC
-(void) initLayer{
    //1.platformLayer
    _platformLayer=[CALayer layer];
    _platformLayer.backgroundColor=[UIColor orangeColor].CGColor;
    _platformLayer.bounds=CGRectMake(0, 0,halfScreenWidth, 44);
    _platformLayer.position=CGPointMake(halfScreenWidth, 200);
    
    _platformLayer.anchorPoint=CGPointZero;
    
    [self.view.layer addSublayer:_platformLayer];
    //2.mario
    _marioLayer=[CALayer layer];
    _marioLayer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"Mario.png"].CGImage);
    _marioLayer.contentsRect=CGRectMake(0.5, 0,0.5, 1);
    _marioLayer.bounds=CGRectMake(0, 0, 32, 64);
    _marioLayer.position=CGPointMake(0, self.view.frame.size.height);
    _marioLayer.anchorPoint=CGPointMake(0, 1);
    [self.view.layer addSublayer:_marioLayer];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLayer];
}
-(IBAction)jumpBtn:(id)sender{
    //开启事务
    [CATransaction begin];
    CAKeyframeAnimation *keyAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    //改变Mario的状态
    _marioLayer.contentsRect=CGRectMake(0, 0, .5, 1);
    //构建path
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, self.view.frame.size.height);
    CGPathAddQuadCurveToPoint(path, NULL, 30, 140, halfScreenWidth+10, 200);
    keyAnimation.path=path;
    keyAnimation.duration=.7;
    [CATransaction setCompletionBlock:^{
        //1.停止动画
        [CATransaction setDisableActions:YES];
        //2.
        _marioLayer.contentsRect=CGRectMake(.5, 0, .5, 1);
        _marioLayer.position=CGPointMake(halfScreenWidth+10, 200);
    }];
    
    [self.marioLayer addAnimation:keyAnimation forKey:nil];
    //提交事务
    [CATransaction commit];
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
