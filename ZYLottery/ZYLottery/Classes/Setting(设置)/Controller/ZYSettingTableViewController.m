//
//  ZYSettingTableViewController.m
//  ZYLottery
//
//  Created by 朝阳 on 2017/11/1.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYSettingTableViewController.h"
#import "ZYPushTableViewController.h"
#import "MBProgressHUD+XMG.h"

@interface ZYSettingTableViewController ()

@end

@implementation ZYSettingTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    // 第0组
    [self setupGroup0];
    
    // 第1组
    [self setupGroup1];
    
    // 第2组
    [self setupGroup2];
    
    
}

- (void)setupGroup0
{
    ZYSettingArrowItem *item = [ZYSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    //    item.destVC = [UIViewController class];
    
    // block 防止循环引用.
    // block 会对代码块中的强指针强引用,导致控制器无法释放
    /*
     block 会对self.navigationController 的self强引用着
     */
    // __strong
    //     __weak ZYSettingTableViewController *weakSelf = self;
    
    // typeof(x) 动态根据x判断x的真实类型
    __weak typeof(self) weakSelf = self;
    
    // 使用block跳转控制器传参
    item.OperationBlock = ^(NSIndexPath *indexPath){
        
        UIViewController *vc= [[UIViewController alloc] init];
        vc.navigationItem.title = @"ZY";
        vc.view.backgroundColor = [UIColor greenColor];
        
        [weakSelf.navigationController pushViewController:vc animated:YES];
        
    };
    
    // 把行模型都放到一个行模型数组中
    NSArray *items = @[item];
    // 把行模型数组放到组模型中
    ZYSettingGroup *group = [ZYSettingGroup groupWithItem:items];
    group.headerTitle = @"会当凌绝顶";
    group.footerTitle = @"一览众山小";
    
    //    item.type = ZYSettingItemRightViewStateArrow;
    
    // 把组模型放到 组模型数组中
    [self.groups addObject:group];
}

- (void)setupGroup1
{
    ZYSettingArrowItem *item11 = [ZYSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    //    item11.type = ZYSettingItemRightViewStateArrow;
    
    item11.destVC = [ZYPushTableViewController class];
    
    
    ZYSettingSwitchItem *item12 = [ZYSettingSwitchItem itemWithIcon:[UIImage imageNamed:@"handShake"] title:@"使用摇一摇机选"];
    //    item12.type = ZYSettingItemRightViewStateSwitch;
    item12.on = YES;
    
    ZYSettingItem *item13 = [ZYSettingSwitchItem itemWithIcon:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
    //    item13.type = ZYSettingItemRightViewStateSwitch;
    
    ZYSettingItem *item14 = [ZYSettingSwitchItem itemWithIcon:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手"];
    //    item14.type = ZYSettingItemRightViewStateSwitch;
    
    NSArray *items = @[item11,item12,item13,item14];
    
    ZYSettingGroup *group = [ZYSettingGroup groupWithItem:items];
    group.headerTitle = @"会当凌绝顶";
    group.footerTitle = @"一览众山小";
    
    [self.groups addObject:group];
}

- (void)setupGroup2
{
    // 创建行模型
    ZYSettingItem *item21 = [ZYSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"检查版本更新"];
    item21.OperationBlock = ^(NSIndexPath *indexPath){
        [MBProgressHUD showSuccess:@"没有版本更新"];
    };
    
    ZYSettingItem *item22 = [ZYSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    
    ZYSettingItem *item23 = [ZYSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    
    
    ZYSettingItem *item24 = [ZYSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    
    NSArray *items = @[item21, item22, item23, item24];
    
    ZYSettingGroup *group = [ZYSettingGroup groupWithItem:items];
    group.headerTitle = @"海内存知己";
    group.footerTitle = @"天涯若比邻";
    
    // 将行模型数组添加到数组总数
    [self.groups addObject:group];
    
}


@end
