//
//  ViewController.m
//  03-StackViewDemo
//
//  Created by 青云-wjl on 16/5/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()
//0.0 属性声明
@property (nonatomic, strong) UIStackView *verticalStackView;       //titleLabel、logoImageView、btnStackView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIStackView *btnStackView;


@property (nonatomic, strong) UIButton *addStarBtn;
@property (nonatomic, strong) UIButton *removeStarBtn;


@property (nonatomic, strong) UIStackView *horizontalStackView;
@end

@implementation ViewController
#pragma mark 懒加载
//1.1垂直stackview懒加载初始化
- (UIStackView *)verticalStackView {
    if (!_verticalStackView) {
        //创建一个垂直的stackView
        _verticalStackView = [[UIStackView alloc] init];
        _verticalStackView.axis = UILayoutConstraintAxisVertical;
        _verticalStackView.alignment = UIStackViewAlignmentCenter; //子视图的中心点居中
        _verticalStackView.distribution = UIStackViewDistributionEqualSpacing; //子视图间距相等
        _verticalStackView.spacing = 50; //间距
        

        [_verticalStackView addArrangedSubview:self.titleLabel];
        [_verticalStackView addArrangedSubview:self.logoImageView];
        [_verticalStackView addArrangedSubview:self.btnStackView];
    }
    return _verticalStackView;
}

//1.2 标题栏
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init]; //
        _titleLabel.text = @"Do you like me?";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _titleLabel;
}
//1.3 logo
- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        
        _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        //_logoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _logoImageView.clipsToBounds = YES;
    }
    return _logoImageView;
}
//1.4 按钮 懒加载
- (UIStackView *)btnStackView {
    
    if (!_btnStackView) {
        _btnStackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.addStarBtn, self.removeStarBtn]];
        _btnStackView.axis = UILayoutConstraintAxisHorizontal;
        _btnStackView.alignment = UIStackViewAlignmentCenter;
        _btnStackView.distribution = UIStackViewDistributionEqualSpacing;
        _btnStackView.spacing = 10;
    }
    return _btnStackView;
}

//1.5 添加 星号按钮
- (UIButton *)addStarBtn {
    
    if (!_addStarBtn) {
        
        _addStarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addStarBtn setTitle:@"add Star  " forState:UIControlStateNormal];
        [_addStarBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_addStarBtn addTarget:self action:@selector(addStarAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _addStarBtn;
}

//1.6 删除星号按钮
- (UIButton *)removeStarBtn {
    
    if (!_removeStarBtn) {
        
        _removeStarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_removeStarBtn setTitle:@"remove Star" forState:UIControlStateNormal];
        [_removeStarBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_removeStarBtn addTarget:self action:@selector(removeStarAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _removeStarBtn;
}
//1.7垂直stackview
- (UIStackView *)horizontalStackView {
    
    if (!_horizontalStackView) {
        _horizontalStackView = [[UIStackView alloc] init];
        _horizontalStackView.axis = UILayoutConstraintAxisHorizontal;
        _horizontalStackView.alignment = UIStackViewAlignmentCenter;
        _horizontalStackView.distribution = UIStackViewDistributionFillEqually;
        _horizontalStackView.spacing = 10;
    }
    return _horizontalStackView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.verticalStackView];
    // 设置masonry
    //3.1 设置垂直stackView
    [_verticalStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(20);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-200);
    }];
    
    [self.view addSubview:self.horizontalStackView];
    
    //3.2 设置水平stackView
    [_horizontalStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.verticalStackView.mas_bottom);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark 星号响应事件
//2.1添加星号响应事件
- (void)addStarAction:(UIButton *)sender {
    
    UIImageView *starImgVw = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
        starImgVw.contentMode = UIViewContentModeScaleAspectFit;
        //将UIIMageView添加至水平的stackView
        [self.horizontalStackView addArrangedSubview:starImgVw];
        [UIView animateWithDuration:0.25 animations:^{
            //刷新stackView
            [self.horizontalStackView layoutIfNeeded];
        }];
}
//2.2删除星号响应事件
- (void)removeStarAction:(UIButton *)sender {
        //删除最后一个星号
        UIView *star = self.horizontalStackView.arrangedSubviews.lastObject;
        [self.horizontalStackView removeArrangedSubview:star];
        [star removeFromSuperview];
        [UIView animateWithDuration:0.25 animations:^{
            //刷新stackView
            [self.horizontalStackView layoutIfNeeded];
        }];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
