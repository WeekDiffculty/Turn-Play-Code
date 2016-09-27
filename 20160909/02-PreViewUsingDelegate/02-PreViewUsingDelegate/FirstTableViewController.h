//
//  FirstTableViewController.h
//  02-PreViewUsingDelegate
//
//  Created by qingyun on 16/9/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTableViewController : UITableViewController<UITableViewDataSource,UIViewControllerPreviewingDelegate>
@property(nonatomic,strong) NSArray *sampleDatas;

@end
