//
//  ShortcutsDetailViewController.m
//  01HomeScreen快捷选项
//
//  Created by qingyun on 16/9/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ShortcutsDetailViewController.h"

@interface ShortcutsDetailViewController ()<UITextFieldDelegate,UIPickerViewDelegate>

@end

@implementation ShortcutsDetailViewController
-(NSArray *) pickerItems{
    if (_pickerItems==nil) {
    _pickerItems=@[@"Compose",@"Play",@"Pause",@"Add",@"Location",@"Search",@"Share"];
    }
    return _pickerItems;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _titleField.text=_shortcutItem.localizedTitle;
    _subTitleField.text=_shortcutItem.localizedSubtitle;
    _titleField.delegate=self;
    _subTitleField.delegate=self;
    
    _pickView.delegate=self;
    
    //如果提供了icon,提供了userInfo,那么
    NSDictionary *userInfo=_shortcutItem.userInfo;
    if (userInfo.count!=0) {
        NSInteger selectRow=[userInfo[@"applicationShortcutUserInfoIconKey"] integerValue];
        [_pickView selectRow:selectRow inComponent:0 animated:YES];
    }
}
-(void)textFieldDidChanged:(NSNotification *)notification{

}
#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfRowsInComponent:(NSInteger)component{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.pickerItems.count;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
    return self.pickerItems[row];
}
//故事板中视图控制器之间跳转
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"segue%@",segue.identifier);
    //当点击Done的时候,此方法响应,更新shortcutItem值
    if ([segue.identifier isEqualToString:@"ShortcutDetailUpdated"]) {
        //获取pickerView选中的行
        NSInteger selectedRow=[_pickView selectedRowInComponent:0];
        //获取到的图标
        UIApplicationShortcutIcon *icon=[UIApplicationShortcutIcon iconWithType:selectedRow];
        _shortcutItem=[[UIApplicationShortcutItem alloc] initWithType:_shortcutItem.type localizedTitle:_titleField.text localizedSubtitle:_subTitleField.text icon:icon userInfo:@{@"applicationShortcutUserInfoIconKey":@(selectedRow)}];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
