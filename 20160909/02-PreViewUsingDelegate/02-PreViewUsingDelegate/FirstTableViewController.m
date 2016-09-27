//
//  FirstTableViewController.m
//  02-PreViewUsingDelegate
//
//  Created by qingyun on 16/9/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "FirstTableViewController.h"
#import "PreViewDetailModel.h"
@interface FirstTableViewController ()

@end

@implementation FirstTableViewController
//懒加载 初始化数组
-(NSArray *) sampleDatas{
    if (_sampleDatas==nil) {
        PreViewDetailModel *smlModel=[PreViewDetailModel modelWithTitle:@"small" perferredHeight:160.0];
        PreViewDetailModel *mediumModel=[PreViewDetailModel modelWithTitle:@"Medium" perferredHeight:320.0];
        PreViewDetailModel *largeModel=[PreViewDetailModel modelWithTitle:@"Large" perferredHeight:0.0];
        _sampleDatas=@[smlModel,mediumModel,largeModel];
        
    }
    return _sampleDatas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //检查当前的设备是否支持3d touch功能
    if(self.traitCollection.forceTouchCapability==UIForceTouchCapabilityAvailable){
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
    }else{
        NSLog(@"该设备不支持3d touch");
    }
}
#pragma mark UIViewControllerPreViewingDelegate(ios 9.0以后有效)
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0){
    //获取单击单元格的indexpath
    NSIndexPath *seletctedIndexPath=[self.tableView indexPathForRowAtPoint:location];
    //根据indexpath 获取单元格
    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:seletctedIndexPath];
    //获取单元格对应模型
    PreViewDetailModel *model=self.sampleDatas[seletctedIndexPath.row];
    //获取当前选中单元格跳转的视图控制器
    UIViewController *secondVC=[self.storyboard instantiateViewControllerWithIdentifier:@"secondVC"];
    //设置视图控制器 预览的高度, 宽度需要设置为0,屏幕正常情况下,设置宽度无用
    secondVC.preferredContentSize=CGSizeMake(0.0, model.preferredHeight);
    //设置起始的矩形,所以周围的元素模糊化
    [previewingContext setSourceRect:cell.frame];
    //kvc方式传值
      [secondVC setValue:model.title forKey:@"sampleTitle"];
    return secondVC;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0){
    NSLog(@"commitViewController");
    [self showViewController:viewControllerToCommit sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"segue id %@",segue.identifier);
    if ([segue.identifier isEqualToString:@"gotosecondVC"]) {
        //kvc的方式传值
        PreViewDetailModel *model=self.sampleDatas[self.tableView.indexPathForSelectedRow.row];
        UIViewController *vc=segue.destinationViewController;
        [vc setValue:model.title forKey:@"sampleTitle"];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}
//设置单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.sampleDatas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    PreViewDetailModel *model=self.sampleDatas[indexPath.row];
    cell.textLabel.text=model.title;
    
    return cell;
}


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
