//
//  ZYTabBarVC.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/10/25.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYTabBarVC.h"
#import "ZYHallTableViewController.h"
#import "ZYArenaViewController.h"
#import "ZYDiscoverTableTableViewController.h"
#import "ZYHistoryTableViewController.h"
#import "ZYMyLotteryViewController.h"

@interface ZYTabBarVC ()

@end

@implementation ZYTabBarVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupAllChildViewController];
    
}

// 添加所有的子控制器
- (void)setupAllChildViewController
{
    //1. 购彩大厅
    ZYHallTableViewController *hallVC = [[ZYHallTableViewController alloc] init];
    hallVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:hallVC];
    
    //2. 竞技场
    ZYArenaViewController *arenaVC = [[ZYArenaViewController alloc] init];
    arenaVC.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:arenaVC];
    
    //3. 发现
    ZYDiscoverTableTableViewController *discoverVC = [[ZYDiscoverTableTableViewController alloc] init];
    discoverVC.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:discoverVC];
    
    //4. 开奖信息
    ZYHistoryTableViewController *historyVC = [[ZYHistoryTableViewController alloc] init];
    historyVC.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:historyVC];
    
    //5. 我的彩票
    ZYMyLotteryViewController *myLotterVC = [[ZYMyLotteryViewController alloc] init];
    myLotterVC.view.backgroundColor = [UIColor purpleColor];
    [self addChildViewController:myLotterVC];
    
}

@end
