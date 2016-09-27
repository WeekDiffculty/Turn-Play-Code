//
//  QYCatransitionVC.m
//  02-CoreAnimation
//
//  Created by qingyun on 16/9/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYCatransitionVC.h"

@interface QYCatransitionVC ()
@property (weak,nonatomic) IBOutlet UISegmentedControl *typeSegmented;
@property(weak,nonatomic) IBOutlet UISegmentedControl *subTypeSegmented;
@property(nonatomic,strong) CALayer *baseLayer;
@property(nonatomic,strong) CALayer *redLayer;
@property(nonatomic,strong) CALayer *blueLayer;
@end

@implementation QYCatransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1.初始化baseLayer;
    _baseLayer=[CALayer layer];
    _baseLayer.bounds=CGRectMake(0, 0, 180, 180);
    _baseLayer.position=CGPointMake(180, 340);
    [self.view.layer addSublayer:_baseLayer];
    
    //2.初始化redLayer
    _redLayer=[CALayer layer];
    _redLayer.backgroundColor=[UIColor redColor].CGColor;
    _redLayer.bounds=CGRectMake(0, 0, 180, 180);
    _redLayer.position=CGPointMake(90, 90);
    _redLayer.hidden=YES;
    [_baseLayer addSublayer:_redLayer];
    
    //3.初始化blueLayer
    _blueLayer=[CALayer layer];
    _blueLayer.backgroundColor=[UIColor blueColor].CGColor;
    _blueLayer.bounds=CGRectMake(0, 0, 180, 180);
    _blueLayer.position=CGPointMake(90, 90);
    _blueLayer.hidden=YES;
    [_baseLayer addSublayer:_blueLayer];
    
}
-(IBAction)transitionBtn:(id)sender{
    //1.初始化动画的对象
    CATransition *transition=[CATransition animation];
    //2.动画的样式
    NSArray *typeArr=@[kCATransitionFade,kCATransitionMoveIn,kCATransitionPush,kCATransitionReveal];
    NSArray *subTypeArr=@[kCATransitionFromRight,kCATransitionFromLeft,kCATransitionFromTop,kCATransitionFromBottom];
    //3.动画类型
    transition.type=typeArr[_typeSegmented.selectedSegmentIndex];
    transition.subtype=subTypeArr[_subTypeSegmented.selectedSegmentIndex];
    //4.添加动画
    [_baseLayer addAnimation:transition forKey:nil];
    _redLayer.hidden=!_redLayer.hidden;
    _blueLayer.hidden=!_blueLayer.hidden;
    
    
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
