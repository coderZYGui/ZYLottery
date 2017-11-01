//
//  ZYDiscoverTableTableViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYDiscoverTableTableViewController.h"

@interface ZYDiscoverTableTableViewController ()

@end

@implementation ZYDiscoverTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

/**
 当View即将显示的时候调用
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 刷新tableView
    [self.tableView reloadData];
}

/**
 当cell将要显示的时候调用
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 当cell将要显示的时候从右往左做动画
    //1. 将cell平移到屏幕外
    cell.transform = CGAffineTransformMakeTranslation(self.view.width, 0);
    
    //2. 让cell复位
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}


@end
