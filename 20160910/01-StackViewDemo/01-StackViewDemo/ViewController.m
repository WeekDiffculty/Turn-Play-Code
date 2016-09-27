//
//  ViewController.m
//  01-StackViewDemo
//
//  Created by qingyun on 16/9/10.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)distribution:(UISegmentedControl *) sender{
    NSLog(@"%@",_imgStackView.arrangedSubviews);
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        switch (sender.selectedSegmentIndex) {
            case 0://填充整个UIStackView,并且根据内部子视图的尺寸进行动态调整
                _imgStackView.distribution=UIStackViewDistributionFill;
                break;
            case 1://根据视图的大小平均分配UIstackView 的尺寸,等比例填充UIstackView, 根据分配的大小改变视图的尺寸
                _imgStackView.distribution=UIStackViewDistributionFillEqually;
                break;
            case 2: //根据之前的比例填充StackView
                _imgStackView.distribution=UIStackViewDistributionFillProportionally;
                break;
            case 3://填充整个stackView,子视图没占满StackView,用空白平均填充子视图的间距,超出UIStackView,根据arrangedSubviews数组下标压缩子视图
                _imgStackView.distribution=UIStackViewDistributionEqualSpacing;
                break;
            case 4: //平均分配子视图中心点,使用这个中心点来布局视图,并且保持spacing距离,超出将重新布局子视图,并且压缩子视图
                _imgStackView.distribution=UIStackViewDistributionEqualCentering;
                break;
                
            default:
                break;
        }

    } completion:^(BOOL  finished){
    
    } ];
    
}
-(IBAction)alignment:(UISegmentedControl *) sender{
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        switch (sender.selectedSegmentIndex) {
            case 0://视图纵向填充
                _imgStackView.alignment=UIStackViewAlignmentFill;
                break;
            case 1://视图向顶部对齐
                _imgStackView.alignment=UIStackViewAlignmentTop;
                break;
            case 2://视图居中对齐
                _imgStackView.alignment=UIStackViewAlignmentCenter;
                break;
            case 3://视图向下对齐
                _imgStackView.alignment=UIStackViewAlignmentBottom;
                break;
            case 4://视图沿着基准线向下对齐
                _imgStackView.alignment=UIStackViewAlignmentFirstBaseline;
                break;
            case 5://视图沿着基准线向上对齐
                _imgStackView.alignment=UIStackViewAlignmentLastBaseline;
                break;
            default:
                break;
        }
    }completion:^(BOOL  finished){
        
    } ];
    
}
@end
