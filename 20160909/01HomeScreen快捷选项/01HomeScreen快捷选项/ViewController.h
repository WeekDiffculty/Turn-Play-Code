//
//  ViewController.h
//  01HomeScreen快捷选项
//
//  Created by qingyun on 16/9/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITableView *tableView;
}
@property(nonatomic,strong) NSArray <UIApplicationShortcutItem *> *staticShortcuts;//静态快捷方式列表
@property(nonatomic,strong) NSMutableArray <UIApplicationShortcutItem *> *dynamicShortcuts;//动态快捷方式列表


@end

