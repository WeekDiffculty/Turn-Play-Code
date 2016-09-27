//
//  ShortcutsDetailViewController.h
//  01HomeScreen快捷选项
//
//  Created by qingyun on 16/9/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShortcutsDetailViewController : UITableViewController
@property(nonatomic,strong) UIApplicationShortcutItem *shortcutItem;
@property (weak,nonatomic) IBOutlet UITextField *titleField;
@property(weak,nonatomic) IBOutlet UITextField *subTitleField;
@property(weak,nonatomic) IBOutlet UIPickerView *pickView;
@property(nonatomic,strong) NSArray *pickerItems;//UIPickerView所有的元素

@end
