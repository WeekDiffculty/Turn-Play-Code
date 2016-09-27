//
//  SecondViewController.m
//  02-PreViewUsingDelegate
//
//  Created by qingyun on 16/9/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
//设置弹出快捷菜单中每个选项 peek 实现时,
-(NSArray<id<UIPreviewActionItem>> *) previewActionItems{
    UIPreviewAction *action1=[self previewActionTitle:@"Default Action" style:UIPreviewActionStyleDefault];
    UIPreviewAction *action2=[self previewActionTitle:@"Destructive Action" style:UIPreviewActionStyleDestructive];
    UIPreviewAction *action3=[self previewActionTitle:@"Sub Action1" style:UIPreviewActionStyleDefault];
    //二级菜单
    UIPreviewActionGroup *actionGroup=[UIPreviewActionGroup actionGroupWithTitle:@"sub Actions" style:UIPreviewActionStyleDefault    actions:@[action2,action3]];
    //一级菜单
    return @[action1,actionGroup];
}
-(UIPreviewAction *) previewActionTitle:(NSString *) title style:(UIPreviewActionStyle) style{
    return [UIPreviewAction actionWithTitle:title style:style handler:^(UIPreviewAction * action,UIViewController *preViewController){
        NSLog(@"title %@",title);
    }];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    titleLbl.text=self.sampleTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=touches.anyObject;
    //使用压力值(按压的力度)更改视图的背景颜色
    CGFloat value=touch.force/touch.maximumPossibleForce;
    self.view.backgroundColor=[UIColor colorWithRed:0.0 green:0.0 blue:value*0.8 alpha:1.0];
    
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
