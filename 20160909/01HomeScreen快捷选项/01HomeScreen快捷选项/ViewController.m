//
//  ViewController.m
//  01HomeScreen快捷选项
//
//  Created by qingyun on 16/9/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//懒加载
-(NSArray <UIApplicationShortcutItem *> *)  staticShortcuts{
    if (_staticShortcuts==nil) {
        //
       NSArray *shortcuts =[NSBundle mainBundle].infoDictionary[@"UIApplicationShortcutItems"];
        if (shortcuts.count==0) {
            return @[];
        }
        NSMutableArray *shortcutItems=[NSMutableArray array];
        for (NSDictionary *dict in shortcuts) {
            //获取子标题
            NSString *shortcutSubtitle=dict[@"UIApplicationShortcutItemSubtitle"];
            //主标题
            NSString *shortcutTitle=dict[@"UIApplicationShortcutItemTitle"];
            NSString *shortcutType=dict[@"UIApplicationShortcutItemType"];
            NSString *shortcutIconType=dict[@"UIApplicationShortcutItemIconType"];
            //把info.plist中字典转换成 UIApplicationShortcutItem对象
            UIApplicationShortcutItem *appShortcutItem=[[UIApplicationShortcutItem alloc] initWithType:shortcutType localizedTitle:shortcutTitle localizedSubtitle:shortcutSubtitle icon:nil userInfo:nil];
            [shortcutItems addObject:appShortcutItem];
        }
        _staticShortcuts=shortcutItems;
        
    }

    return  _staticShortcuts;
}
//获取动态快捷方式列表
-(NSMutableArray <UIApplicationShortcutItem *> *) dynamicShortcuts{
    if (_dynamicShortcuts ==nil) {
        _dynamicShortcuts=(NSMutableArray *)[UIApplication sharedApplication].shortcutItems;
    }
    return _dynamicShortcuts;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"静态快捷方式数组元素的个数%ld",self.staticShortcuts.count);
    NSLog(@"动态快捷方式数组元素的个数%ld",self.dynamicShortcuts.count);
    tableView.delegate=self;
    tableView.dataSource=self;
}

#pragma mark UITableViewDataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section?self.dynamicShortcuts.count:self.staticShortcuts.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UIApplicationShortcutItem *shortItem=nil;
    //根据section来设置显示静态/动态的快捷方式
    if (indexPath.section==0) {
        shortItem=self.staticShortcuts[indexPath.row];
    }else{
        shortItem=self.dynamicShortcuts[indexPath.row];
    }
    cell.textLabel.text=shortItem.localizedTitle;
    cell.detailTextLabel.text=shortItem.localizedSubtitle;
    return cell;
}
//单击第二个section跳转页面
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return tableView.indexPathForSelectedRow.section?YES:NO;
}
//设置section标题
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @[@"Static",@"Dynamic"][section];
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"gotoShortcutDetail"]) {
        UIViewController *destVC=segue.destinationViewController;
        //kvc的方式传值
        [destVC setValue:self.dynamicShortcuts[tableView.indexPathForSelectedRow.row] forKey:@"shortcutItem"];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)done:(UIStoryboardSegue *) unwindSegue{
    NSLog(@"返回至上一级视图控制器");
    
    //获取到下一级视图控制器(源视图控制器)
    UIViewController *sourceVC=unwindSegue.sourceViewController;
    //获取已更改的快捷方式
    UIApplicationShortcutItem *updateShortcutItem=[sourceVC valueForKey:@"shortcutItem"];
    NSLog(@"%@",updateShortcutItem);
    //更改动态快捷方式中的值
    //动态快捷方式数组的值的更新,替换快捷方式元素的值
    [self.dynamicShortcuts replaceObjectAtIndex:tableView.indexPathForSelectedRow.row withObject:updateShortcutItem];
    
    //重置UIApplication对象当中的动态快捷方式
    [UIApplication sharedApplication].shortcutItems=self.dynamicShortcuts;
    //刷新单元格选中的行
    [tableView reloadRowsAtIndexPaths:@[tableView.indexPathForSelectedRow] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
