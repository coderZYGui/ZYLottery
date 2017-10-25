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
    [self setupOneChildViewController:hallVC image:[UIImage imageNamed:@"TabBar_Hall_new"] selectImage:[UIImage imageNamed:@"TabBar_Hall_selected_new"]];
    
    
    //2. 竞技场
    ZYArenaViewController *arenaVC = [[ZYArenaViewController alloc] init];
    arenaVC.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:arenaVC];
    [self setupOneChildViewController:arenaVC image:[UIImage imageNamed:@"TabBar_Arena_new"] selectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]];
    
    //3. 发现
    ZYDiscoverTableTableViewController *discoverVC = [[ZYDiscoverTableTableViewController alloc] init];
    discoverVC.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:discoverVC];
    [self setupOneChildViewController:discoverVC image:[UIImage imageNamed:@"TabBar_Discovery_new"] selectImage:[UIImage imageNamed:@"TabBar_Discover_selected_new"]];
    
    //4. 开奖信息
    ZYHistoryTableViewController *historyVC = [[ZYHistoryTableViewController alloc] init];
    historyVC.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:historyVC];
    [self setupOneChildViewController:historyVC image:[UIImage imageNamed:@"TabBar_History_new"] selectImage:[UIImage imageNamed:@"TabBar_History_selected_new"]];
    
    //5. 我的彩票
    ZYMyLotteryViewController *myLotteryVC = [[ZYMyLotteryViewController alloc] init];
    myLotteryVC.view.backgroundColor = [UIColor purpleColor];
    [self addChildViewController:myLotteryVC];
    [self setupOneChildViewController:myLotteryVC image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selectImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]];
    
}

// 添加一个子控制器
- (void)setupOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage
{
    [self addChildViewController:vc];
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    // 取消图片的渲染
    vc.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
